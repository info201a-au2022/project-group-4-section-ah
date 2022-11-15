install.packages("tidyverse")
install.packages("dplyr")
install.packages("gapminder")
install.packages("hrbrthemes")
install.packages("viridis")
install.packages("forcats")
library(dplyr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(gapminder)
library(hrbrthemes)
library(viridis)
library(forcats)


# The dataset:
# Load dataset from github
stress_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ah/main/data/stress_data.csv")
View(data)
stress_data <- stress_data %>%
  gather(key="text", value="value") %>%
  mutate(text = gsub("\\.", " ",text)) %>%
  mutate(value = round(as.numeric(value),0))

# The Multiple Plots
p <- stress_data %>%
  mutate(text = fct_reorder(text, value)) %>%
  ggplot( aes(x=value, color=text, fill=text)) +
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
View(p)
