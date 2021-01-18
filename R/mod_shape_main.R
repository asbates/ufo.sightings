#' shape_main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_shape_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    # fluidRow(
    #   mod_shape_bar_ui("shape_bar_ui_1")
    # ),
    # fluidRow(
    #   mod_shape_ts_ui("shape_ts_ui_1")
    # )
    fluidRow(
      bs4Dash::column(width = 12,
        mod_shape_bar_ui(ns("shape_bar_ui_1")),
        mod_shape_ts_ui(ns("shape_ts_ui_1"))
      )
    )
  )
}

#' shape_main Server Function
#'
#' @noRd
mod_shape_main_server <- function(input, output, session){
  ns <- session$ns

  callModule(mod_shape_bar_server, "shape_bar_ui_1")
  callModule(mod_shape_ts_server, "shape_ts_ui_1")
}

## To be copied in the UI
# mod_shape_main_ui("shape_main_ui_1")

## To be copied in the server
# callModule(mod_shape_main_server, "shape_main_ui_1")

