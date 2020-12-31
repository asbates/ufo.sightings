## code to prepare `sightings` data set goes here
## this creates the baseline data set from which everything else is derived

library(tidyverse)
library(lubridate)

raw <- read_csv(
  "data-raw/scrubbed.csv",
  col_types = cols(
    .default = col_character()
  )
)

# non-u.s. states/provinces
states_to_exclude <- c(
  "ab",
  "yk",
  "bc",
  "mb",
  "nb",
  "nf",
  "nt",
  "ns",
  "on",
  "pe",
  "pq",
  "pr",
  "qc",
  "sa",
  "sk",
  "yt"
)


sightings <- raw %>%
  filter(!state %in% states_to_exclude) %>%
  filter(!is.na(state), !is.na(country)) %>%
  mutate(
    datetime = lubridate::parse_date_time(datetime, orders = "mdy HM"),
    date = lubridate::as_date(datetime),
    state = toupper(state)
  ) %>%
  filter(year(date) > 1970) %>%
  select(
    date,
    state
  )

write_csv(sightings, "data-raw/sightings.csv")
usethis::use_data(sightings, overwrite = TRUE)
