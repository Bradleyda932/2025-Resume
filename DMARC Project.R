# ---
# Bradley Antholz
# Capstone Project: Des Moines Area Religious Council - Food Pantry Network (DMARC)
# This was done over the Spring 2025 semester, and will be presented at the conclusion of the year.
# This was done with permission from Lendie Follett and Professor Manley, and with group members Tim and Oliver.
# Our goal is to find useful trends in the demographics of food pantry visitors, and we specifically
# targeted "at-risk" zip codes in the area. In addition, Lendie asked us if we could find why DMARC is seeing 
# record numbers of people coming in 2024-2025.
# My goal with this R code is to clean the data, separate it, then create graphs to have visual trends. 
# ---

## Part 1: Loading and cleaning basic data

# Step 1: Load the data and libraries
rm(list = ls())
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)
library(patchwork)

data <- read.csv("/Users/bradley/Desktop/Sem 4/CS 190/dmarc project/drake_export_v8_2024-02-13_100754_rev2_nolatlong.csv")

# Step 2: Rename columns, as some names are ambiguous
colnames(data) <- c("fp_number", "house_id", "served_date", "annual_income", "poverty_level",
                    "person_id", "lnm", "dob", "gender", "race", "ethnicity", 
                    "education", "family_type", "snap_house", "zip_code", "fp_location", 
                    "housing_status", "housing_type", "homelessness", "income_source")

# Step 3: Begin cleaning the data; we want to trim as much as possible while keeping as much as possible. 
data <- data %>%
  select(-lnm, -housing_type)

# 3a: Drop rows with multiple missing values using keywords
# We do this because the information is from surveys taken by visitors, and we want to remove unhelpful entries.

data[data == ""] <- NA
data[data == "NULL"] <- NA

data <- data %>%
  filter(rowSums(across(everything(), ~ . %in% c("Unknown", "Other", "Not Selected")) | is.na(.)) <= 3) %>%
  drop_na(-income_source)

colSums(is.na(data))

# 3a: round annual_income (don't want decimals)
data$annual_income <- round(data$annual_income) 

# 3b: Cleaning zip codes/homelessness (some zip codes have dashes, which are specific house identifiers)
data$zip_code <- substr(data$zip_code, 1, 5) 

# There was some incorrect data, so we cleaned the three variables below. We were told by Lendie that "50301" is
# a common "homeless" zip code, so we use it to identify them here. 
# The point: If you are labeled as having a homeless zip code and are either 'homeless' or 'literally homeless', 
# we ensure all entries match up. ie, you cannot be labeled as homeless two separate times yet are "stably housed", thats bad data.

data <- data %>%
  mutate(homelessness = case_when(
    zip_code == 50301 & housing_status == "Homeless" & homelessness != "Literally Homeless" ~ "Literally Homeless",
    TRUE ~ homelessness
  ))

head(data)

data <- data %>%
  mutate(housing_status = case_when(
    zip_code == 50301 & homelessness == "Literally Homeless" & housing_status != "Homeless" ~ "Homeless",
    TRUE ~ housing_status
  ))

# 3c: Fixing age (we have some entries who are under 0 years old and some who are 100+, which is highly unlikely.)
data <- data %>% 
  mutate(
    dob = ymd(dob),
    served_date = ymd(served_date),  
    age = round(as.numeric(difftime(served_date, dob, units = "days")) / 365.25)
  ) %>%
  filter(age > -0.1, age <= 102, dob >= ymd("1923-01-01"))

## Part 2: Separating data

# Step 1: Income brackets
data$annual_income[data$annual_income < 0] <- 0

data <- data %>%
  mutate(
    income_bracket = case_when(
      annual_income == 0 ~ "No Income",
      annual_income <= 5000 ~ "$0 - $5,000",
      annual_income <= 10000 ~ "$5,000 - $10,000",
      annual_income <= 20000 ~ "$10,000 - $20,000",
      annual_income <= 50000 ~ "$20,000 - $50,000",
      annual_income <= 100000 ~ "$50,000 - $100,000",
      TRUE ~ "Over $100,000"
    ),
    fed_bracket = case_when(
      poverty_level == 0 ~ "0",
      poverty_level <= 25 ~ "0 - 25",
      poverty_level <= 50 ~ "25 - 50",
      poverty_level <= 100 ~ "50 - 100",
      poverty_level <= 200 ~ "100 - 200",
      poverty_level <= 500 ~ "200 - 500",
      TRUE ~ "Over 500"
    ),
    age_group = case_when(
      age <= 1 ~ "Infant",
      age <= 4 ~ "Toddler",
      age <= 12 ~ "Child",
      age <= 17 ~ "Teenager",
      age <= 24 ~ "Young Adult",
      age <= 64 ~ "Adult",
      TRUE ~ "Elderly"
    )
  )

data$income_bracket <- factor(data$income_bracket, 
                              levels = c("No Income", "$0 - $5,000", "$5,000 - $10,000", 
                                         "$10,000 - $20,000", "$20,000 - $50,000", 
                                         "$50,000 - $100,000", "Over $100,000"))

