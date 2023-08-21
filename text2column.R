#> Date: 21-08-2023


#> this script for text to column as we use in excel 
#> 


#> use the tstrsplit() function to split a column of 
#> text into multiple columns based on a specified delimiter.


library(data.table)

# Sample data
dt <- data.table(text_column = c("apple,banana,orange", "grape,kiwi", "pear"))


dt 

#         text_column
# 1: apple,banana,orange
# 2:          grape,kiwi
# 3:                pear


# Split text_column into multiple columns
dt[, c("col1", "col2", "col3") := tstrsplit(text_column, ",", fixed = TRUE)]

# Print the result
print(dt)



#           text_column  col1   col2   col3
# 1: apple,banana,orange apple banana orange
# 2:          grape,kiwi grape   kiwi   <NA>
# 3:                pear  pear   <NA>   <NA>



#> In this example, tstrsplit(text_column, ",", fixed = TRUE) splits 
#> the text_column using the comma , as the delimiter and creates new 
#> columns col1, col2, and col3 with the split values. The fixed = TRUE 
#> argument is used to treat the delimiter as a fixed string rather than a 
#> regular expression
#> 


#>Keep in mind that tstrsplit() returns a matrix, so we use := to assign 
#>the resulting matrix to new columns in the data.table
