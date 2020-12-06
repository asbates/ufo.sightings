#' national_map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import plotly
mod_national_map_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("national_sighting_locations")),
      title = "UFO Sighting Locations",
      width = NULL
    )
  )
}

#' national_map Server Function
#'
#' @import plotly
#' @importFrom shinipsum random_ggplotly
#' @noRd
mod_national_map_server <- function(input, output, session){
  ns <- session$ns

  output$national_sighting_locations <- renderPlotly({
    random_ggplotly(type = "contour")
  })

}

## To be copied in the UI
# mod_national_map_ui("national_map_ui_1")

## To be copied in the server
# callModule(mod_national_map_server, "national_map_ui_1")

