library(shiny)
library(tidyverse)
library(viridis)
library(hrbrthemes)

server <- function(input, output) {
  # add other charts and output here
  
  output$scatter_plot <- renderPlotly({
    sleep_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/screentime_female_vs_male.csv")
    sleep_data <- sleep_data %>% 
      filter(SC_SEX == input$displaySex) %>% 
      filter(Age %in% input$ageRange[1]:input$ageRange[2]) %>% 
      select(TOTALHOURS, SCREENTIME, Age)
    plot <- ggplot(data = sleep_data) +
      geom_point(mapping = aes(x = TOTALHOURS, y = SCREENTIME), 
                 color = case_when(input$displaySex == 1 ~ "blue", TRUE ~ "red"),
                                   alpha = 0.01) +
      ggtitle("Sleep vs. Screen Time") +
      xlab("Hours of Sleep") +
      ylab("Hours of Screen Time")
    plot
  })
  
  output$histogram_chart <- renderPlotly({
    stress_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/stress_data.csv")
    stress_data <- stress_data %>%
      filter(sr == input$stress_factors) %>%
      filter(rr == input$stress_factors) %>%
      filter(t == input$stress_factors) %>%
      filter(lm == input$stress_factors) %>%
      filter(bo == input$stress_factors) %>%
      filter(rem == input$stress_factors) %>%
      filter(sr == input$stress_factors) %>%
      filter(hr == input$stress_factors) %>%
      filter(sl == input$stress_factors) %>%
      select(
      gather(key="text", value="value") %>%
      mutate(text = gsub("\\.", " ",text)) %>%
      mutate(value = round(as.numeric(value),0)) %>% 
      mutate(text = fct_reorder(text, value))
    
    histogram_chart <- stress_data %>% 
      ggplot(aes(x = value, color = text, fill = text)) +
      geom_histogram(alpha=0.8, binwidth = 6) +
      scale_fill_viridis(discrete=TRUE) +
      scale_color_viridis(discrete=TRUE) +
      theme_ipsum() +
      theme(
        legend.position="none",
        panel.spacing = unit(0.2, "lines"),
        strip.text.x = element_text(size = 10)
      ) +
      xlab("") +
      ylab("Number of Hours") +
      facet_wrap(~text)
  })
    
  output$grouped_bar_chart <- renderPlotly({
    scores <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/depression_data/scores.csv")
    averages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/depression_data/sleep_averages.csv")
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
    } else {
      line_chart
    }
  })
}
