
# UFO Sightings

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

*UFO Sightings* is a [Shiny](https://shiny.rstudio.com/) dashboard for 
 information of UFO sightings in the United States.
The data used for this dashboard comes from a 
 [Kaggle Dataset](https://www.kaggle.com/NUFORC/ufo-sightings?select=scrubbed.csv)
 that compiles reports of unidentified flying objects.
Reports of UFOs date from about 1910 to 2013.
This dashboard uses a subset of the full data, focusing on the U.S.

I started this project to learn more about the Shiny ecosystem beyond the base
 package.
In particular, I was interested in learning about the
 [golem](https://thinkr-open.github.io/golem/index.html) package and using
 Shiny modules.
These are both tools that help make a Shiny app more production ready, which
 is sort of another overarching goal with this project.
In that vein, I'd like to learn more about things like testing Shiny apps and
 setting up CI/CD.


## Installation

Since the application was built using the `golem` framework, you can install
 it like you would an R package:

``` r
remotes::install_github("asbates/ufosightings")
```

*UFO Sightings* is not yet available on the web but you can run it locally
 by running the `run_dev.R` file in the `dev/` folder.

