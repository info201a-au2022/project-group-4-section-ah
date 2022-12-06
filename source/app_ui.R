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
 p("
 |Element | Brief Description|
|---------------| --------------
|Code name | _iPad kids_ |
|Project title| The Various Factors That Affect Children's Sleep Patterns | 
|Authors | Dhruv Ashok: dashok@uw.edu, Kai Magbuhat : kaim0616@uw.edu, Nikhila Suneel: nsuneel@uw.edu|
|Affiliation |  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington |
|Date | Autumn 2022|
|Abstract | Our main question is how various factors affect the duration and quality of sleep in younger generations. This question is important because quality sleep is vital to the physical and cognitive development of young children, and studying if, how, and why that sleep is affected is key to understanding the health of younger generations. To address this question, we will examine and analyze data that correlates various factors such as screen time, mental health, and stress management to sleep, and examine if there is a link between any of these factors and sleep. |
|Keywords | children; sleeping patterns; mental health; screen time usage data |
|Introduction | Our lives can be summed up into two parts, awake and asleep. Sleep is an essential part of our lives. We can’t avoid sleeping, it is our basic human nature to sleep. Not only does it physically and mentally recharge us for the day ahead but many phycological events occur in the brain that the human body needs. Collectively, society functions less without sleep. Sleep is a natural and primal part of every living organism. As a result, the data on sleep is vast and well diverse. It is known that people of the new generations aren’t getting enough sleep, but why? There are many assumed reasons why people aren’t getting enough sleep so this data will show the correlations between sleep and these reasons. From this data, conclusions can be made whether these reasons should kept or monitored in a person’s life. |
| Problem Domain| **Background**  <br> The most influential time in a person’s life is when they are young and their brain is still developing. Childhood can greatly determine and affect one’s futures, so establishing good habits will prepared them for success.(Source:https://www.cde.ca.gov/SP/CD/re/caqdevelopment.asp) <br><br>**Direct stake holders:** <br>The direct stakeholders are generally everyone, most it mostly applies to those who need it, such as people who receive inadequate sleep. These people are, but not limited to, people with poor sleeping habits, parents of restless children, people in employment, and students. The importance of sleep is greatly emphasized toward these groups due to them requiring it the most. In 2020, a study was conducted and it was found that roughly 35% of Adults don’t get enough sleep and 78% of high schoolers in 2019. (Source: https://www.cdc.gov/sleep/data_statistics.html) <br><br> **Indirect stake holders:** <br> The indirect stakeholders are the people who depend of the restless to get rest, such as schools, work, and the people around them. People with inadequate sleep tend to function slower and inefficently. Reaction time drops, impairment to judgment, and can lead to forgetfulness which can cause someone to become a liability when driving or dealing with potentially hazardous equipement. Schools need their students well rested in order to attend school on time and learn. <br><br>**Human values:**<br> This data’s purpose is to educate people about healthy sleeping habits to encourage a healthy well-being. This data offeres truth and knowledge about sleep and what effects it. <br><br> **Benefits:** <br> A large portion of the young community, mostly those enrolled in high school to college, suffer from improper sleep which can lead to a less productive ability to learn. All of which, can lead up to built up stress and procrastination and result in more inadequate sleep. People in the work force who suffer from sleep deprivation can be a liability to those around them, so providing this information to both communities with increase the productivity of the human race as a whole.https://www.haaretz.com/israel-news/2018-02-26/ty-article-magazine/.premium/why-we-sleep-and-what-it-has-to-do-with-polar-bears/0000017f-f472-d044-adff-f7fb2d1b0000 <br><br>**Harms:** <br>Some of these data sets cover important things that we value in out lives that some may have to sacrifice in order to obtain the desired amount of sleep. Parents will take note of the reasons that interfere with their children’s sleep schedule and remove it. |
|Research Questions | **(1) What factors, if any, affect the duration and quality of sleep in younger generations?** <br> This is a broad question that seeks to identify what factors may affect sleep, or if there is no correlation between factors and sleep quality. The question is a good starting point to identify if more specific research should be pursued. <br><br> **(2) Does increased screen time lead to lower quality and duration of sleep in younger generations?**<br> This is a specific question that examines if the advent of the Internet and accessibility of mobile devices has led younger generations to have a lower quality sleep. While this question is specific, it also helps partially answer the broader question regarding what factors affect the quality of sleep. <br><br> **(3) Is there a correlation between stress management and quality and duration of sleep in younger generations?** <br> This is a specific question that examines if another specific factor, stress management, has any correlation with sleep patterns. It also helps to partially answer the broader question regarding what factors affect the quality of sleep, but stress management is not necessarily unique to younger generations like the Internet and mobile devices are. <br><br> **(4) Is there a correlation between mental health and quality and duration of sleep in younger generations?** <br> This is a specific question that examines if mental health has any correlation with sleep patterns. Once again, this helps answer the broader question, but mental health is something that while not unique to younger generations, has been seen more recently as a problem for younger generations and thus is important to examine in relation to sleep patterns. |
|The Dataset | Our data sets are similar to our problem domain in the sense that all three data files are focused on what human conditions effect sleep and human sleeping patterns. Through the sociotechnical data sets that we found through research we can assess what factors are the most prevalent when analyzing sleep deprivation. We want our project frame to be well addressed and understood by the audience, hence we will pick a select number of variables to include from the three different data files to analyze. Data set #1 will answer the second research question by providing data of screen usage and hours of sleep for children. Dataset 2 will answer research question 1 and 3 because it involves stress management and how kids are affected with a lack of sleep from it. Data set #3 will be examined through research question 1 and 4 because it discusses varying factors not just one variable. For data set 1, the United States Census Bureau collected this data is 2019 as part of the NSCH Data release. The data article was published on October 5th, 2020. They processed this article under the National Survey of Children’s Health (NSCH) and contained a sample size of children 0-18 living in the United States. The purpose of collecting the data was to gather useful data on a prevalent topic of how screen time was affecting the youth of America. They collected and compiled this data for the target audience of American Parents whose kids use screens frequently. The data collection was funded by the United States government. The target audience of this data collection is most likely parents and guardians of youth using screens. The data was validated and held secure through the national census. The screener questions were handled by the NSCH, and they gave access to the public using microdata files. We obtained the data through google searches of effects of screen time on children’s sleep and sleeping patterns. We do credit the source of data for this data set.For data set 2, it is the called the “Human Stress Detection in and through Sleep” by Laavanya Rachakonda et al. and Smart-Yoga Pillow (SaYoPillow). The data was collected on Feb 2021. The purpose of the collection of the data was to understand the relationship between stress and sleep and to hopefully use this data to create a device sold by Smart-Yoga Pillow called “Smart Sleeping”. The data collection effort was funded by SaYoPillow. It was benefiting SaYoPillow’s company by extending research to create new products and increase their brand awareness and target market. The data was validated and held secure by the SaYoPillow company along with “Blockchain-Integrated Privacy-Assured loMT Framework for Stress Management. We obtained the data from Kaggle which is a website provided by Mr. Winegarden that holds data sets for varying topics. For data set 3, it is called “The Depression Data” and it was collected by Enrique Garcia-Ceja, Michael Riegler, Petter Jakobsen, Jim Tørresen, Tine Nordgreen, Ketil J. Oedegaard, Ole Bernt Fasmer. It was collected on June 12, 2018. The purpose of this data collection was for helping researchers find ways to detect depression and depressive states of patients early on from sensory data of sleeping patterns. The data collection was funded from “A Motor Activity Database of Depression Episodes in Unipolar and Bipolar Patients in 2018. It was their 9th ACM on Multimedia Systems (MMys) Conference in Amsterdam that they released the data. MMSys 2018 was benefited from gathering this data for their researchers. The source is credible due to the acclaimed researchers on the study. We obtained the data from Kaggle which is a website provided by Mr. Winegarden that holds data sets for varying topics|
|Expected Implications | Assuming that by the end of this data analysis we have answered our research questions, some expected implications for technologists could be that monitoring sleep with devices do indeed actually work and should continue to be experimented upon for research. For designers, answering our research questions could indicate to them how to design experiments. What are factors of sleep deprivation, in kids or adults (either), and then factor out the variables that are not contributors. For designers to have compiled and analyzed data is very helpful because then they are able to progress in designing new experiments and trails of subjects that weren’t before covered. For policymakers, having this analyzed data could be helpful for them to adjust, for example, kids screen time usage. Or fund research for more experimental trails on certain factors of testing for depressive states early. Specific to our research questions, policymakers can bring this data to their fellow elected officials to find solutions, for example: medication for stress management.|
|Limitations | Limitations such as a lack of enough data in the data sets could be an issue. If one or more of the data sets are not credible or do not level with the credibility of the other sources. Issues such as lack of variables, skewed data, or a lack of correlation could be prevalent. As a group, we will have to discuss how we will go about damage control if we run into any of these issues. We have decided we would attempt to find a new source of data that better encompasses our research questions if possible. If finding a new similar source is not possible we will have to take the data to its best ability and examine it with our analysis understanding there are limitations and should be speculation to the end result.|
|_Findings_ | _Not for the project proposal; for final report only. Give answers to each of your research questions. (About 400 words.)_ |
|_Discussion_ | _Not for the project proposal; for final report only. Discuss importance and/or implications of your findings  (About 400 words.)_ |
|_Conclusion_ | _Not for the project proposal; for final report only. Give the reader a summary point, the key point that you will like your audience to leave with. (About 400 words.)_ |
|Acknowledgements | Is there anyone you would like to thank? A librarian who helped you with your research? A Teaching Assistant? A friend who helped you find your data? Say thank you in this section.|
|References | Bureau, U. S. C. (2021, November 15). 2019 NSCH Data release. Census.gov. Retrieved November 15, 2022, from http://www.census.gov/data/datasets/2019/demo/nsch/nsch2019.html <br> Rachakonda, L. (2022, February 15). Human stress detection in and through sleep. Kaggle. Retrieved November 15, 2022, from https://www.kaggle.com/datasets/laavanya/human-stress-detection-in-and-through-sleep/discussion <br> M, M. (2021, February 6). The depression dataset. Kaggle. Retrieved November 15, 2022, from https://www.kaggle.com/datasets/arashnic/the-depression-dataset  |
|Appendix A: Questions| Do you have questions for your TA or instructor?  Include them here.|


| Syntax      | Name        | Observation # | Variable # | Citation |
| :---        |    :----:   |          ---: |      ---:  |   ---:   | 
| Data Set 1  | 2019 NCHS Data Release Screen Time vs. Hours of Sleep       | 29,434        |   443      |   Bureau, US Census. “2019 NSCH Data Release.” The United States Census Bureau, 30 Sept. 2020,www.census.gov/data/datasets/2019/demo/nsch/nsch2019.html     |
| Data Set 2  | Human Stress Detection in and through Sleep        | 631      |      9      |    Rachakonda, L. (2022, February 15). Human stress detection in and through sleep. Kaggle. Retrieved October 31, 2022, from https://www.kaggle.com/datasets/laavanya/human-stress-detection-in-and-through-sleep/discussion       |
| Data Set 3  |     The Depression Data        |         32      |      11     |    https://www.kaggle.com/datasets/arashnic/the-depression-dataset      |
")
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