library(dash)
library(dashCoreComponents)
library(dashBootstrapComponents)

# path to current work directory
dir_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# load external functions
source(here(dir_path, 'src/plotting.R'))

countries_kpi_type_div <- dbcRadioItems(
  id="country-kpi-type",
  className="btn-group",
  inputClassName="btn-check",
  labelClassName="btn btn-outline-primary",
  labelCheckedClassName="active",
  value = 1,
  options = list(list("label" = "Highest",
                 "value" = 1),
                 list("label" = "Lowest",
                      "value" = 2))
)


countries_kpi_cards_div <- dbcCard(
  dbcCardBody(
    list(
      h4("Country High-Low Key Stats", className = "card-title"),
      dbcRow(countries_kpi_type_div),
      dbcRow(
        list(
          dbcCol(
            dbcCard(
              list(
                dbcCardBody(
                  list(
                     h4("GDP", className="card-title", style=(list(
                      "font-size" = "16px", "font-weight" = "bold"
                    ))),
                    p("-", id="gdp_country",
                      className="card-text", style=list(
                        "font-size" = "14px", "font-weight" = "bold"
                      )),
                    p("-", id="gdp_value",
                      className="card-text", style=list(
                        "font-size" = "13px"
                      ))
                  )
                )
              ), color="success", inverse=TRUE,
            ), width = 4
          ),
          dbcCol(
            dbcCard(
              list(
                dbcCardBody(
                  list(
                    h4("Population", className="card-title", style=(list(
                      "font-size" = "16px", "font-weight" = "bold"
                    ))),
                    p("-", id="pop_country",
                      className="card-text", style=list(
                        "font-size" = "14px", "font-weight" = "bold"
                      )),
                    p("-", id="pop_value",
                      className="card-text", style=list(
                        "font-size" = "13px"
                      ))
                  )
                )
              ), color="warning", inverse=TRUE,
            ), width = 4
        ),
        dbcCol(
          dbcCard(
            list(
              dbcCardBody(
                list(
                  h4("Life Exp", className="card-title", style=(list(
                    "font-size" = "16px", "font-weight" = "bold"
                  ))),
                  p("-", id="lifeexp_country",
                    className="card-text", style=list(
                      "font-size" = "14px", "font-weight" = "bold"
                    )),
                  p("-", id="lifeexp_value",
                    className="card-text", style=list(
                      "font-size" = "13px"
                    ))
                )
              )
            ), color="danger", inverse=TRUE,
          ), width = 4
        )
      )
    )
  )
)
)





