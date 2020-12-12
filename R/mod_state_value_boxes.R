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
    fluidRow(
      valueBox(
        value = "NM",
        subtitle = "Most ever sightings in",
        icon = icon("binoculars"),
        color = "olive"
      ),
      valueBox(
        value = "CA",
        subtitle = "Most recent sighting in",
        icon = icon("binoculars"),
        color = "olive"
      )

    )
  )
}

#' state_value_boxes Server Function
#'
#' @noRd
mod_state_value_boxes_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_state_value_boxes_ui("state_value_boxes_ui_1")

## To be copied in the server
# callModule(mod_state_value_boxes_server, "state_value_boxes_ui_1")

