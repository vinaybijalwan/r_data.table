##Date: 12-08-2023 Time : 4:45 PM

# Load the data.table library
library(data.table)

##Create dummy data Set for working


df1 <- data.table(
  math = c(80, 90, 50, 60, 75, 45, 78, 55, 95, 80),
  hindi = c(75, 45, 45, 60, 70, 75, 65, 78, 61, 40),
  sanskrit = c(50, 45, 78, 68, 54, 90, 54, 76, 86, 60),
  EVS = c(45, 56, 67, 89, 67, 59, 79, 50, 70, 50)
)

df1


#      math hindi sanskrit EVS
# 1:   80    75       50  45
# 2:   90    45       45  56
# 3:   50    45       78  67
# 4:   60    60       68  89
# 5:   75    70       54  67
# 6:   45    75       90  59
# 7:   78    65       54  79


# sum of student number row wise  using .SD 

col_index <- c("math", "hindi")
sumSt <- df1[, result := sum(.SD[, ..col_index]), by = 1:nrow(df1)]

#> ..col_index --> That notation is used in certain situations where you 
#>              want to refer to variables outside of the immediate scope.
#> 1:nrow(df1) --> applying the row-wise operation separately to each row of the data,

sumSt

#     math hindi sanskrit EVS result
# 1:   80    75       50  45    155
# 2:   90    45       45  56    135
# 3:   50    45       78  67     95
# 4:   60    60       68  89    120
# 5:   75    70       54  67    145
# 6:   45    75       90  59    120
# 7:   78    65       54  79    143
# 8:   55    78       76  50    133
# 9:   95    61       86  70    156
# 10:   80    40       60  50    120


#> Now we have sum of only two column as row wise sum 
#> here is math column and hindi column  
#> math 80 and hindi is 75 then sum is 155, like all the row only my selected column