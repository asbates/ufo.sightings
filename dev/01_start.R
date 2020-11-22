# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your application
golem::fill_desc(
  pkg_name = "ufo.sightings",
  pkg_title = "UFO Sightings Dashboard",
  pkg_description = "A dashboard of UFO sightings in the U.S.",
  author_first_name = "Andrew",
  author_last_name = "Bates",
  author_email = "andrewbates73@gmail.com",
  repo_url = NULL # The URL of the GitHub Repo (optional)
)

## Set {golem} options ----
golem::set_golem_options()

## Create Common Files ----
## See ?usethis for more information
usethis::use_mit_license( name = "Andrew Bates" )
#usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )
#usethis::use_news_md( open = FALSE )
usethis::use_readme_md()

## Use git ----
usethis::use_git()
# change 'master' to 'main'
# git branch -m main
usethis::use_github()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Use Recommended Packages ----
#golem::use_recommended_deps()
# i don't think i need all the recommended packages
usethis::use_package("shiny")
usethis::use_package("golem")
usethis::use_package("shinydashboard")
usethis::use_package("plotly")
# dev. need to figure out dependencies before shipping/uploading
usethis::use_package("shinipsum")

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::remove_favicon()
#golem::use_favicon() # path = "path/to/ico". Can be an online file.
# https://favicon.io/emoji-favicons/flying-saucer/

## Add helper functions ----
#golem::use_utils_ui()
#golem::use_utils_server()

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

