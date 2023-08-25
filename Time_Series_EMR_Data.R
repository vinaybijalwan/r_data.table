# Date 25-08-2023


# Load the data.table library
library(data.table)

# Create a sample time series dataset
time_series_data <- data.table(
  date = as.Date(seq(from = as.Date("2023-01-01"), by = "day", length.out = 60)),
  patient_count = c(10, 15, 20, 18, 25, 30, 35, 40, 45, 50,
                    55, 60, 62, 70, 75, 80, 85, 90, 95, 100,
                    105, 110, 115, 120, 125, 130, 135, 140, 145, 150,
                    155, 160, 165, 170, 175, 180, 185, 190, 195, 200,
                    205, 210, 215, 220, 225, 230, 235, 240, 245, 250,
                    255, 260, 265, 270, 275, 280, 285, 290, 295, 300)
)

time_series_data


#Plotting Time Series Data:

# Load the ggplot2 library for visualization
library(ggplot2)

# Plotting patient count over time
ggplot(time_series_data, aes(x = date, y = patient_count)) +
  geom_line() +
  labs(x = "Date", y = "Patient Count", title = "Patient Count Over Time")


#Decomposition of Time Series:
# Convert the data.table to a time series object
ts_data <- ts(time_series_data$patient_count, frequency = 7)  # Assuming daily data with a weekly pattern


# Decompose the time series into trend, seasonal, and remainder components
decomposition <- decompose(ts_data, type = "additive")

# Plot the decomposed components
plot(decomposition)




