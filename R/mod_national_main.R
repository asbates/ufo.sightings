#' national_main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#'
#' @importFrom shiny NS tagList
mod_national_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    mod_national_value_boxes_ui(ns("national_value_boxes_ui_1")),
    fluidRow(
      bs4Dash::column(width = 12,
             mod_national_map_ui(ns("national_map_ui_1")),
             mod_national_ts_ui(ns("national_ts_ui_1"))
      )
    )
  )
}

#' national_main Server Function
#'
#' @noRd
mod_national_main_server <- function(input, output, session){
  ns <- session$ns

  callModule(mod_national_value_boxes_server, "national_value_boxes_ui_1")

  callModule(mod_national_map_server, "national_map_ui_1")

  callModule(mod_national_ts_server, "national_ts_ui_1")
}

## To be copied in the UI
# mod_national_main_ui("national_main_ui_1")

## To be copied in the server
# callModule(mod_national_main_server, "national_main_ui_1")

