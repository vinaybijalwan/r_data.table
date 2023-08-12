# Load the data.table library
library(data.table)

# Create a data.table with some sample data
data <- data.table(
  a = c(2, 3, 4),
  b = c(5, 6, 7),
  c = c(8, 9, 10)
)

data
# Specify the columns you want to operate on
cols1 <- c("a", "b")

# Apply a row operation using .SDcols to square selected columns
sqr <- data[, result := sum((.SD[, ..cols1])^2), by = 1:nrow(data)]


#> In  ..cols1 , here is .. That notation is used in certain situations
#>  where you want to refer to variables outside of the immediate scope.
 
#> by = 1:nrow(data) - > applying the row-wise operation separately 
#> to each row of the data, 


row <- data[, .SD[1:2], by = 1:nrow(data)]

row
# Print the updated data.table
print(data)


