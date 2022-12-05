library(shiny)
library(tidyverse)

server <- function(input, output) {
  # add other charts and output here
  
  output$grouped_bar_chart <- renderPlotly({
    scores <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/depression_data/scores.csv")
    averages <- read.csv("../data/depression_data/sleep_averages.csv")
    sleep_hours_per_age <- scores %>% 
      left_join(averages, by = "number") %>% 
      mutate(patient_type = str_replace(number, "[_].*", "")) %>% 
      group_by(age, patient_type) %>% 
      summarize(age = unique(age), 
                avg_hrs_sleep = mean(average_minutes_slept, na.rm = TRUE) / 60) %>% 
      ungroup(age, patient_type) %>% 
      add_row(age = "55-59", patient_type = "control" , avg_hrs_sleep = NA) %>%  # account for no 55-59 in control group
      group_by(age, patient_type)
    
    # the actual visualization
    labels <- rep(c("condition", "control"), 10)
    bar_chart <- ggplot(data = sleep_hours_per_age, aes(fill = labels, x = age, 
                                                        y = avg_hrs_sleep)) + 
      geom_bar(position = "dodge", stat = "identity") +
      ggtitle("Average Sleep Duration by Depression Diagnosis") +
      ylab("Hours of Sleep") +
      xlab("Age")
    line_chart <- ggplot(data = sleep_hours_per_age, aes(x = age, 
                                                         y = avg_hrs_sleep, 
                                                         group = labels, 
                                                         color = labels)) +
      geom_line() +
      ggtitle("Average Sleep Duration by Depression Diagnosis") +
      ylab("Hours of Sleep") +
      xlab("Age")
    if(input$chart_type == "Bar") {
      bar_chart
    } else{
      line_chart
    }
  })
}