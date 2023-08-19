#Date 19-08-2023


## This script for creating graph in data.table r


library('data.table')
library(ggplot2)


# Create the data table
data <- data.table(
  Visit_Date = c("01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023", "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023", "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023", "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023"),
  Doctor_Name = c("X", "Y", "Z", "P", "Q", "R", "X", "Y", "Z", "P", "Q", "R", "X", "Y", "Z", "P", "Q", "R", "X", "Y", "Z", "P", "Q", "R"),
  Patient_Name = c("Amit", "Raj", "Sohan", "Vinay", "Vijay", "Ranju", "Diskha", "Rajni", "Mohan", "Sanjeev", "Ravindra", "Mahesh", "Kashi", "Manu", "Sanhu", "Gopu", "Bdlan", "Rohan", "Mishlesh", "Brij Lal", "Santosh", "Suresh", "Sunesh", "Rajesh")
)

data

# Calculate patient counts for each doctor
patient_counts <- data[, .(Patient_Count = .N), by = Doctor_Name]


patient_counts





# Create a bar graph
ggplot(patient_counts, aes(x = Doctor_Name, y = Patient_Count, fill = Doctor_Name)) +
  geom_bar(stat = "identity") +
  labs(title = "Doctor-wise Patient Count", x = "Doctor Name", y = "Patient Count") +
  theme_minimal()


# Create a bar graph with data labels
ggplot(patient_counts, aes(x = Doctor_Name, y = Patient_Count, fill = Doctor_Name)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Patient_Count), vjust = -0.5, color = "black", size = 3) +
  labs(title = "Doctor-wise Patient Count", x = "Doctor Name", y = "Patient Count") +
  theme_minimal()
