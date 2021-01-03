#' state_value_boxes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_state_value_boxes_ui <- function(id){
  ns <- NS(id)
  tagList(
      valueBoxOutput(ns("average_sightings")),
      valueBoxOutput(ns("last_sighting"))
  )
}

#' state_value_boxes Server Function
#'
#' @importFrom stats na.omit
#'
#' @noRd
mod_state_value_boxes_server <- function(input, output, session, selected_state){
  ns <- session$ns

  monthly_sightings <- reactive({

    monthly_sightings_by_state <- ufo.sightings::monthly_sightings_by_state

    monthly_sightings_by_state[
      monthly_sightings_by_state$state == selected_state()
      ,
    ]

  })

  output$average_sightings <- renderValueBox({
    valueBox(
      value = scales::comma(
        mean(monthly_sightings()$sightings, na.rm = TRUE),
        accuracy = 0.1
      ),
      subtitle = "Average monthly sightings",
      icon = icon("eye"),
      color = "olive"
    )
  })

  # for last seen date
  # b/c implicit NAs, need to remove to get last month of actual sighting
  last_seen_date <- reactive({
    no_na <- stats::na.omit(monthly_sightings())
    month <- no_na[
      order(no_na$date, decreasing = TRUE),
      "month",
      drop = TRUE
      ][1]
    year <- no_na[
      order(no_na$date, decreasing = TRUE),
      "year",
      drop = TRUE
      ][1]

    paste(month, year)
  })

  output$last_sighting <- renderValueBox({
    valueBox(
      value = last_seen_date(),
      subtitle = "Last sighting in",
      icon = icon("calendar"),
      color = "olive"
    )
  })

}

## To be copied in the UI
# mod_state_value_boxes_ui("state_value_boxes_ui_1")

## To be copied in the server
# callModule(mod_state_value_boxes_server, "state_value_boxes_ui_1")

