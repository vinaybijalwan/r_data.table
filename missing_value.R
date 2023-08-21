#Date: 21-08-202

#>In R, the easiest way to find columns that contain missing values 
#>is by combining the power of the functions is.na() and colSums(). 
#>First, you check and count the number of NA's per column. Then, you
#> use a function such as names() or colnames() to return the names of 
#> the columns with at least one missing value.
#> 

library(data.table)


my_df <- data.table(X1 = c(1, 2, NA, 4),
                    X2 = c(5:8),
                    X3 = c("A", NA, NA, "D"),
                    X4 = as.factor(c("M", "F", "F", NA)),
                    X5 = c("W", "X", "Y", "Z"))


my_df

#     X1 X2   X3   X4 X5
# 1:  1  5    A    M  W
# 2:  2  6 <NA>    F  X
# 3: NA  7 <NA>    F  Y
# 4:  4  8    D <NA>  Z


#Find Columns with NA's using the COLSUMS() Function

# Check if a value is missing

#> The is.na() function takes a data table as input and returns
#> an object that indicates for each value if it is a missing value
#> (TRUE) or not (FALSE). The output object of the is.na() function
#> has the same dimensions as the input data frame.
 

is.na(my_df) 


#       X1    X2    X3    X4    X5
# [1,] FALSE FALSE FALSE FALSE FALSE
# [2,] FALSE FALSE  TRUE FALSE FALSE
# [3,]  TRUE FALSE  TRUE FALSE FALSE
# [4,] FALSE FALSE FALSE  TRUE FALSE

#>Count the number of missing values per column

#>Once you have converted the original data frame into
#>a logical TRUE / FALSE matrix, you can count the number
#> of missing values per column (i.e. the number of TRUEs).
#>For this purpose, you can use the colSums() function.
#>

colSums(is.na(my_df))


# X1 X2 X3 X4 X5 
# 1  0  2  1  0 

#> Identify the position of the columns with at least one missing value

#> The next step is to identify the columns with at least one missing
#> value. To do so, you use the which() function and the condition
#>colSums() > 0. The which() function returns the position of the 
#>column(s) with at least one NA.


which(colSums(is.na(my_df))>0)

# X1 X3 X4 
# 1  3  4 

#>Return the column names with missing values

#>The last step is to convert the column positions into column names.
#>You can do this easily with the names() function. This function returns
#>a character vector with the column names that contain NA's.

names(which(colSums(is.na(my_df))>0))


#[1] "X1" "X3" "X4"