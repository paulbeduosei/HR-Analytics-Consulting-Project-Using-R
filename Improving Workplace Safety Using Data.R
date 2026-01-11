# Load the packages
library("readr")
library("dplyr")
library("ggplot2")
library("broom")

# Import the data 
hr_data <- read_csv("~/Desktop/Data/hr_data_2.csv")
accident_data <- read_csv("~/Desktop/Data/accident_data.csv")

# Create hr_joined with left_join() and mutate()
hr_joined <- left_join(hr_data,accident_data, by = c("year","employee_id")) %>% 
  mutate(had_accident = ifelse(is.na(accident_type), 0, 1))

hr_joined

# Find accident rate for each year
hr_joined %>% 
  group_by(year) %>% 
  summarize(accident_rate = mean(had_accident))

# Test difference in accident rate between years
chisq.test(hr_joined$year, hr_joined$had_accident)

# Which location had the highest acccident rate?
hr_joined %>% 
  group_by(location) %>%
  summarize(accident_rate = mean(had_accident)) %>%
  arrange(desc(accident_rate))

# Compare annual accident rates by location
accident_rates <- hr_joined %>% 
  group_by(location, year) %>% 
  summarize(accident_rate = mean(had_accident))

accident_rates

# Graph it
accident_rates %>% 
  ggplot(aes(factor(year), accident_rate)) +
  geom_col() +
  facet_wrap(~location)

# Filter out the other locations
southfield <- hr_joined %>% 
  filter(location == "Southfield")


# Find the average overtime hours worked by year
southfield %>%
  group_by(year) %>% 
  summarize(average_overtime_hours = mean(overtime_hours))

# Test difference in Southfield's overtime hours between years
t.test(overtime_hours ~ year, data = southfield) 
 
# Import the survey data
survey_data <- read_csv("~/Desktop/Data/survey_data_2.csv")

# Create the safety dataset
safety1 <- left_join(hr_joined, survey_data, by = c("year", "employee_id")) %>%
  mutate(disengaged = ifelse(engagement <= 2, 1, 0),
         year = factor(year)) %>%
  filter(location == "Southfield")

safety <- left_join(hr_joined, survey_data, by = c("year", "employee_id")) %>%
  mutate(disengaged = ifelse(engagement <= 2, 1, 0),
         year = factor(year)) 

# Visualize the difference in % disengaged by year in Southfield
safety1 %>% 
  ggplot(aes(x = year, fill = factor(disengaged))) +
  geom_bar(position = "fill")

# Test whether one year had significantly more disengaged employees
chisq.test(safety1$year, safety1$disengaged)

# Filter out Southfield
other_locs <- safety %>% 
  filter(location != "Southfield")
head(other_locs)

# Test whether one year had significantly more overtime hours worked
t.test(overtime_hours ~ year, data = other_locs) 

# Test whether one year had significantly more disengaged employees
chisq.test(other_locs$year, other_locs$disengaged)

# Use multiple regression to test the impact of year and disengaged on accident rate in Southfield
regression <- glm(had_accident ~ year + disengaged, family = "binomial", data = safety1 )

# Examine the output
tidy(regression)
