##Date 22-12-2023

# In this file we want to find last created plant in our WFO data

#Set Working dir
setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")


## for working WFO data, thse are require lib for Installtion.

#install.packages("WorldFlora")
#install.packages("data.table")

## if not install these package you cam remove # from begin 


#Use these above library for working 

library(WorldFlora)

# WorldFlora 1.13-2: Use function WFO.match or WFO.match.fuzzyjoin to check plant names;
# 
# First you need to download and unzip the World Flora Online taxonomic backbone from 
# www.worldfloraonline.org/downloadData;
# 
# Use functions WFO.download and WFO.remember to download and reload the backbone data;
# 
# Package RcmdrPlugin.WorldFlora provides a graphical user interface for this package.
# Warning message:
#   package ‘WorldFlora’ was built under R version 4.3.2 


library(data.table)

# data.table 1.14.8 using 2 threads (see ?getDTthreads).  Latest news: r-datatable.com
# 
# Attaching package: ‘data.table’
# 
# The following object is masked _by_ ‘.GlobalEnv’:
#   
#   .N
# 
# Warning message:
#   package ‘data.table’ was built under R version 4.3.1 


# List all functions in the package
ls("package:WorldFlora")


# [1] "new.backbone"         "WFO.acceptable.match" "WFO.browse"          
# [4] "WFO.download"         "WFO.family"           "WFO.match"           
# [7] "WFO.match.fuzzyjoin"  "WFO.one"              "WFO.prepare"         
# [10] "WFO.remember"         "WFO.synonyms"         "WFO.url" 



#To download WFO data

#WFO.download()  # but we have already download data , now we can only remember

WFO.remember()

# Data sourced from: C:\Users\vinay_bijalwan.PATANJALI\Desktop\data_analysis_with_R\classification.csv (Sat Dec 16 14:49:22 2023)
# Reading WFO data
# |--------------------------------------------------|
#   |==================================================|
#   The WFO data is now available from WFO.data


#after remember WFO data . we can use WFO function


##Convert WFO.data to data.table framework for fast data manipulation
WFO.data <-setDT(WFO.data)


colnames(WFO.data)

# [1] "taxonID"               [6] "parentNameUsageID"    
# [2] "scientificNameID"      [7] "scientificNameAuthorship"          
# [3] "localID"               [8] "family"  
# [4] "scientificName"        [9] "subfamily"         
# [5] "taxonRank"             [10] "tribe"

#########################################

# [11] "subtribe"             [16] "verbatimTaxonRank"           
# [12] "genus"                [17] "nomenclaturalStatus"                  
# [13] "subgenus"             [18] "namePublishedIn"                      
# [14] "specificEpithet"      [19] "taxonomicStatus"        
# [15] "infraspecificEpithet" [20] "acceptedNameUsageID"

######################################################

# [21] "originalNameUsageID"  [26] "references"     
# [22] "nameAccordingToID"    [27] "source"      
# [23] "taxonRemarks"         [28] "majorGroup"           
# [24] "created"              [29] "tplID"                         
# [25] "modified"  

##########################################################


##i am find data which is laist updated or created 

WFO.data$created <- as.Date(WFO.data$created, format = "%Y-%m-%d")


#Find the last created date:

last_created_date <- max(WFO.data$created)

last_created_date

# [1] "2023-02-24"

last_created_row <- WFO.data[which.max(created)]

last_created_row

fwrite(last_created_row, "last_created_row.csv")
