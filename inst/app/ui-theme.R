# creates a custom theme for the UI

library(fresh)

create_theme(
  theme = "default",
  bs4dash_status(
    primary = "#3cd070",
    light =  "#c4c9cc" #"#f0f3f5" # navbar background
  ),
  bs4dash_sidebar_dark(
    bg = "#2b3236"
  ),
  bs4dash_layout(
    main_bg = "#c4c9cc",
    sidebar_width = "200px"
  ),
  bs4dash_vars(
    card_bg = "#e6edf2"
  ),
  output_file = "inst/app/www/theme.css"
)
