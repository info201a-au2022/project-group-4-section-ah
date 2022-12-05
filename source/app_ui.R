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
  titlePanel("Visual 3")
  # page 3 UI goes here
)

summary_page <- tabPanel(
  "Summary Takeaways",
  titlePanel("Summary Takeaways")
  # summary UI goes here
)

report_page <- tabPanel(
  "Conclusion",
  titlePanel("Conclusion")
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
