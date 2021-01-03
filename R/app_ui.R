#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    dashboardPage(skin = "green",
      dashboardHeader(title = "UFO Sightings"),
      dashboardSidebar(
        collapsed = TRUE,
        sidebarMenu(
          id = "sidebar",
          menuItem(
            "National Overview",
            tabName = "national",
            icon = icon("flag-usa")
          ),
          menuItem(
            "State Overview",
            tabName = "state",
            icon = icon("map")
          ),
          menuItem(
            "UFO Shapes",
            tabName = "shapes",
            icon = icon("shapes")
          ),
          menuItem(
            "Source Code",
            icon = icon("file-code-o"),
            href = "https://github.com/asbates/ufo.sightings/"
          )
        )
      ),
      dashboardBody(
        tabItems(
          tabItem(
            tabName = "national",
            mod_national_main_ui("national_main_ui_1")
          ),
          tabItem(
            tabName = "state",
            mod_state_main_ui("state_main_ui_1")
          ),
          tabItem(
            tabName = "shapes",
            mod_shape_main_ui("shape_main_ui_1")
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

