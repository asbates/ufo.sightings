#' national_map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom scales comma
#' @import plotly
mod_national_map_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("sightings_per_state_map")),
      title = "Total Number of UFO Sightings In The U.S",
      width = NULL
    )
  )
}

#' national_map Server Function
#'
#' @import plotly
#' @noRd
mod_national_map_server <- function(input, output, session){
  ns <- session$ns

  total_sightings_by_state <- ufo.sightings::total_sightings_by_state
  total_sightings_by_state_dor <- ufo.sightings::total_sightings_by_state_dor

  output$sightings_per_state_map <- renderPlotly({

    plot_ly(stroke = I("black"), span = I(1)) %>%
      add_sf(
        data = total_sightings_by_state,
        color = I("gray95"),
        hoverinfo = "none"
      ) %>%
      add_sf(
        data = total_sightings_by_state_dor,
        color = ~sightings,
        split = ~state,
        text = ~paste(
          paste0(state, ":"),
          scales::comma(sightings, accuracy = 1)
          ),
        hoverinfo = "text",
        hoveron = "fills"
      ) %>%
      layout(showlegend = FALSE)
  })

}

## To be copied in the UI
# mod_national_map_ui("national_map_ui_1")

## To be copied in the server
# callModule(mod_national_map_server, "national_map_ui_1")

