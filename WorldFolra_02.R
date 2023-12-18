##Date 18-12-2023

#install.packages("WorldFlora")
#install.packages("dplyr")
#install.packages("data.table")

#Use these above library for working 

library(WorldFlora)
library(data.table)
library(dplyr)


#Set Working dir
setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")

# List all functions in the package
ls("package:WorldFlora")
#First Remember Download data
WFO.remember()


# get a list of Sapotaceae species
Sapotaceae <- WFO.data[WFO.data$family == "Sapotaceae",]

Sapotaceae

fwrite(Sapotaceae, "Sapotaceae.csv")


##Convert WFO.data to data.table framework
WFO.data <-setDT(WFO.data)


#now check data type of WFO.data

typeof(WFO.data)

## "list"
 ## it give list of type


class(WFO.data)

# [1] "data.table" "data.frame"  # it give data.table 


# Filter rows where 'family' starts with 'a'
Afamily <- WFO.data[grep("^a", family, ignore.case = TRUE), ]

Afamily

fwrite(Afamily, "Afamily.csv")

#Filter scientificName data with start with a letter
A_scientificName <- WFO.data[grep("^a", scientificName, ignore.case = TRUE), ]

fwrite(A_scientificName, "A_scientificName.csv")









