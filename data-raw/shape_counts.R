## prepares data set for total number of shapes (for bar chart)

library(tidyverse)


sightings <- read_csv("data-raw/sightings.csv")

shape_counts <- sightings %>%
  replace_na(list(shape = "unknown")) %>%
  count(shape, name = "sightings") %>%
  mutate(shape = fct_reorder(shape, -sightings))


usethis::use_data(shape_counts, overwrite = TRUE)
