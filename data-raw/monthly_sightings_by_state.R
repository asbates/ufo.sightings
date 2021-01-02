# prepares data set for monthly sightings for each state over time

library(tidyverse)
library(lubridate)
library(tsibble)

sightings <- read_csv("data-raw/sightings.csv")

monthly_sightings_by_state <- sightings %>%
  mutate(
    date = lubridate::floor_date(date, unit = "month")
  ) %>%
  count(date, state, name = "sightings")

# fill implicit missing
# need to temporarily add a year-month variable so tsibble recognizes
#  the frequency
monthly_sightings_by_state <- monthly_sightings_by_state %>%
  mutate(
    yearmon = tsibble::yearmonth(date)
  ) %>%
  tsibble::as_tsibble(index = yearmon, key = state) %>%
  tsibble::fill_gaps(.full = TRUE) %>%
  mutate(
    date = lubridate::as_date(yearmon),
    year = lubridate::year(date),
    month = lubridate::month(date, label = TRUE)
  ) %>%
  as_tibble() %>%
  select(
    -yearmon
  )

usethis::use_data(monthly_sightings_by_state, overwrite = TRUE)
