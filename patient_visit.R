## date: 

##using R data.table
##Task having data set of medical record with patient 1st visit and Follow up Visit
##Count number of doctor (Vaidya in hindi) wise


install.packages("data.table")                    # Install data.table package


library("data.table")                             # Load data.table package


##first create new data set

Name <- c("A", "B", "C", "D", "E", "F", "G")
disease <- c("CKD", "BP", "Sugar", "Cancer", "MND", "HIV", "Eczema")
Vaidya_Name <- c("X", "Y", "Z", "X", "Y", "Z", "X")
NoOfVisit <- c(1, 2, 2, 4, 2, 1, 1)


##now create data.table

data <- data.table(Name, disease, Vaidya_Name, NoOfVisit)
data


# Name        disease   NoOfVisit
# 1:    A       CKD       1
# 2:    B       BP        2
# 3:    C       Sugar     2
# 4:    D       Cancer    4
# 5:    E       MND       2
# 6:    F       HIV       1
# 7:    G       Eczema    1


##also can get data form csv file

#data1 <- fread("Path//to//csv")

##find number of patient visit wise
##separate 1st visit, greater than 1  patient and count 

follow_up <- data[, .(First_Visit_Patients = sum(NoOfVisit == 1),
                   Follow_Up_Visits = sum(NoOfVisit > 1)),
               by = Vaidya_Name]

follow_up

# Vaidya_Name	First_Visit_Patients	Follow_Up_Visits
#  X                	2	                1
#  Y	                0	                2
#  Z	                1	                1


##Saving filter data in csv file
##using data.table fwrite function 

fwrite(follow_up, "follow_up.csv")


