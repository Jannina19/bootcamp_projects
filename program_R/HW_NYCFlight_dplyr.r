# -*- coding: utf-8 -*-

# -- Sheet --

# # NYC Flight Analysis


library(dplyr)

library(tidyverse)

flights <- read.csv("flights.csv")
airlines <- read.csv("airlines.csv")

glimpse(flights)

tibble(airlines)

# ## 1. What is the average duration time to LAX 


flights %>%
    group_by(carrier,origin,dest) %>%
    filter( dest == "LAX")  %>%
    summarise(avg_hour =mean(hour)) %>%
    inner_join(airlines, by = "carrier")
    
    

# ## 2.How many flights of DL  in 2013 by months 


flights %>% 
   group_by(carrier,month)%>%
   filter(carrier == 'DL') %>%
   summarise(Total_flight=n()) %>%
   inner_join(airlines, by = "carrier")
    


# ## 3. Which are the flights that had a departure delay from EWR more than 120 mins. 


flights %>% 
    select(day,month,carrier,flight,dep_delay,origin) %>%
    filter(dep_delay > 120  & origin == "EWR"  ) %>% # unit : minutes
    arrange(carrier,desc(dep_delay)) %>%
    inner_join(airlines, by = "carrier") %>%
    head(10)

# ## 4. How many flights depart from JFK on Dec 2013


flights %>%
    group_by(carrier,month)%>%
    filter(origin == "JFK" & month == 12) %>%
    summarise(n_flight = n()) %>%
    inner_join(airlines, by = "carrier")
    


# ## 5.Which route has the most average distance in miles


flights %>%
    group_by(origin,dest)%>%
    summarise( avg_dis = mean(distance))%>%
    arrange(desc(avg_dis)) %>%
    head(5)

