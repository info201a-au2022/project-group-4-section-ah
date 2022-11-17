library(tidyverse)

data <- read.csv("../data/screentime_female_vs_male.csv")

table_data <- data %>% 
  filter(Age != 2019) %>% # filter out erroneous data
  group_by(Age) %>% 
  summarize(Age = unique(Age), 
            avg_sleep_hrs = round(mean(TOTALHOURS, na.rm = TRUE), 2), 
            avg_screen_time_hrs = round(mean(SCREENTIME, na.rm = TRUE), 2))
  
