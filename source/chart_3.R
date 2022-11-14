library(tidyverse)

compute_sleep_time <- function(file) {
  data <- read.csv(paste0("../data/depression_data/", file, ".csv"))
  data <- data %>%
    mutate(date = str_replace(timestamp, "[ ].*", ""), 
           previous_activity = lag(activity, 1)) %>% 
    filter(activity == 0, previous_activity == 0) %>% 
    group_by(date) %>% 
    count() %>% 
    summarize(date = date, minutes_slept = n)
  avg_minutes_slept <- round(mean(data$minutes_slept, na.rm = TRUE))
  return(avg_minutes_slept)
}

scores <- read.csv("../data/depression_data/scores.csv")
files <- append(paste0("condition/condition_", 1:23), 
                paste0("control/control_", 1:32))
averages <- data.frame(row.names = 1:55, 
                       number = str_replace(files, ".*[/]", ""), 
                       average_minutes_slept = sapply(files, compute_sleep_time)
                       )
sleep_hours_per_age <- scores %>% 
  left_join(averages, by = "number") %>% 
  mutate(patient_type = str_replace(number, "[_].*", "")) %>% 
  group_by(age, patient_type) %>% 
  summarize(age = unique(age), 
            avg_hrs_sleep = mean(average_minutes_slept, na.rm = TRUE) / 60) %>% 
  ungroup(age, patient_type) %>% 
  add_row(age = "55-59", patient_type = "control" , avg_hrs_sleep = 0) %>%  # account for no 55-59 in control group
  group_by(age, patient_type)
# the actual visualization
labels <- rep(c("condition", "control"), 10)
ggplot(data = sleep_hours_per_age, aes(fill = labels, x = age, 
                                       y = avg_hrs_sleep)) + 
  geom_bar(position = "dodge", stat = "identity") +
  ggtitle("Average Sleep Duration by Depression Diagnosis") +
  ylab("hours of sleep")

# while not fully consistent, for the maj of observations we see control > condition