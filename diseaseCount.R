#Date: 02-09-2023

#This script count number of Disease per patient in data.table

# Load the data.table library
library(data.table)

# Create a data.table with your data
data <- data.table(
  NamePatient = c("A", "B", "C", "D", "E", "F", "G", "H", "A", "B", "C", "D", "E", "F", "G", "H"),
  Disease = c("X | Y", "Y | Z", "P | Q | R", "M | N", "P | Q | X", "X | Y | Z", "Z | Q | R", "Q", "X | Y", "Y | Z", "P | Q | R", "M | N", "P | Q | X", "X | Y | Z", "Z | Q | R", "Q")
)

# Split the Disease column into a list of diseases
data[, Disease := strsplit(Disease, " \\| ")]

# Calculate the count of diseases for each patient
data[, .(CountDisease = length(unlist(Disease))), by = NamePatient]

#       NamePatient CountDisease
# 1:           A            4
# 2:           B            4
# 3:           C            6
# 4:           D            4
# 5:           E            6
# 6:           F            6
# 7:           G            6
# 8:           H            2

