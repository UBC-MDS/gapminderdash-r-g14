library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
#dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here('src', 'queries.R'))

app_header <- dbcContainer(
  dbcRow(
    list(
      dbcCol(
        h3("GapminderDash", style=list("font-size" = "24px")),
        width = 3,
        style = list("color" = "white")
      ),
      dbcCol(
        dccDropdown(
          id = "continent-selector",
          options = create_continents_list(),
          value = 'All'
        ), 
      width = 4),
      dbcCol(
        dccDropdown(
          id = "country-selector",
          options = create_countries_list(),
          multi = TRUE
        )
        , width = 5)
    )
  ),
  className = "p-3",
  style = list("background-color" = "black"),
  fluid = TRUE
)



