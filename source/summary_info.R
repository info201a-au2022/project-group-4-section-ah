library(tidyverse)

data <- read.csv("../data/screen-sleep-iso.csv")
summary_info <- list()
summary_info$num_observations <- nrow(data)
summary_info$num_variables <- ncol(data)

clean_data <- data %>% 
  filter(Age != 2019) # removed erroneous birth year columns

summary_info$max_age <- max(clean_data$Age, na.rm = TRUE)
summary_info$min_age <- min(clean_data$Age, na.rm = TRUE)
summary_info$avg_sleep <- round(mean(data$TOTALHOURS, na.rm = TRUE), 2)
summary_info$avg_screen_time <- round(mean(data$SCREENTIME, na.rm = TRUE), 2)
summary_info$median_sleep <- round(median(data$TOTALHOURS, na.rm = TRUE), 2)
summary_info$median_screen_time <- round(median(data$SCREENTIME, na.rm = TRUE),
                                         2)
get_skew <- function(mean, median) {
  if(mean < median) {
    skew <- "left"
  } else if (mean > median) {
    skew <- "right"
  } else {
    skew <- "not"
  }
  return(skew)
}




