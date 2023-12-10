library(tidyverse)
library(rvest)

url<- 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
page<-read_html(url)
Attendance <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)

World_Cup<-Attendance %>%
  slice(-1*1:2) %>%
  select(1,2,5,4,6) %>%
  magrittr::set_colnames( c('Year', 'Hosts','Matches','Totalattendance','Averageattendance') ) %>%
  as_tibble() %>%
  filter(!(Year %in% 'Overall')) %>%
  mutate_at( vars(matches('attendance')), str_remove_all, ',') %>%
  mutate_at( vars( matches('attendance')), as.numeric) %>%
  drop_na() %>%
  mutate(WorldCup=paste(Hosts,Year,sep=""))%>%
  select(!1:2)

usethis::use_data(World_Cup)
