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
        title = "Monthly Number of UFO Sightings In",
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

  monthly_sightings <- reactive({

    monthly_sightings_by_state <- ufo.sightings::monthly_sightings_by_state

    monthly_sightings_by_state[
      monthly_sightings_by_state$state == input$selected_state
      ,
    ]

  })


  output$state_sightings_ts <- renderPlotly({

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
        )
      ) %>%
      layout(
        xaxis = list(title = "Date"),
        yaxis = list(title = "Number of sightings"),
        title = input$selected_state
      )

  })

}

## To be copied in the UI
# mod_state_ts_ui("state_ts_ui_1")

## To be copied in the server
# callModule(mod_state_ts_server, "state_ts_ui_1")

