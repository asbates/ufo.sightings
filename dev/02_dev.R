# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
#usethis::use_package( "thinkr" )

# -- adds maggritr pipe ---
# used in generating plots
usethis::use_pipe(export = FALSE)
# then follow directions
# i put the roxygen comment in app_server.R

## Add modules ----
## Create a module infrastructure in R/
# --- for national level page ---
golem::add_module( name = "national_value_boxes" )
golem::add_module( name = "national_map" )
golem::add_module( name = "national_ts" )
golem::add_module( name = "national_main" ) # main module for national page

# --- for state level page ---
golem::add_module( name = "state_value_boxes" )
#golem::add_module( name = "state_map" )
golem::add_module( name = "state_ts" )
golem::add_module( name = "state_main" )
golem::add_module( name = "state_selector" )

# --- for shapes page ---
golem::add_module( name = "shape_bar" )
golem::add_module( name = "shape_ts" )
golem::add_module( name = "shape_main" )

## Add helper functions ----
## Creates ftc_* and utils_*
#golem::add_fct( "helpers" )
#golem::add_utils( "helpers" )

## External resources
## Creates .js and .css files at inst/app/www
#golem::add_js_file( "script" )
#golem::add_js_handler( "handlers" )
#golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
#usethis::use_data_raw( name = "my_dataset", open = FALSE )
usethis::use_data_raw(name = "sightings")

## Tests ----
## Add one line by test you want to create
#usethis::use_test( "app" )

# Documentation

## Vignette ----
#usethis::use_vignette("ufosightings")
#devtools::build_vignettes()

## Code coverage ----
## (You'll need GitHub there)
#usethis::use_github()
#usethis::use_travis()
#usethis::use_appveyor()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

