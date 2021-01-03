#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom magrittr %>%
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here

  callModule(mod_national_main_server, "national_main_ui_1")

  callModule(mod_state_main_server, "state_main_ui_1")

  callModule(mod_shape_main_server, "shape_main_ui_1")

}
