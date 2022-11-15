library(dplyr)
library(ggplot2)

sleep_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/screen-sleep-iso.csv")
View(sleep_data)
men_sleep <- sleep_data %>% 
  filter(SC_SEX == 1) %>% 
  select( TOTALHOURS, SCREENTIME)

View(men_sleep)


manplot <- ggplot(data = men_sleep) +
  geom_point(mapping = aes(x = TOTALHOURS, y = SCREENTIME),
             color = "blue",
             alpha = .01
  )

manplot


women_sleep <- sleep_data %>% 
  filter(SC_SEX == 2) %>% 
  select(TOTALHOURS, SCREENTIME)

womenplot <- ggplot( data = women_sleep) +
  geom_point(mapping = aes(x = TOTALHOURS, y = SCREENTIME),
             color = "red",
             alpha = .01
  )

library(gridExtra)

united <- grid.arrange(womenplot, manplot, ncol = 2)
united
