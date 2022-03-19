library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
# dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here('src', 'plotting.R'))

timeseries_card <- list(
    dbcRow(list(
        dbcContainer(
            list(
                dccTabs(
                    id = "timeseries-col",
                    value = "gdpPercap",
                    style = list("font-size" = "50%"),
                    children = list(
                        dccTab(
                            label = "GDP",
                            value = "gdpPercap",
                        ),
                        dccTab(
                            label = "Life Expectancy",
                            value = "lifeExp",
                        )
                    )
                )
            )
        ))),
    dbcRow(list(
            dbcCard(
                dbcCardBody(
                    list(
                        dccGraph(id="timeseries_plot")
                    )
                )
            )
        )) 
    )