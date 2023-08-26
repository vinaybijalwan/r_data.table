#Date:26-03-2023

# Load the required library
library(data.table)

# Generate example EMR data
set.seed(123)  # for reproducibility
n_records <- 100
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-08-31")

emr_data <- data.table(
  timestamp = sample(seq(start_date, end_date, by = "1 day"), n_records, replace = TRUE)
)

emr_data

# Convert timestamps to proper Date format
emr_data[, timestamp := as.Date(timestamp)]

# use the cut function to group your data into weeks

# Create week-based groupings and count occurrences
emr_data[, week := cut(timestamp, "week")]

weekly_counts <- emr_data[, .N, by = week]

# Print the weekly counts
print(weekly_counts)


#weekly counts with the day names instead of date ranges
weekly_counts <- emr_data[, .(week_start = min(timestamp), week_day = weekdays(min(timestamp)), count = .N), by = week]
print(weekly_counts)
