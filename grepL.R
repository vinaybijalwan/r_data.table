##Date: 16-08-2023

##Using grepl in data.table

#>The grepl function in R search for matches to argument pattern
#>within each element of a character vector or column of an
#> R data frame
#> If we want to subset rows of an R data frame using grepl 
#> then subsetting with single-square brackets and grepl can
#> be used by accessing the column that contains character values.
#> 



# Load the data.table library
library(data.table)

# Create a data.table with the provided data
data <- data.table(
  Date = c("01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
           "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
           "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
           "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023"),
  Type = c("X", "Y", "Z", "P", "Q", "R",
           "X", "Y", "Z", "P", "Q", "R",
           "X", "Y", "Z", "P", "Q", "R",
           "X", "Y", "Z", "P", "Q", "R"),
  Letters = c("a/A | b/B", "c/C | d/D", "e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L",
              "a/A | b/B", "c/C | d/D", "e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L",
              "a/A | b/B", "c/C | d/D", "e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L",
              "a/A | b/B", "c/C | d/D", "e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L")
)

# Filter the data for "k/K | l/L"
filtered_data <- data[grepl("k/K | l/L", Letters)]

# Print the filtered data
print(filtered_data)

#     Date        Type   Letters
# 1: 20-08-2023    R    k/K | l/L
# 2: 20-08-2023    R    k/K | l/L
# 3: 20-08-2023    R    k/K | l/L
# 4: 20-08-2023    R    k/K | l/L

# Regular expression pattern for "a" at the start of the string

pattern <- "^a"

# Filter the data for rows where "Letters" column starts with the pattern using grepl
filtered_data1 <- data[grepl(pattern, Letters)]


filtered_data1


#     Date        Type   Letters
# 1: 01-04-2023    X    a/A | b/B
# 2: 01-04-2023    X    a/A | b/B
# 3: 01-04-2023    X    a/A | b/B
# 4: 01-04-2023    X    a/A | b/B


##
