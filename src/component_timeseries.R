library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)


timeseries_card <- list(
    dbcRow(list(
        dbcContainer(
            list(
                dccTabs(
                    id = "timeseries-col",
                    value = "gdpPercap",
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