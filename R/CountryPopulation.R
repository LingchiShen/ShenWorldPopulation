#' Plotting CountryPopulation.
#'
#' Graphing the country population of what you enter
#'
#' The goal is to show the population graph of the country you entered,
#' population changes from 1950-2020.
#'
#' @param x A real Country Name
#' @return Population change of this country
#' @examples
#' CountryPopulation("Italy")
#' CountryPopulation("China")
#' @export
CountryPopulation <- function(x) {
  df <- WorldPopulation %>%
    filter(Countries == x) %>%
    pivot_longer(cols = -Countries,
                 names_to = 'Year',
                 values_to = 'Population') %>%
    mutate(Year = as.numeric(Year))
  ggplot(df,aes(x=Year,y=Population))+
    geom_line(size=1)+
    labs(title = paste(x,"Population from 1950-2020"),
         x = "Year",
         y = "Population(thousands)")
}
