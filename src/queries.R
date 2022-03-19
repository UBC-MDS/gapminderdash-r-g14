# Set global app variable gapminder_data
# so that we only need to instantiate this once

# load data
gapminder_data <- gapminder

# function get continents
get_continents <- function() {
  return (unique(gapminder_data$continent))
}

# function get countries
get_countries <- function(continent_code="All") {
  if (continent_code == "All") {
    return(unique(gapminder_data$country))
  }
  else {
    country_list <- gapminder_data %>%
      filter(continent == continent_code)
      country_list <- droplevels.factor(unique(country_list$country))
    return (country_list)
  }
}

create_continents_list <- function() {
  continent_list <- list(list("label" = "All",
                                   "value" = "All"))
  for (continent in get_continents()) {
    continent_list <- append(continent_list,
                             list(list("label" = continent,
                                       "value" = continent)))
  }
  return(continent_list)
}

create_countries_list <- function(continent_code="All") {
  country_list <- list()
  for (country in get_countries(continent_code)) {
    country_list <- append(country_list,
                           list(list("label" = country,
                                     "value" = country)))
  }
  return(country_list)
}

get_continent_data_filtered_year <- function(sel_year, sel_continent) {
  if (sel_continent == "All") {
    data <- gapminder_data %>%
      filter(year == sel_year)
  }
  else {
    data <- gapminder_data %>%
      filter(year == sel_year & continent == sel_continent)
  }
  return(data)
}

