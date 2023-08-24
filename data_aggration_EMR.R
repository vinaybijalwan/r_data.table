# Load the data.table library
library(data.table)

# Create a sample EMR dataset
emr_data <- data.table(
  patient_id = c(1, 2, 1, 3, 2),
  visit_date = as.Date(c("2023-01-15", "2023-02-10", "2023-02-20", "2023-03-05", "2023-03-10")),
  diagnosis = c("Cold", "Fever", "Cold", "Flu", "Fever"),
  treatment = c("Rest", "Medication", "Rest", "Medication", "Medication"),
  outcome = c("Recovered", "Ongoing", "Recovered", "Ongoing", "Recovered")
)


emr_data

# 1. Total Number of Visits per Diagnosis:

diagnosis_summary <- emr_data[, .(TotalVisits = .N), by = diagnosis]
print(diagnosis_summary)


# 2. Average Number of Visits per Patient:

patient_avg_visits <- emr_data[, .(AvgVisits = .N / length(unique(visit_date))), by = patient_id]
print(patient_avg_visits)


# 3. Most Common Treatment for Each Diagnosis:

common_treatment <- emr_data[, .(MostCommonTreatment = mode(treatment)), by = diagnosis]
print(common_treatment)


# 4. Outcome Distribution by Diagnosis and Treatment:

outcome_distribution <- emr_data[, .N, by = .(diagnosis, treatment, outcome)]
print(outcome_distribution)


# Time Series Analysis: 

# Convert visit_date to a Date object
emr_data[, visit_date := as.Date(visit_date)]


# Count of Visits Over Time:

# Aggregate and count visits per day
daily_visits <- emr_data[, .(TotalVisits = .N), by = visit_date]
print(daily_visits)


# Plotting Visits Over Time:

# Load the ggplot2 library for visualization
library(ggplot2)

# Plotting total visits over time
ggplot(daily_visits, aes(x = visit_date, y = TotalVisits)) +
  geom_line() +
  labs(x = "Date", y = "Total Visits", title = "Total Visits Over Time")


# Average Number of Visits Per Month:

# Extract month and year from visit_date
emr_data[, month := month(visit_date)]
emr_data[, year := year(visit_date)]

# Aggregate and calculate average visits per month
avg_visits_per_month <- emr_data[, .(AvgVisits = mean(.N)), by = .(year, month)]
print(avg_visits_per_month)

# year month AvgVisits
# 1: 2023     1         1
# 2: 2023     2         2
# 3: 2023     3         2


# Diagnosis Distribution Over Time:

# Count diagnoses per day
diagnosis_distribution <- emr_data[, .N, by = .(visit_date, diagnosis)]
print(diagnosis_distribution)






