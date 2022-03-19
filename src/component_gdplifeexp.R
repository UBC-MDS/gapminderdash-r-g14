library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
#dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here('src', 'plotting.R'))

gdp_lifeexp_card <- dbcCard(
  dbcCardBody(
    list(
      h4("Life Expectancy vs GDP", className = "card-title"),
      dccGraph(id="gdp_lifeexp_plot")
    )
  )
)