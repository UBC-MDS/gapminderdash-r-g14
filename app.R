library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)
library(here)
library(ggplot2)
library(remotes)
library(readr)
library(plotly)
library(gapminder)
library(tidyverse)

# path to current work directory
#dir_path <- dirname(getSourceEditorContext()$path)

# load external functions
source(here('src', 'queries.R'))
source(here('src', 'component_app_header.R'))
source(here('src', 'component_topgdp.R'))
source(here('src', 'component_countries_kpis.R'))
source(here('src', 'component_continent_kpis.R'))
source(here('src', 'component_gdplifeexp.R'))


app <- Dash$new(external_stylesheets = dbcThemes$BOOTSTRAP)

# Sync continents and countries in filter
app$callback(
  output("country-selector", 'options'),
  list(input("continent-selector", 'value')),
  function(selected_continent) {
    return(create_countries_list(selected_continent))
  }
)

# Update Top GDP plot
app$callback(
  output('top-gdp-plot', 'figure'),
  list(input('continent-selector', 'value'),
       input("country-selector", 'value')),
  function(selected_continent, selected_countries) {
    return(plot_topGdp(selected_continent, selected_countries))
  })

# Update Country KPIs
app$callback(
  list(
    output('gdp_country', 'children'),
    output('pop_country', 'children'),
    output('lifeexp_country', 'children'),
    output('gdp_value', 'children'),
    output('pop_value', 'children'),
    output('lifeexp_value', 'children')
  ),
  list(
    input('continent-selector', 'value'),
    input('country-selector', 'value'),
    input('country-kpi-type', 'value')
  ),
  function(selected_continent, selected_countries, country_kpi_type) {
    return(plot_countries_kpis(selected_continent, selected_countries, country_kpi_type))
  })

# Update Continent KPIs
app$callback(
  list(
    output('continent-mean-gdp', 'children'),
    output('continent-mean-pop', 'children'),
    output('continent-mean-lifeexp', 'children')
  ),
  list(
    input('continent-selector', 'value'),
    input('country-selector', 'value')),
  function(selected_continent, selected_countries) {
    return(plot_continent_kpis(selected_continent, selected_countries))
  })

#Update GDP vs LifeExp Plot
app$callback(
  output('gdp_lifeexp_plot', 'figure'),
  list(
    input('continent-selector', 'value'),
    input('country-selector', 'value')
    ),
  function(selected_continent, selected_countries) {
    return(plot_gdp_lifeexp(selected_continent, selected_countries))
  })


app %>% set_layout(
  list(
    dbcContainer(dbcRow(app_header), fluid = TRUE),
    dbcContainer(
      list(
        dbcRow(
          list(
            dbcCol(
              list(
                dbcRow(dbcCol(h1('map'), width = 12)),
                dbcRow(dbcCol(h1(countries_kpi_cards_div), width = 12)),
                dbcRow(dbcCol(h1(continent_kpi_cards), width = 12))
              ),
              width = 6
            ),
            dbcCol(
              list(
                dbcRow(dbcCol(h1('timeseries_card'), width = 12)),
                dbcRow(dbcCol(h1(top_gdp_card), width = 12)),
                dbcRow(dbcCol(h1(gdp_lifeexp_card), width = 12))
              ),
              width = 6
            )
          )
        )
      ),
      className = "mb-3"
    )
  )
)


# Run the app
#app$run_server(host = '0.0.0.0')
app %>% run_app()