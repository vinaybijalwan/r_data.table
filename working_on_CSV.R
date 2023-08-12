##Date: 08-08-2023

#> Using data,table manipulate in csv file in different aspect 
#> 
#> 
## > install data.table package 

#install.packages('data.table')

##Load data.table 

library(data.table)


DT <- fread("06_June_2023.csv")

dim(DT)


DT[Category == "DERMATOLOGICAL DISORDERS"] #Select all rows that have value DERMATOLOGICAL in column Category

DT[Category %in% c("DERMATOLOGICAL DISORDERS", "RENAL DISORDERS")] #Select all rows that have value DERMATOLOGICAL or RENAL DISORDERS in column Category



