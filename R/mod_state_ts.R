#' state_ts UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_state_ts_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        plotlyOutput(ns("state_sightings_ts")),
        title = "Sightings Over Time",
        width = 10
      ),
      box(
        selectInput(
          ns("selected_state"),
          "Select a State",
          choices = state.name,
          selected = "New Mexico"
        ),
        width = 2
      )
    )
  )
}

#' state_ts Server Function
#'
#' @noRd
mod_state_ts_server <- function(input, output, session){
  ns <- session$ns

  output$state_sightings_ts <- renderPlotly({
    random_ggplotly(type = "line")
  })

}

## To be copied in the UI
# mod_state_ts_ui("state_ts_ui_1")

## To be copied in the server
# callModule(mod_state_ts_server, "state_ts_ui_1")

