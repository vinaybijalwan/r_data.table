##merge csv multiple file   Date:05-05-2023
##first load data.table library

library(data.table)

##set path 
path <- "C:\\my_path\\"

##use the 'list.files()' function to get list of all CSV file 

files <- list.files(path, pattern = "*.csv", full.names = TRUE)

##print all csv file system path 
files

##use the 'rbindlist()' function to meerge all the csv files into one 'data.table. 
#this function takes a list of data tables and combine them row-wise (i. e, by stacking them on top of each other)

dt16_22 <- rbindlist(lapply(files, fread))
##Error in rbindlist(lapply(files, fread)) : 


#Item 6 has 27 columns, inconsistent with item 1 which has 36 columns. To fill missing columns use fill=TRUE.



## filling missing columns with 'NA' values, because we set 'fill = TRUE'
##This command reads each CSV file into a data.table using the fread() function, which is a fast and efficient way to read large data files into R. Then, it uses the lapply() function to apply fread() to each file in the files list, and finally, it combines all the resulting data.tables into one using rbindlist()

dt16_22 <- rbindlist(lapply(files, fread), fill=TRUE)

##save the merged data.table to new csv file using 'fwrite()'

fwrite(dt16_22, "C:\\path\\patient_16_22.csv")


##this create "PAH_2016_2022.csv" file my folder having 500MB in size
#### This Take of my full day of 05 May 2023 
##finally done this task
