
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
This app also uses [bs4Dash](https://rinterface.github.io/bs4Dash/),
 a dashboard package built with Bootstrap 4, and 
 [fresh](https://dreamrs.github.io/fresh/), a package for UI themes
 and styling.
For the graphics, I used [plotly](https://plotly.com/r/) for it's interactivity.


## Installation

Since the application was built using the `golem` framework it's actually an R
 package, with some additional structure.
You can run it locally by downloading this repository and running the 
 `run_dev.R` file in the `dev/` folder.
 
You can also install it with 

```
remotes::install_github("asbates/ufosightings")
```

and then run

```
ufosightings::run_app()
```
