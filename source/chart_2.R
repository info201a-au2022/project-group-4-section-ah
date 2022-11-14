install.packages("tidyverse")
install.packages("stringr")
library(stringr)
library(tidyverse)

calculate_stress_sleep_time <- function(file) {
  data <- read.csv(paste0("../data/stress_data/", file, ".csv"))
  data <- data %>% 
    mutate
  
}
