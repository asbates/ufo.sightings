#' state_selector UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import datasets
mod_state_selector_ui <- function(id){
  ns <- NS(id)
  tagList(
    box(
      selectInput(
        ns("selected_state"),
        "Select a State",
        choices = datasets::state.name,
        selected = "New Mexico"
      ),
      width = 4,
      status = "primary"
    )
  )
}

#' state_selector Server Function
#'
#' @noRd
mod_state_selector_server <- function(input, output, session){
  ns <- session$ns

  return(
    reactive({ input$selected_state })
  )

}

## To be copied in the UI
# mod_state_selector_ui("state_selector_ui_1")

## To be copied in the server
# callModule(mod_state_selector_server, "state_selector_ui_1")

