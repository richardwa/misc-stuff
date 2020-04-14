library(dplyr)
library(ggplot2)
library(readr)
library(benford.analysis) 

covid_cases <- read_csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", 
                col_types = cols(cases = col_integer(), 
                                 dateRep = col_date(format = "%d/%m/%Y"), 
                                 day = col_skip(), deaths = col_integer(), 
                                 month = col_skip(), popData2018 = col_double(), 
                                 year = col_skip())) %>% 
  rename(country=countriesAndTerritories, date=dateRep, cc=countryterritoryCode, population=popData2018)
  
ma <- function(x, n = 5){stats::filter(x, rep(1 / n, n), sides = 2)}


# covid_cases %>%  
#   arrange(date) %>% 
#   group_by(country) %>% 
#   filter(geoId %in% c('US','CN','KR')) %>% 
#   group_map(function (.x,.y) {
#     b <- .x$cases %>% benford()
#     b[["info"]][["data.name"]] = .y$country
#     plot(b)
#     b
#   })


# cases vs total
covid_cases %>%  
  arrange(date) %>% 
  group_by(country) %>% 
  filter(geoId %in% c('US','CN','KR','JP','IT','TW','CZ','UK','TH')) %>% 
  mutate(total = cumsum(cases), mavg=ma(cases,10)) %>% 
  ggplot(aes(x=total, y=mavg,col=country))+
  geom_line()+ scale_y_log10()+scale_x_log10()



# cases vs time
covid_cases %>%  
  arrange(date) %>% 
  group_by(country) %>% 
  filter(geoId %in% c('US','CN','KR','JP','IT','TW','CZ','UK','TH')) %>% 
  mutate(total = cumsum(cases), mavg=ma(cases,10)) %>% 
  ggplot(aes(x=date, y=mavg,col=country))+
  geom_line()+ scale_y_log10()
