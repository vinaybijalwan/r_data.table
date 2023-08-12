##
setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")

library(data.table)

##read csv file as fread function 

pat <- fread("06_June_2023.csv")


#Get the first two observations by Gender using .SD
dt1 <- pat[, .SD[1:2], by = Gender]

fwrite(dt1, "sd.csv")

#Filter rows with age size greater than 11.

pat[, 
   .SD[.N > 11], 
   keyby = .(Age)]




fwrite(pat[, 
           .SD[.N < 11], 
           keyby = .(Age)], "age.csv")




#Get the row with the max age by State wise.

State <- pat[, .SD[which.max(Age)], by = State]

fwrite(State, "State.csv")


