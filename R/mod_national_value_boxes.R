#' national_value_boxes UI Function
#'
#' @description Module for national page value boxes.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_national_value_boxes_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      valueBox(
        value = scales::comma(12345),
        subtitle = "Total UFO Sightings",
        #icon = icon("binoculars"),
        color = "olive"
      ),
      valueBox(
        value = 45,
        subtitle = "Average Sightings Per Year",
        icon = icon("eye"),
        color = "olive"
      ),
      valueBox(
        value = 86,
        subtitle = "Most Sightings In A Year",
        icon = icon("glasses"),
        color = "olive"
      )
    )
  )
}

#' national_value_boxes Server Function
#'
#' @noRd
mod_national_value_boxes_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_national_value_boxes_ui("national_value_boxes_ui_1")

## To be copied in the server
# callModule(mod_national_value_boxes_server, "national_value_boxes_ui_1")

