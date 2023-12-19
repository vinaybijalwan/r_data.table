#Dated 19-12-2023

setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")


#install.packages("WorldFlora")
#install.packages("dplyr")


#Use these above library for working 

library(WorldFlora)
library(data.table)


# List all functions in the package
ls("package:WorldFlora")


# [1] "new.backbone"         "WFO.acceptable.match"
# [3] "WFO.browse"           "WFO.download"        
# [5] "WFO.family"           "WFO.match"           
# [7] "WFO.match.fuzzyjoin"  "WFO.one"             
# [9] "WFO.prepare"          "WFO.remember"        
# [11] "WFO.synonyms"         "WFO.url" 


#First Download WolrdFlora Data asBackbone WFO.download()

# WFO.download() #we have already download in previous r script


#After download, Remember Download data in every script
WFO.remember()


# Data sourced from: C:\Users\vinay_bijalwan.PATANJALI\Desktop\data_analysis_with_R\classification.csv (Sat Dec 16 14:49:22 2023)
# Reading WFO data
# |--------------------------------------------------|
#   |==================================================|
#   The WFO data is now available from WFO.data






##convert WFO.data to data.table framework so our process give fast

WFO.data <-setDT(WFO.data)

#now check data type of WFO.data

class(WFO.data)

# [1] "data.table" "data.frame"  # it give data.table


##now we can use data.table function like 


family_uni <- unique(WFO.data, by = "family")

#saving the data as csv file

fwrite(family_uni, "family_uni.csv")

