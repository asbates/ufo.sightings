
# UFO Sightings


*UFO Sightings* is a [Shiny](https://shiny.rstudio.com/) dashboard for 
 information of UFO sightings in the United States.
You can find the app [here](https://asbates.shinyapps.io/ufosightings/).

The data used for this dashboard comes from a 
 [Kaggle Dataset](https://www.kaggle.com/NUFORC/ufo-sightings?select=scrubbed.csv)
 that compiles reports of unidentified flying objects.
Reports of UFOs date from about 1910 to 2013.
This dashboard uses a subset of the full data, focusing on the U.S. since 1970.

I started this project to learn more about the Shiny ecosystem beyond the base
 package.
In particular, I was interested in learning about the
 [golem](https://thinkr-open.github.io/golem/index.html) package and using
 Shiny modules.
These are both tools that help make a Shiny app more production ready, which
 is sort of another overarching goal with this project.
This app also uses [shinydashboard](https://rstudio.github.io/shinydashboard/),
 a package for building dashboards in Shiny, and 
 [plotly](https://plotly.com/r/) for interactive graphics.


## Installation

Since the application was built using the `golem` framework, you can install
 it like you would an R package:

``` r
remotes::install_github("asbates/ufosightings")
```

If you do install the app locally, you can run it with the `run_dev.R` file in
 the `dev/` folder.

