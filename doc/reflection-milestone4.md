# Milestone 4 Reflection Document

Links to our python and r apps: [Python-app](gapdash14.herokuapp.com/) and [R-app](gapdash14-r.herokuapp.com/)

## Dashboard Layout

The basic layout of our dashboard consists of 2 drop down menu options, 6 dash component cards and 3 different plots that summarize the metrics for the selected continents and countries. The dash component cards correspond to the highest/lowest (selected by the user) GDP, population and life expectancy for the input continent and provide the average value of the key statistics for the selected continent. Next, we have a time series plot for the GDP/Life Expectancy over the years. The plot is flexible in terms of its input and is updated based on selected country, continent and metric. On the bottom left, we have a bubble chart to represent the correlation between GDP and life expectancy for the input region. The bubbles on the graph vary by the population of the input variables which is useful in inferring about socioeconomic standing of the selected country/continent. In addition to a country/continent specific plot, we have included a bar chart that displays the top 10 countries of the selected continent in decreasing order of their GDP per capita. The horizontal bars are highlighted based on the countries selected for a country specific analysis.

## Limitations for DashR

Our team ran into challenges while trying to deploy the R app to Heroku. We faced a build error which referenced a lack of available buildpack for the project, which - according to Heroku documentation - are the means by which Heroku compiles applications and which "form backbone of Heroku's polyglot platform." [Heroku Buildpacks documentation](https://www.heroku.com/elements/buildpacks). We tracked down a viable buildpack located at <https://github.com/virtualstaticvoid/heroku-buildpack-r.git>, and created a new Heroku app specifying this as our source buildpack. While deployments using this new app were successful, we did notice a warning message displayed during the application build which read:

        package 'dashBootstrapComponents' is not available for this version of R

While it is not 100% clear that this is in fact responsible for issues with our ggplot2/plotly rendering in our production app, we could perhaps suspect that this warning may be indicative of the issues we see in our final product.

## Future Improvements for DashR

Based on our initial dashboard sketch, we plan to incorporate a help bar that documents the information contained by the plots and how to operate the filters. Next, we wish to make a map that adapts to the input countries and continents and visualizes the selected region on the world map.

## DashPy Improvements

Based on the feedback that we received from the TA, we modified our Python dashboard to include more human readable labels and axis titles. As highlighted on our peer review which we found were valuable suggestions, we improved the layout to make plots and legends more visible and added a collapsible help button to assist our users with the functionality of our dashboard. There was also some issue with our world map not rendering properly in the default view, which we fixed as part of our milestone 4.

## DashR and DashPy Differences

The overall layout of both the apps is almost the same. However, due to time constraints, we could not include the world map and the help button in our R dashboard.
