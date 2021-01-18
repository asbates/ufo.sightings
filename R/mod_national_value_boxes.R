#' national_value_boxes UI Function
#'
#' @description Module for national page value boxes.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom scales comma
mod_national_value_boxes_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      valueBoxOutput(ns("total_sightings_vb")),
      valueBoxOutput(ns("most_recent_sighting"))
    )
  )
}

#' national_value_boxes Server Function
#'
#' @noRd
mod_national_value_boxes_server <- function(input, output, session){
  ns <- session$ns

  sightings <- ufosightings::sightings

  output$total_sightings_vb <- renderValueBox({
    valueBox(
      value = scales::comma(nrow(sightings), accuracy = 1),
      subtitle = "Total UFO sightings",
      icon = "binoculars",
      status = "primary"
    )
  })

  output$most_recent_sighting <- renderValueBox({
    valueBox(
      value = sightings[
        order(sightings$date, decreasing = TRUE),
        "state",
        drop = TRUE
        ][1],
      subtitle = "Most recent sighting in",
      icon = "eye",
      status = "primary"
    )
  })

}

## To be copied in the UI
# mod_national_value_boxes_ui("national_value_boxes_ui_1")

## To be copied in the server
# callModule(mod_national_value_boxes_server, "national_value_boxes_ui_1")

