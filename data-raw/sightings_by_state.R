## code to prepare `sightings_by_state` dataset goes here
## prepares data sets (sf) for plotting map of U.S. with number of sightings
##  per state
##  see https://plotly-r.com/maps.html#ref-USAboundaries figure 4.14

library(tidyverse)
library(albersusa)
library(cartogram)
library(sf)

sightings <- read_csv("data-raw/sightings.csv")

us <- albersusa::usa_sf("laea") %>%
  select(
    state = iso_3166_2,
    geometry
  )

total_sightings_by_state <- sightings %>%
  count(state, name = "sightings") %>%
  inner_join(us, by = "state") %>%
  sf::st_sf()

total_sightings_by_state_dor <- cartogram::cartogram_dorling(
  total_sightings_by_state,
  "sightings"
)



usethis::use_data(total_sightings_by_state, overwrite = TRUE)
usethis::use_data(total_sightings_by_state_dor, overwrite = TRUE)
