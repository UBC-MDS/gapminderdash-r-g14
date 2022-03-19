# Milestone 4 Reflection Document

## Dashboard Layout

The basic layout of our dashboard consists of 2 drop down menu options, 6 dash component cards and 3 different plots that summarize the metrics for the selected continents and countries. The 3 dash component cards on the left display the countries corresponding to the highest/lowest (selected by the user) GDP, population and life expectancy for the input continent. The remaining 3 dash component cards below provide the average value of the key statistics for the selected continent. Next, we have a time series plot for the GDP/Life Expectancy over the years. The plot is flexible in terms of its input and is updated based on selected country, continent and metric. On the bottom left, we have a bubble chart to represent the correlation between GDP and life expectancy for the input region. The bubbles on the graph vary by the population of the input variables which is useful in inferring about socioeconomic standing of the selected country/continent. In addition to a country/continent specific plot, we have included a bar chart that displays the top 10 countries of the selected continent in decreasing order of their GDP per capita. The horizontal bars are highlighted based on the countries selected for a country specific analysis.

## Limitations

Our team ran into challenges while trying to deploy the R app to Heroku. We faced a build error which referenced a lack of available buildpack for the project, which - according to Heroku documentation - are the means by which Heroku compiles applications and which "form backbone of Heroku's polyglot platform." [Heroku Buildpacks documentation](https://www.heroku.com/elements/buildpacks). We tracked down a viable buildpack located at <https://github.com/virtualstaticvoid/heroku-buildpack-r.git>, and created a new Heroku app specifying this as our source buildpack. While deployments using this new app were successful, we did notice a warning message displayed during the application build which read:

        package 'dashBootstrapComponents' is not available for this version of R

While it is not 100% clear that this is in fact responsible for issues with our ggplot2/plotly rendering in our production app, we could perhaps suspect that this warning may be indicative of the issues we see in our final product.

Moreover, while the dashboard is an extremely useful tool to conduct a nation-wide analysis on performance indicators (GDP, life expectancy, population), it still has scope for improvement. Due to the time constraints, we were only able to implement key attributes of our dashboard with limited functionality. To begin with, the summary statistics for the input countries are only for the latest year of the dataset (2007). Furthermore, the axes labels for a few plots could be more human readable.

## Future Improvements

Based on our initial dashboard sketch, we plan to incorporate a help bar that documents the information contained by the plots and how to operate the filters. Next, we wish to make a map that adapts to the input countries and continents and visualizes the selected region on the world map. In addition, the structure of the dashboard could be made more streamlined for users to access important information easily. It would also be useful to explore the possibility of linking plots based on user input to shift focus on selected countries/continent.