# Step 2: Locations - Otherwise, we'd have 91 entries with most being DMARC Mobile and Affiliates.
data <- data %>%
  filter(fp_location != "Unknown", fp_location != "all") %>%
  mutate(fp_location_groups = case_when(
    grepl("Ankeny", fp_location, fixed = TRUE) ~ "IMPACT CAP - Ankeny",
    grepl("Bidwell", fp_location, fixed = TRUE) ~ "Families Forward - Bidwell",
    grepl("Catholic Charities", fp_location, fixed = TRUE) ~ "Catholic Charities",
    grepl("Central Iowa", fp_location, fixed = TRUE) ~ "Central Iowa Shelter",
    grepl("Clive", fp_location, fixed = TRUE) ~ "Clive CS",
    grepl("DMARC-ket", fp_location, fixed = TRUE) ~ "DMARC-ket",
    grepl("DRAKE", fp_location, fixed = TRUE) ~ "IMPACT CAP - Drake",
    grepl("Eastview", fp_location, fixed = TRUE) ~ "Caring Hands Eastview",
    grepl("Mobile", fp_location, fixed = TRUE) | grepl("MOBILE", fp_location, fixed = TRUE) ~ "DMARC Mobile",
    grepl("North Side", fp_location, fixed = TRUE) ~ "North Side",
    grepl("PARTNERSHIP", fp_location, fixed = TRUE) ~ "Johnston Partnership",
    grepl("River Place", fp_location, fixed = TRUE) ~ "River Place",
    grepl("Salvation", fp_location, fixed = TRUE) | grepl("S.A. TEMPLE", fp_location, fixed = TRUE) ~ "Salvation Army Clive",
    grepl("URBANDALE", fp_location, fixed = TRUE) ~ "Urbandale",
    grepl("WDM", fp_location, fixed = TRUE) ~ "WDM Human Services",
    grepl("Affiliate", fp_location, fixed = TRUE) ~ "Affiliate",
    TRUE ~ "Other"
  ))

unique(data$fp_location_groups)

# Step 3: Segmenting years
# This is done to have demographics for a time period, the start of answering Lendie's question. 
data <- data %>%
  mutate(segmented_years = case_when(
    served_date >= "2018-01-01" & served_date <= "2019-12-31" ~ "2018-2019",
    served_date >= "2020-01-01" & served_date <= "2022-12-31" ~ "2020-2022",
    served_date >= "2023-01-01" ~ "2023-Present",
    TRUE ~ "Other"
  ))
data_2018_2019 <- data %>% filter(segmented_years == "2018-2019")
data_2020_2022 <- data %>% filter(segmented_years == "2020-2022")
data_2023_present <- data %>% filter(segmented_years == "2023-Present")

# Step 4: Fixing locations for graphing
# 17 entries is too many for a graph, so we take the top 8 most visited pantries.
visitor_counts <- data %>%
  group_by(fp_location_groups) %>%
  summarise(total_visitors = n_distinct(person_id), .groups = 'drop') %>%
  arrange(desc(total_visitors))

top_locations <- visitor_counts %>%
  slice_head(n = 8) %>%
  pull(fp_location_groups)


# Step 5: Fixing niche cases (Done after the groups due to simplicity)

# 5a: Income fixes
# two quick fixes: we have about 500,000 null values in income_source, so I fixed this by taking the income_bracket
# entries that are "No Income" and change their income_source to "None". Second, we have a large number of families
# attending the pantries, and most of the children have no income. So, if they have parents, their income is now "Parents Income".

income_source_nulls <- data %>%
  filter(is.na(income_source))

data <- data %>%
  mutate(income_source = case_when(
    income_bracket == "No Income" ~ "None",
    TRUE ~ income_source
  ))

data <- data %>%
  group_by(house_id) %>%
  mutate(
    flag_parents_income = any(age_group %in% c("Adult", "Elderly")) & 
      any(age_group %in% c("Teenager", "Child", "Infant", "Toddler")) &
      any(family_type %in% c("Male Adult with Children", "Female Adult with Children"))
  ) %>%
  ungroup()

data <- data %>%
  mutate(
    income_source = if_else(
      flag_parents_income, 
      "Parents income", 
      income_source
    )
  )

data <- data %>%
  select(-flag_parents_income)

# 5b: Infants
# I had an idea: Are there any infants who are coming alone? And yes, yes there is. Over a thousand, in fact.
# We found them by using the age group and house_id, so if they are the only entry for the house_id, that row is removed. 

single_infant_households <- data %>%
  group_by(house_id) %>%
  filter(age_group == "Infant") %>%
  summarise(infants_in_house = n()) %>%
  filter(infants_in_house == 1) %>%
  pull(house_id)

data <- data %>%
  filter(!(house_id %in% single_infant_households & age_group == "Infant"))


# Step 6: Pull descriptive statistics
stats <- data %>%
  select_if(is.numeric) %>%
  summarise_all(list(
    mean = ~mean(.x, na.rm = TRUE),
    min = ~min(.x, na.rm = TRUE),
    max = ~max(.x, na.rm = TRUE),
    sd = ~sd(.x, na.rm = TRUE),
    n = ~sum(!is.na(.x))  
  ))

