#Date 16-12-2023

#these package are required for using World Flora 
#if you have not install please remove # from line

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


# download the Taxonomic Backbone data
WFO.download()

#WFO.data

# remember the previous download and avail the data as 'WFO.data'
WFO.remember()

# check
WFO.match("Faidherbia albida", WFO.data=WFO.data)

data(WFO.example)


spec.test <- data.frame(spec.name=c("Faidherbia albida", "Acacia albida",
                                    "Omalanthus populneus", "Pygeum afric"))

WFO.match(spec.data=spec.test, WFO.data=WFO.example, counter=1, verbose=TRUE)

mydt <- WFO.match(spec.data=spec.test, WFO.data=WFO.example, counter=1, verbose=TRUE)
mydt


# Also calculate the Levenshtein distance for the genus
WFO.match(spec.data=spec.test, WFO.data=WFO.example, First.dist=TRUE,
          counter=1, verbose=TRUE)


# Show all the fuzzy matches, which included those at infraspecifc level
e1 <- WFO.match(spec.data=spec.test, WFO.data=WFO.example, counter=1,
                Fuzzy.min=FALSE, Fuzzy.shortest=FALSE, verbose=TRUE)

e1


# Use function WFO.one for a 1-to-1 match between submitted and matched names
WFO.one(e1)


# Hybrid species
WFO.match("Arabis divaricarpa", WFO.data=WFO.example)
WFO.match("Arabis x divaricarpa", WFO.data=WFO.example)


# Convert capitals to lower case
WFO.match("FAIDHERBIA ALBIDA", WFO.data=WFO.example, spec.name.tolower=TRUE)

# Remove sections of plant names that are equal to ' sp.' or ' indet. '
WFO.match("Prunus sp.", WFO.data=WFO.example, spec.name.sub=TRUE)


# Get urls, but do not open any
e2 <- WFO.match(spec.data=spec.test, WFO.data=WFO.example, counter=1, verbose=TRUE)
WFO.url(e2, browse=FALSE, browse.rows=c(1:nrow(e2)))


# Include input species names where no matches were found
# This happens when the name with original species names is provided to WFO.one
x1 <- WFO.match("World agroforestry", WFO.data=WFO.example)
WFO.one(x1, spec.name="spec.name")

