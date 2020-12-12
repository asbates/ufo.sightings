#' state_map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_state_map_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("state_sighting_totals")),
      title = "Number of UFO sightings per state",
      width = NULL
    )
  )
}

#' state_map Server Function
#'
#' @noRd
mod_state_map_server <- function(input, output, session){
  ns <- session$ns

  output$state_sighting_totals <- renderPlotly({
    random_ggplotly(type = "contour")
  })
}

## To be copied in the UI
# mod_state_map_ui("state_map_ui_1")

## To be copied in the server
# callModule(mod_state_map_server, "state_map_ui_1")

