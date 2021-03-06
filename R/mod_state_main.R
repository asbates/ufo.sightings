#' state_main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_state_main_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      mod_state_selector_ui(ns("state_selector")),
      mod_state_value_boxes_ui(ns("state_value_boxes_ui_1"))
      ),
    fluidRow(
      bs4Dash::column(width = 12,
             mod_state_ts_ui(ns("state_ts_ui_1"))
      )
    )
  )
}

#' state_main Server Function
#'
#' @noRd
mod_state_main_server <- function(input, output, session){
  ns <- session$ns

  state <- callModule(mod_state_selector_server, "state_selector")
  callModule(mod_state_value_boxes_server, "state_value_boxes_ui_1", state)
  callModule(mod_state_ts_server, "state_ts_ui_1", state)

}

## To be copied in the UI
# mod_state_main_ui("state_main_ui_1")

## To be copied in the server
# callModule(mod_state_main_server, "state_main_ui_1")

