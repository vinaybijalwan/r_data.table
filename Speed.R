##testing speed of data.table in R
getwd()
setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")
getwd()
library(data.table)

# Create a large .csv file
set.seed(100)
m <- data.frame(matrix(runif(10000000), nrow=1000000))
write.csv(m, 'm2.csv', row.names = F)

# Time taken by read.csv to import
system.time({m_df <- read.csv('m2.csv')})
#>   user  system elapsed 
#> 33.54   0.52  43.48 

# Time taken by fread to import
system.time({m_dt <- fread('m2.csv')})
#>  user  system elapsed 
#> 0.53   0.36   34.94 

