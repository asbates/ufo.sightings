#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import plotly
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    dashboardPage(skin = "green",
      dashboardHeader(title = "UFO Sightings"),
      dashboardSidebar(),
      dashboardBody(
        mod_national_value_boxes_ui("national_value_boxes_ui_1"),
        fluidRow(
          column(width = 12,
            mod_national_map_ui("national_map_ui_1"),
            mod_national_ts_ui("national_ts_ui_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ufo.sightings'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

