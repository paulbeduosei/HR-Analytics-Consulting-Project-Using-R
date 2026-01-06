# Load the packages
library("dplyr")
library("readr")
library("broom")
library("ggplot2")

# Import the data
pay <- read_csv("~/Desktop/Data/fair_pay_data.csv")

# Get an overview of the data
summary(pay)

# Check average salary of new hires and non-new hires
pay %>% 
  group_by(new_hire)%>%
  summarize(avg_salary = mean(salary))

# Perform the correct statistical test
t.test(salary ~ new_hire, data = pay)

# Do the same test, and tidy up the output
t.test(salary ~ new_hire, data = pay) %>%
  tidy()

# Create a 100% filled stacked bar chart
pay %>%  ggplot(aes(x = new_hire, fill = job_level))+  geom_bar(position ="fill")

# Calculate the average salary for each group of interest
pay_grouped <- pay %>% 
  group_by(new_hire, job_level) %>% 
  summarize(avg_salary = mean(salary))

# Graph the results using facet_wrap()  
pay_grouped %>%
  ggplot(aes(x=new_hire, y=avg_salary)) + geom_col() + facet_wrap(~job_level)

# Filter the data to include only hourly employees
pay_filter <- pay %>% filter(job_level == "Hourly")

# Test the difference in pay
t.test(salary ~ new_hire, data = pay_filter) %>%
  tidy()

# Run the simple regression
model_simple <- lm(salary ~ new_hire, data = pay)

# Display the summary of model_simple
model_simple %>% 
  summary()

# Display a tidy summary
model_simple %>% 
  tidy()

# Run the multiple regression taking Job Level into consideration
model_multiple <- lm(salary ~ new_hire + job_level, data = pay)

# Display the summary of model_multiple
model_multiple %>% 
  summary()

# Display a tidy summary
model_multiple %>% 
  tidy()

# New Hires are paid about the same as current employees when job level is considered.