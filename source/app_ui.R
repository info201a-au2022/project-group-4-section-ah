library(plotly)
library(shiny)
library(tidyverse)

intro_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction")
  # introduction UI goes here
)

page_one <- tabPanel(
  "Visual 1",
  titlePanel("Visual 1")
  # page 1 UI goes here
)

page_two <- tabPanel(
  "Visual 2",
  titlePanel("Visual 2")
  # page 2 UI goes here
)

page_three <- tabPanel(
  "Visual 3",
  titlePanel("Visual 3"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "chart_type", label = "Chart Type", 
                  choices = c("Bar", "Line"))
    ),
    mainPanel(
      plotlyOutput("grouped_bar_chart")
    )
  ),
  p("This chart is included in both a grouped bar chart form, which is better 
  for seeing individual age group comparisons between the control and condition
  groups, and a line chart which is better for seeing general trends across
  age groups for each of the conditional and control groups. This chart reveals 
  that there is no strong correlation in this dataset between depression and 
  duration of sleep, as the control group and condition group have widely 
  varying sleep duration averages across age groups. Further, the control and
  condition groups switch on having the higher sleep duration for different age
  groups, which means we cannot draw any conclusions about sleep duration
  and age either. It is possible that the data quality may have impacted the 
  reliability of these results.")
)

summary_page <- tabPanel(
  "Summary Takeaways",
  titlePanel("Summary Takeaways")
  # summary UI goes here
)

report_page <- tabPanel(
  "Report",
  titlePanel("Report")
  # report UI goes here
)

ui <- navbarPage(
  "Factors that Affect Sleep Patterns",
  intro_page,
  page_one,
  page_two,
  page_three,
  summary_page,
  report_page
)
