library(shiny)
library(tidyverse)

intro_page <- tabPanel(
  "Introduction",
  titlePanel("Introduction")
  # introduction UI goes here
)

page_one <- tabPanel(
  "Page 1",
  titlePanel("Page 1")
  # page 1 UI goes here
)

page_two <- tabPanel(
  "Page 2",
  titlePanel("Page 2")
  # page 2 UI goes here
)

page_three <- tabPanel(
  "Page 3",
  titlePanel("Page 3")
  # page 3 UI goes here
)

summary_page <- tabPanel(
  "Summary",
  titlePanel("Summary")
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