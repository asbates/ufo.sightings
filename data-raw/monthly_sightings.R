# prepares data set for monthly sightings in us over time

library(tidyverse)
library(lubridate)

sightings <- read_csv("data-raw/sightings.csv")

monthly_sightings <- sightings %>%
  select(-state) %>%
  mutate(
    date = lubridate::floor_date(date, unit = "month")
  ) %>%
  count(date, name = "sightings") %>%
  mutate(
    year = lubridate::year(date),
    month = lubridate::month(date, label = TRUE)
  )


usethis::use_data(monthly_sightings, overwrite = TRUE)
