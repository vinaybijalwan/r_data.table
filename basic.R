##


#create data_frame
Name <- c("vinay", "vikas", "Rajeev", "Rohan", "Meera")
Age <- c(23, 34, 40, 15, 29)

df <- data.frame(Name, Age)



##---change data frame to data.table 
##before chnage data.table load library data.table
library(data.table)
setDT(df)
df

# ### Name Age
# 1:  vinay  23
# 2:  vikas  34
# 3: Rajeev  40
# 4:  Rohan  15
# 5:  Meera  29


#this is data.table which understand by 1 and 1:

###----------------------##

#add new column in df create new column first

City <- c("UKI", "HR", "DDN", "RK", "RR")
#now add this to df

#add the columns with the help
# of ":=" into the table

df[, ':='(City=City)]

df

# Name Age City
# 1:  vinay  23  UKI
# 2:  vikas  34   HR
# 3: Rajeev  40  DDN
# 4:  Rohan  15   RK
# 5:  Meera  29   RR


DT <- df
DT


## repalce column value specific value want to change UKI to HR



DT[City == 'UKI',  City := 'HR' ]
DT


# Name Age City
# 1:  vinay  23   HR
# 2:  vikas  34   HR
# 3: Rajeev  40  DDN
# 4:  Rohan  15   RK
# 5:  Meera  29   RR

##show the clumn value
DT[1:2] # 
DT[, c('Name', 'Age')] # its good pratice 

# Name Age
# 1:  vinay  23
# 2:  vikas  34
# 3: Rajeev  40
# 4:  Rohan  15
# 5:  Meera  29



