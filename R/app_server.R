#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import plotly
#' @importFrom shinipsum random_ggplotly
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here

  output$sighting_locations <- renderPlotly({
    random_ggplotly(type = "contour")
  })

  output$sightings_over_time_us <- renderPlotly({
    random_ggplotly(type = "line")
  })
}
