library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
#dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here('src', 'plotting.R'))

continent_kpi_cards <- dbcCard(
  dbcCardBody(
    list(
      h4("Continent Key Stats", className = "card-title"),
      dbcRow(
        list(
          dbcCol(
            dbcCard(
              list(
                dbcCardBody(
                  list(
                    h4("GDP", className="card-title", style=(list(
                      "font-size" = "24px", "font-weight" = "lighter",
                      "text-align" = "center"
                    ))),
                    h4("mean",
                      className="card-title", style=list(
                        "font-size" = "16px", "font-weight" = "lighter",
                        "text-align" = "center"
                      )),
                    p("-", id="continent-mean-gdp",
                      className="card-text", style=list(
                        "font-size" = "13px", "font-weight" = "lighter",
                        "text-align" = "center"
                      ))
                  )
                )
              ), color="primary", inverse=TRUE,
              style = list("min-height" = "200px")
            ), width = 4
          ),
          dbcCol(
            dbcCard(
              list(
                dbcCardBody(
                  list(
                    h4("Population", className="card-title", style=(list(
                      "font-size" = "24px", "font-weight" = "lighter",
                      "text-align" = "center"
                    ))),
                    h4("mean",
                       className="card-title", style=list(
                         "font-size" = "16px", "font-weight" = "lighter",
                         "text-align" = "center"
                       )),
                    p("-", id="continent-mean-pop",
                      className="card-text", style=list(
                        "font-size" = "13px", "font-weight" = "lighter",
                        "text-align" = "center"
                      ))
                  )
                )
              ), color="info", inverse=TRUE,
              style = list("min-height" = "200px")
            ), width = 4
          ),
          dbcCol(
            dbcCard(
              list(
                dbcCardBody(
                  list(
                    h4("Life Expectancy", className="card-title", style=(list(
                      "font-size" = "24px", "font-weight" = "lighter",
                      "text-align" = "center"
                    ))),
                    h4("mean",
                       className="card-title", style=list(
                         "font-size" = "16px", "font-weight" = "lighter",
                         "text-align" = "center"
                       )),
                    p("-", id="continent-mean-lifeexp",
                      className="card-text", style=list(
                        "font-size" = "13px", "font-weight" = "lighter",
                        "text-align" = "center"
                      ))
                  )
                )
              ), color="secondary", inverse=TRUE,
              style = list("min-height" = "200px")
            ), width = 4
          )
        )
      )
    )
  )
)





