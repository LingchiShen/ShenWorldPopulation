library(tidyverse)
library(readxl)

World_Pop<-read_excel('data-raw/World_Population.xlsx',sheet='ESTIMATES',range=("A16:BZ306"))
WorldPopulation<-World_Pop %>%
  select(3,6,8:78) %>%
  filter(...6=="Country/Area") %>%
  select(-2) %>%
  magrittr::set_colnames( c('Countries', 1950:2020) ) %>%
  mutate_at( vars( matches('19')|matches('20')), as.numeric)

usethis::use_data(WorldPopulation)
