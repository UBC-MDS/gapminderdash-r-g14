library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
#dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here('src', 'plotting.R'))

top_gdp_card <- dbcCard(
  dbcCardBody(
    list(
      h4("Top GDP", className = "card-title"),
      dccGraph(id="top-gdp-plot")
    )
  )
)