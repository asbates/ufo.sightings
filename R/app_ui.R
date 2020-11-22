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
        fluidRow(
          valueBox(
            value = scales::comma(12345),
            subtitle = "Total UFO Sightings",
            #icon = icon("binoculars"),
            color = "olive"
          ),
          valueBox(
            value = 45,
            subtitle = "Average Sightings Per Year",
            icon = icon("eye"),
            color = "olive"
          ),
          valueBox(
            value = 86,
            subtitle = "Most Sightings In A Year",
            icon = icon("glasses"),
            color = "olive"
          )
        ),

        fluidRow(
          column(width = 12,
            box(
              plotlyOutput("sighting_locations"),
              title = "UFO Sighting Locations",
              width = NULL
            ),
            box(
              plotlyOutput("sightings_over_time_us"),
              title = "Sightings Over Time",
              width = NULL
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
      app_title = 'ufo.sightings'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

