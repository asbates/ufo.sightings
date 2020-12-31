#' national_ts UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom scales comma
mod_national_ts_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("national_sightings_ts")),
      title = "Monthly Number of UFO Sightings In The U.S.",
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

  monthly_sightings <- ufo.sightings::monthly_sightings

  output$national_sightings_ts <- renderPlotly({

    plot_ly(
      monthly_sightings,
      x = ~ date,
      y = ~ sightings,
      hoverinfo = "text"
    ) %>%
      add_lines(
        text = ~paste0(
          paste(month, year),
          ": ",
          scales::comma(sightings, accuracy = 1)
          )
      ) %>%
      layout(
        xaxis = list(title = "Date"),
        yaxis = list(title = "Number of sightings")
      )

  })
}

## To be copied in the UI
# mod_national_ts_ui("national_ts_ui_1")

## To be copied in the server
# callModule(mod_national_ts_server, "national_ts_ui_1")

