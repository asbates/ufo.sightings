#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here

  callModule(mod_national_map_server, "national_map_ui_1")

  callModule(mod_national_ts_server, "national_ts_ui_1")

}
