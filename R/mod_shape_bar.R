#' shape_bar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_shape_bar_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      plotlyOutput(ns("shape_bar_chart")),
      title = "Number of Sightings of Each Shape",
      width = 12
    )
  )
}

#' shape_bar Server Function
#'
#' @noRd
mod_shape_bar_server <- function(input, output, session){
  ns <- session$ns

  shape_counts <- ufo.sightings::shape_counts

  output$shape_bar_chart <- renderPlotly({

    plot_ly(
      shape_counts,
      x = ~ shape,
      y = ~ sightings,
      hoverinfo = "text"
    ) %>%
      add_bars(
        text = ~paste(scales::comma(sightings, accuracy = 1))
      )
  })

}

## To be copied in the UI
# mod_shape_bar_ui("shape_bar_ui_1")

## To be copied in the server
# callModule(mod_shape_bar_server, "shape_bar_ui_1")

