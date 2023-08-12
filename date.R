##working with dates in R


#install.packages("data.table") alrady install 
install.packages("lubridate")  ##it use for extract month, date and year from dates


#Load the necessary libraries:

library(data.table)
library(lubridate)


# Sample data.table
dt <- data.table(
  date_col = as.Date(c("2023-01-05", "2023-02-10", "2023-03-15", "2023-04-20", "2023-05-25"))
  name = c("Vinay", "Vijay", "Vikash", "Viaan", "Vishesh")
)

##Convert the date column to a proper date format using lubridate:

dt[, date_col := as.Date(date_col, format = "%Y-%m-%d")]


#Extract month and year from the date column:
dt[, month := month(date_col)]
dt[, year := year(date_col)]

dt

#     date_col    month year
# 1: 2023-01-05     1 2023
# 2: 2023-02-10     2 2023
# 3: 2023-03-15     3 2023
# 4: 2023-04-20     4 2023
# 5: 2023-05-25     5 2023


