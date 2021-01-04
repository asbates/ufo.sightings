#' shape_ts UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_shape_ts_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        selectInput(
          ns("selected_shape"),
          "Select a shape",
          selected = "circle",
          choices = c(
            "changed",
            "changing",
            "chevron",
            "cigar",
            "circle",
            "cone",
            "crescent",
            "cross",
            "cylinder",
            "delta",
            "diamond",
            "disk",
            "egg",
            "fireball",
            "flare",
            "flash",
            "formation",
            "hexagon",
            "light",
            "other",
            "oval",
            "pyramid",
            "rectangle",
            "round",
            "sphere",
            "teardrop",
            "triangle",
            "unknown"
          )
        ),
        width = 2
      ),
      box(
        plotlyOutput(ns("shape_sightings_ts")),
        title = "Monthly Number of UFO Sightings In For",
        width = 10
      )
    )
  )
}

#' shape_ts Server Function
#'
#' @noRd
mod_shape_ts_server <- function(input, output, session){
  ns <- session$ns

  monthly_sightings <- reactive({
    monthly_sightings_by_shape <- ufosightings::monthly_sightings_by_shape

    monthly_sightings_by_shape[
      monthly_sightings_by_shape$shape == input$selected_shape
      ,
    ]
  })

  output$shape_sightings_ts <- renderPlotly({

    # 'crescent' shape only has 1 instance
    # when plotted with lines, nothing displays b/c there's nothing to connect
    #  with the lines
    # so make sure at least a point is displayed
    if (input$selected_shape == "crescent") {

      plot_ly(
        monthly_sightings(),
        x = ~ date,
        y = ~ sightings,
        mode = "markers",
        hoverinfo = "text",
        text = ~paste0(
          paste(month, year),
          ": ",
          scales::comma(sightings, accuracy = 1)
        ),
        marker = list(color = "#00a65a")
      ) %>%
        layout(
          xaxis = list(title = "Date"),
          yaxis = list(title = "Number of sightings"),
          title = input$selected_shape
        )
    } else {

      plot_ly(
        monthly_sightings(),
        x = ~ date,
        y = ~ sightings,
        hoverinfo = "text"
      ) %>%
        add_lines(
          text = ~paste0(
            paste(month, year),
            ": ",
            scales::comma(sightings, accuracy = 1)
          ),
          color = I("#00a65a")
        ) %>%
        layout(
          xaxis = list(title = "Date"),
          yaxis = list(title = "Number of sightings"),
          title = input$selected_shape
        )
    }

  })

}

## To be copied in the UI
# mod_shape_ts_ui("shape_ts_ui_1")

## To be copied in the server
# callModule(mod_shape_ts_server, "shape_ts_ui_1")

