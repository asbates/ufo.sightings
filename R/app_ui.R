#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    dashboardPage(
      dashboardHeader(),
      dashboardSidebar(
        title = "UFO Sightings",
        sidebar_collapsed = TRUE,
        sidebarMenu(
          id = "sidebar",
          menuItem(
            "National Overview",
            tabName = "national",
            icon = "flag-usa"
          ),
          menuItem(
            "State Overview",
            tabName = "state",
            icon = "map"
          ),
          menuItem(
            "UFO Shapes",
            tabName = "shapes",
            icon = "shapes"
          ),
          menuItem(
            "Source Code",
            icon = "file-code",
            tabName = "source"
            #href = "https://github.com/asbates/ufosightings/"
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
          ),
          # temporary workaround b/c current version of bs4Dash doesn't
          #  allow link in tabItem()
          # https://github.com/RinteRface/bs4Dash/issues/123
          # i tried installing dev version of bs4Dash
          # it required lot's of other dev versions and was broken so reverted
          tabItem(
            tabName = "source",
            tags$html(
              p(
                "Find the source code for this app",
                a("here",
                  href = "https://github.com/asbates/ufosightings/",
                  target = "_blank")
              )
            )
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
      app_title = 'ufosightings'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

