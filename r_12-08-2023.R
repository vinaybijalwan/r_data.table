##Date: 12-08-2023


#> Set My Path , Where we work in system
setwd("C:\\Users\\vinay_bijalwan.PATANJALI\\Desktop\\data_analysis_with_R")
getwd()

#> Now my working director is data_analysis_with_R

#--------------------------------------------------#

#> Using data.table 

library('data.table')

#> creating data Frame for manipulating 
#> 

df1 <- data.frame(a = seq(8,30,by=2),
                  b = LETTERS[1:12],
                  x= month.abb[1:12],
                  y = sample(20:30,12, replace = TRUE),
                  z=  letters[1:12])

df1

df2 <- data.frame(a = seq(1,24,by=2),
                  b = LETTERS[1:12],
                  x= month.abb[1:12],
                  y = sample(10:20,12, replace = TRUE),
                  z=  letters[1:12])
df2


#     a b   x  y z
# 1   1 A Jan 19 a
# 2   3 B Feb 10 b
# 3   5 C Mar 20 c
# 4   7 D Apr 16 d
# 5   9 E May 20 e
# 6  11 F Jun 16 f
# 7  13 G Jul 13 g
# 8  15 H Aug 16 h
# 9  17 I Sep 16 i
# 10 19 J Oct 19 j
# 11 21 K Nov 15 k
# 12 23 L Dec 17 l

#> join two data frame set 
#> rbind() - combines two data frames vertically
#> cbind() - combines two data frames horizontally


#> # combine two data frames vertically 

df <- rbind(df1, df2)
df

#     a b   x  y z
# 1   8 A Jan 28 a
# 2  10 B Feb 22 b
# 3  12 C Mar 20 c
# 4  14 D Apr 26 d
# 5  16 E May 30 e
# 6  18 F Jun 25 f
# 7  20 G Jul 29 g
# 8  22 H Aug 22 h
# 9  24 I Sep 20 i
# 10 26 J Oct 21 j
# 11 28 K Nov 25 k
# 12 30 L Dec 22 l
# 13  1 A Jan 19 a
# 14  3 B Feb 10 b
# 15  5 C Mar 20 c
# 16  7 D Apr 16 d
# 17  9 E May 20 e
# 18 11 F Jun 16 f
# 19 13 G Jul 13 g
# 20 15 H Aug 16 h
# 21 17 I Sep 16 i
# 22 19 J Oct 19 j
# 23 21 K Nov 15 k
# 24 23 L Dec 17 l

#-------------------------------------------------#


#> Chnage this data Frame to data.table 

setDT(df)

df

#     a b   x  y z
# 1:  8 A Jan 28 a
# 2: 10 B Feb 22 b
# 3: 12 C Mar 20 c
# 4: 14 D Apr 26 d
# 5: 16 E May 30 e
# 6: 18 F Jun 25 f
# 7: 20 G Jul 29 g
# 8: 22 H Aug 22 h
# 9: 24 I Sep 20 i
# 10: 26 J Oct 21 j
# 11: 28 K Nov 25 k
# 12: 30 L Dec 22 l
# 13:  1 A Jan 19 a
# 14:  3 B Feb 10 b
# 15:  5 C Mar 20 c
# 16:  7 D Apr 16 d
# 17:  9 E May 20 e
# 18: 11 F Jun 16 f
# 19: 13 G Jul 13 g
# 20: 15 H Aug 16 h
# 21: 17 I Sep 16 i
# 22: 19 J Oct 19 j
# 23: 21 K Nov 15 k
# 24: 23 L Dec 17 l
#     a b   x  y z


## now data Frame(1) convert to data.table (look like in 1: )


##Working with .SD & .SDcols

#> 
df[, .SD[1:2], by = x]

#     x   a b  y z
# 1: Jan  8 A 28 a
# 2: Jan  1 A 19 a
# 3: Feb 10 B 22 b
# 4: Feb  3 B 10 b
# 5: Mar 12 C 20 c
# 6: Mar  5 C 20 c
# 7: Apr 14 D 26 d
# 8: Apr  7 D 16 d
# 9: May 16 E 30 e
# 10: May  9 E 20 e
# 11: Jun 18 F 25 f
# 12: Jun 11 F 16 f
# 13: Jul 20 G 29 g
# 14: Jul 13 G 13 g
# 15: Aug 22 H 22 h
# 16: Aug 15 H 16 h
# 17: Sep 24 I 20 i
# 18: Sep 17 I 16 i
# 19: Oct 26 J 21 j
# 20: Oct 19 J 19 j
# 21: Nov 28 K 25 k
# 22: Nov 21 K 15 k
# 23: Dec 30 L 22 l
# 24: Dec 23 L 17 l
#x  a b  y z

#> less than two

df[1:24, tail(.SD, 2), by = x]



#> Mean of column a in data set

df[, lapply(.SD, mean), .SDcols = c("a")]

#     a
# 1: 15.5

df[, lapply(.SD, mean), .SDcols = c("a", "y")]

#     a        y
# 1: 15.5 20.29167

#> to get max value in column wise

df[, lapply(.SD, max), .SDcols = c("a", "y")]

#     a  y
# 1: 30 30

##want to run function in particular column in every element 

## first create new function

##function we want small letter in x (month)

df[, lapply(.SD, sqrt), .SDcols = c("a")]

#     a
# 1:  8
# 2: 10
# 3: 12
#- - - - - 
# 20: 15
# 21: 17
# 22: 19
# 23: 21
# 24: 23

#> Find the square of all number in column in "a" 

df[, ("a") := lapply(.SD, function(x) x^2), .SDcols = c("a")]
df

#     a  b   x  y z
# 1:  64 A Jan 28 a
# 2: 100 B Feb 22 b
## --------------
# 22: 361 J Oct 19 j
# 23: 441 K Nov 15 k
# 24: 529 L Dec 17 l


#> Find the Medain of column name "a" 
df[, lapply(.SD,  median), .SDcols = c("a")]


# a
# 1: 240.5


##Change in lower case & upper case in column 
#The toupper() function in R converts a string to uppercase.

df[, lapply(.SD,  toupper), .SDcols = c("x")] # Apply toupper() function

#    x
# 1: JAN
# 2: FEB
# 3: MAR
# 4: APR
#-------
# 23: NOV
# 24: DEC

df[, lapply(.SD,  tolower), .SDcols = c("x")]   # Apply tolower() function

#     x
# 1: jan
# 2: feb
# 3: mar
# 4: apr
# - - - -
# 20: aug
# 21: sep
# 22: oct
# 23: nov
# 24: dec


df[, lapply(.SD, mean), .SDcols = c("a", "y")]

#       a         y
# 1: 300.1667 20.29167
