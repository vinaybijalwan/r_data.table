##Date: 16-08-2023

# This Script for removing | this from coumn Disease 


# Assuming you have the data.table package loaded and your data is named "your_data"
library(data.table)

# Your data
my_data <- data.table(
  Visit_Date = c("01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
                 "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
                 "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023",
                 "01-04-2023", "05-05-2023", "08-07-2023", "17-02-2023", "09-01-2023", "20-08-2023"),
  Doctor_s_Name = c("X", "Y", "Z", "P", "Q", "R", "X", "Y", "Z", "P", "Q", "R",
                    "X", "Y", "Z", "P", "Q", "R", "X", "Y", "Z", "P", "Q", "R"),
  Disease = c("a/A | b/B", "c/C | d/D", "|e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L",
              "|a/A | b/B", "c/C | d/D", "e/E | f/F", "g/G | h/H", "|i/I | j/J", "k/K | l/L",
              "a/A | b/B", "|c/C | d/D", "|e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L",
              "a/A | b/B", "|c/C | d/D", "e/E | f/F", "g/G | h/H", "i/I | j/J", "k/K | l/L")
)


my_data

#     Visit_Date  Doctor_s_Name    Disease
# 1: 01-04-2023             X  a/A | b/B
# 2: 05-05-2023             Y  c/C | d/D
# 3: 08-07-2023             Z |e/E | f/F
# 4: 17-02-2023             P  g/G | h/H
# 5: 09-01-2023             Q  i/I | j/J
# 6: 20-08-2023             R  k/K | l/L
# 7: 01-04-2023             X |a/A | b/B

# 10: 17-02-2023             P  g/G | h/H
# 11: 09-01-2023             Q |i/I | j/J
# 12: 20-08-2023             R  k/K | l/L
# 13: 01-04-2023             X  a/A | b/B
# 14: 05-05-2023             Y |c/C | d/D
# 15: 08-07-2023             Z |e/E | f/F
# 16: 17-02-2023             P  g/G | h/H
#-- ----- --- --- - --- - - - - - - -
# 19: 01-04-2023             X  a/A | b/B
# 20: 05-05-2023             Y |c/C | d/D
# 21: 08-07-2023             Z  e/E | f/F
# 22: 17-02-2023             P  g/G | h/H
# 23: 09-01-2023             Q  i/I | j/J
# 24: 20-08-2023             R  k/K | l/L

# Removing disease entries starting with "|"
my_data[, Disease := gsub("^\\|", "", Disease)]

# Print the modified data.table
print(my_data)



#     Visit_Date Doctor_s_Name   Disease
# 1: 01-04-2023             X a/A | b/B
# 2: 05-05-2023             Y c/C | d/D
# 3: 08-07-2023             Z e/E | f/F
# 4: 17-02-2023             P g/G | h/H
# 5: 09-01-2023             Q i/I | j/J
# 6: 20-08-2023             R k/K | l/L
# 7: 01-04-2023             X a/A | b/B
# 8: 05-05-2023             Y c/C | d/D
# 9: 08-07-2023             Z e/E | f/F
# 10: 17-02-2023             P g/G | h/H
# 11: 09-01-2023             Q i/I | j/J
# 12: 20-08-2023             R k/K | l/L
# 13: 01-04-2023             X a/A | b/B
# 14: 05-05-2023             Y c/C | d/D
# 15: 08-07-2023             Z e/E | f/F
# 16: 17-02-2023             P g/G | h/H
# 17: 09-01-2023             Q i/I | j/J
# 18: 20-08-2023             R k/K | l/L
# 19: 01-04-2023             X a/A | b/B
# 20: 05-05-2023             Y c/C | d/D
# 21: 08-07-2023             Z e/E | f/F
# 22: 17-02-2023             P g/G | h/H
# 23: 09-01-2023             Q i/I | j/J
# 24: 20-08-2023             R k/K | l/L


