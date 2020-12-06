#' national_ts UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_national_ts_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("national_sightings_ts")),
      title = "Sightings Over Time",
      width = NULL
    )
  )
}

#' national_ts Server Function
#'
#' @import plotly
#' @importFrom shinipsum random_ggplotly
#' @noRd
mod_national_ts_server <- function(input, output, session){
  ns <- session$ns

  output$national_sightings_ts <- renderPlotly({
    random_ggplotly(type = "line")
  })
}

## To be copied in the UI
# mod_national_ts_ui("national_ts_ui_1")

## To be copied in the server
# callModule(mod_national_ts_server, "national_ts_ui_1")