print(stats)
glimpse(data)
summary(data)
head(data)

## Part 3: Graphing and final analysis

# Step 1: Plotting segmented years demographics
create_line_plot <- function(df, var, title) {
  df <- df %>%
    filter(!(!!sym(var) %in% c("Prefer Not to Respond", "Unknown", "Not Selected")))
  
  plot <- df %>%
    filter(fp_location_groups %in% top_locations) %>%
    group_by(fp_location_groups, !!sym(var)) %>%
    summarise(unique_count = n_distinct(person_id), .groups = 'drop') %>%
    ggplot(aes(x = !!sym(var), y = unique_count, group = fp_location_groups, color = fp_location_groups)) +
    geom_line(linewidth = 1) +
    labs(title = title, x = var, y = "Unique Individuals", color = "Location") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
    scale_color_manual(values = c("red", "blue", "green", "purple", "brown", "black", "orange", "pink")) +
    scale_y_continuous(
      breaks = scales::pretty_breaks(n = 7)  # Dynamically adjust y-axis labels
    )
  
  return(plot)
}

# These are the most useful variables we have
variables <- c("gender", "race", "ethnicity", "education", "family_type", "housing_status", 
               "homelessness", "income_source", "income_bracket", "age_group")

for (var in variables) {
  p1 <- create_line_plot(data_2018_2019, var, paste("2018-2019:", var))
  p2 <- create_line_plot(data_2020_2022, var, paste("2020-2022:", var))
  p3 <- create_line_plot(data_2023_present, var, paste("2023-Present:", var))
  
  final_plot <- p1 / p2 / p3
  
  ggsave(paste0(var, "_segmented_years.png"), final_plot, width = 12, height = 9, dpi = 300)
}

# Step 2: At Risk zip code graphs
# Oliver found the most at-risk zip codes, and I narrowed it down to 11 (4 in the direct city, 4 in the suburbs, 3 outside DSM)
# This really became my niche in this project, and I have a separate R file for it. This is a condensed version.

## We follow the same steps as above here.
# zip_code_data.csv is data from the 11 zip codes I identified. It has the same properties as the original dataset, 
# just with less entries. 
zip_code_data <- read.csv("/Users/bradley/Desktop/Sem 4/CS 190/dmarc project/zip_code_data.csv")

zip_code_data <- zip_code_data %>%
  select(-fp_number)

zip_stats <- zip_code_data %>%
  group_by(zip_code, person_id) %>%
  summarise(across(where(is.numeric), first, .names = "{.col}"), .groups = "drop") %>%
  group_by(zip_code) %>%
  summarise(across(where(is.numeric), list(
    mean = ~mean(.x, na.rm = TRUE),
    min = ~min(.x, na.rm = TRUE),
    max = ~max(.x, na.rm = TRUE),
    sd = ~sd(.x, na.rm = TRUE),
    n = ~n()  
  ), .names = "{.col}_{.fn}"), .groups = "drop")

summary(zip_stats)

# Graphing, with the capital letters on both axes to make it stand out more.
capitalize_first <- function(x) {
  sapply(x, function(word) { paste0(toupper(substring(word, 1, 1)), substring(word, 2)) })
}

create_bar_plot <- function(df, var, zip_code) {
  df <- df %>%
    filter(!(!!sym(var) %in% c("Prefer Not to Respond", "Unknown", "Not Selected")), !is.na(!!sym(var)))
  
  top_locations <- df %>%
    filter(zip_code == !!zip_code) %>%
    group_by(fp_location_groups) %>%
    summarise(total_count = n_distinct(person_id), .groups = 'drop') %>%
    arrange(desc(total_count)) %>%
    slice_head(n = 5) %>%
    pull(fp_location_groups)
  
  all_levels <- unique(df[[var]])
  
  var_label <- capitalize_first(var)
  
  plot <- df %>%
    filter(zip_code == !!zip_code, fp_location_groups %in% top_locations) %>%
    group_by(fp_location_groups, !!sym(var)) %>%
    summarise(unique_count = n_distinct(person_id), .groups = 'drop') %>%
    complete(fp_location_groups, !!sym(var), fill = list(unique_count = 0)) %>%
    mutate(!!sym(var) := factor(!!sym(var), levels = all_levels)) %>%
    ggplot(aes(x = !!sym(var), y = unique_count, fill = fp_location_groups)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title = paste(zip_code, "Plotted by", var_label), x = var_label, y = "Number of People", fill = "Location") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
    scale_fill_manual(values = c("red", "blue", "green", "purple", "brown", "black", "orange", "pink")) +
    scale_y_continuous(breaks = scales::pretty_breaks(n = 7))
  
  return(plot)
}

zip_codes <- unique(zip_code_data$zip_code)

for (zip in zip_codes) {
  for (var in variables) {
    plot <- create_bar_plot(zip_code_data, var, zip)
    ggsave(paste0(zip, "_", var, ".png"), plot, width = 12, height = 9, dpi = 300)
  }
}

