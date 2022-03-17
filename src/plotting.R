library(ggplot2)
library(plotly)
library(tidyverse)

# path to current work directory
dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here(dir_path, 'src/queries.R'))

plot_topGdp <-  function(selected_continent="All", selected_countries=NULL) {
  plot_data <- get_continent_data_filtered_year(2007, selected_continent) %>%
    arrange(gdpPercap) %>%
    slice_max(gdpPercap, n=10)
  
  plot_data$highlight <- FALSE
  # If countries are selected
  if (!is.null(selected_countries)){
    selected_countries_data <- get_continent_data_filtered_year(2007,
                                                                selected_continent) %>%
      filter(country %in% selected_countries) %>%
      arrange(gdpPercap) %>%
      mutate(highlight = TRUE)
  }
  
  plot_data <- rbind(plot_data, selected_countries_data)
  plot_data <- plot_data %>%
    distinct(country, .keep_all = TRUE)
  
  plot <- ggplot(plot_data) +
    aes(x=gdpPercap, y=reorder(country, gdpPercap), fill=highlight) +
    geom_bar(stat = 'identity') + theme(legend.position="none") +
    labs(x = 'GDP per cap', y = 'Countries')
  
  ggplotly(plot, width = 600, height = 220)
}

plot_countries_kpis <- function(selected_continent="All", 
                                selected_countries=NULL,
                                country_kpi_type=1) {
  kpi_data <- get_continent_data_filtered_year(2007, selected_continent)

  # Show highest or lowest based on user selection
  if (country_kpi_type == 1) {
    gdp_country <- kpi_data %>% 
      slice_max(gdpPercap, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    pop_country <- kpi_data %>% 
      slice_max(pop, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    lifeexp_country <- kpi_data %>% 
      slice_max(lifeExp, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    gdp_value <- kpi_data %>% 
      slice_max(gdpPercap, n=1) %>%
      select(gdpPercap) %>%
      droplevels() %>%
      pull(gdpPercap)
    
    pop_value <- kpi_data %>% 
      slice_max(pop, n=1) %>%
      select(pop) %>%
      droplevels() %>%
      pull(pop)
    
    lifeexp_value <- kpi_data %>% 
      slice_max(lifeExp, n=1) %>%
      select(lifeExp) %>%
      droplevels() %>%
      pull(lifeExp)
    }
  else {
    gdp_country <- kpi_data %>% 
      slice_min(gdpPercap, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    pop_country <- kpi_data %>% 
      slice_min(pop, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    lifeexp_country <- kpi_data %>% 
      slice_min(lifeExp, n=1) %>%
      select(country) %>%
      droplevels() %>%
      pull(country)
    
    gdp_value <- kpi_data %>% 
      slice_min(gdpPercap, n=1) %>%
      select(gdpPercap) %>%
      droplevels() %>%
      pull(gdpPercap)
    
    pop_value <- kpi_data %>% 
      slice_min(pop, n=1) %>%
      select(pop) %>%
      droplevels() %>%
      pull(pop)
    
    lifeexp_value <- kpi_data %>% 
      slice_min(lifeExp, n=1) %>%
      select(lifeExp) %>%
      droplevels() %>%
      pull(lifeExp)
    }
    
  return (
    list(
      gdp_country,
      pop_country,
      lifeexp_country,
      gdp_value,
      pop_value,
      lifeexp_value
    ))
}

plot_continent_kpis <- function(selected_continent="All", 
                                selected_countries=NULL) {
  kpi_data <- get_continent_data_filtered_year(2007, selected_continent)
  if (selected_continent == "All") {
    continent_mean_gdp <- mean(kpi_data$gdpPercap)
    continent_mean_pop <- mean(kpi_data$pop)
    continent_mean_lifeexp <- mean(kpi_data$lifeExp)
  }
  else {
    continent_mean_gdp <- kpi_data %>% 
      group_by(continent) %>%
      summarise(mean = mean(gdpPercap)) %>%
      pull(mean)
    
    continent_mean_pop <- kpi_data %>% 
      group_by(continent) %>%
      summarise(mean = mean(pop)) %>%
      pull(mean)
    
    continent_mean_lifeexp <- kpi_data %>% 
      group_by(continent) %>%
      summarise(mean = mean(lifeExp)) %>%
      pull(mean)
    
  }
  return(list(round(continent_mean_gdp, 2),
         round(continent_mean_pop, 2),
         round(continent_mean_lifeexp, 2)))
}



