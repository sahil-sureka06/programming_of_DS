#Step1: Install and Load the necessary packages and data
install.packages("dplyr")
library(dplyr)

#load starwars dataset which is a built-in dataset in the dplyr package
data("starwars", package = "dplyr")
View(starwars)


#Step2 (Select Columns): Extract relevant columns such as name, species, height, mass, homeworld and gender
starwars_data <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

View(starwars_data)


#Step3 (Filter Rows): Filter species having more than two characters
species_data <- starwars_data %>%
  group_by(species) %>%
  filter(n() > 2)

View(species_data)


#Step4 (Create New Columns): Convert height to meters and categorize mass into weight categories
species_data <- species_data %>%
  mutate(
    height_m = height/100,
    weight_category = case_when(
      mass < 60 ~ "Light",
      mass >= 60 & mass < 100 ~ "Medium",
      mass >= 100 ~ "Heavy",
      TRUE ~ "Unknown"
    )
  )

View(species_data)


#Step5 (Summarize Data): Find the average height for each species and gender combination
summary_data <- species_data %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height, na.rm = TRUE))

View(summary_data)


#Step6 (Identify Top Results): Find top three species with highest average height
top_species <- summary_data %>%
  arrange(desc(avg_height)) %>%
  head(3)

View(top_species)
