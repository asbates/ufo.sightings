# prepares data set for monthly sightings for each shape over time

library(tidyverse)
library(lubridate)
library(tsibble)

sightings <- read_csv("data-raw/sightings.csv")

monthly_sightings_by_shape <- sightings %>%
  select(-state) %>%
  replace_na(list(shape = "unknown")) %>%
  mutate(
    date = lubridate::floor_date(date, unit = "month")
  ) %>%
  count(date, shape, name = "sightings")

monthly_sightings_by_shape  <- monthly_sightings_by_shape %>%
  mutate(
    yearmon = tsibble::yearmonth(date)
  ) %>%
  tsibble::as_tsibble(index = yearmon, key = shape) %>%
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

usethis::use_data(monthly_sightings_by_shape, overwrite = TRUE)
