#date: 12-08-2023

# Load the data.table library
library(data.table)


#> Create numeric data set - Random Number Generator Functions
#> runif() and set.seed() in R programming that enable the user
#> to generate random numbers and control the generation process,

RandomNum <- runif(5, 1, 10)
RandomNum
#[1] 2.994125 1.218627 3.216637 6.279176 1.882372

#> Random number generator doesn’t actually produce 
#> random values as it requires an initial value called SEED.
#>Random number generation can be controlled with SET.SEED()
#> functions. SET.SEED() command uses an integer to start the
#> random number of generations.
#> 


#> For example, We will use the code to sample 10 numbers
#>  between 1 and 100 and repeat it a couple of times

#>  For the first time the SET.SEED() will start at seed
#>  as 5 and second time as seed as 12. Ten random numbers
#>  have been generated for each iteration.
#>  

set.seed(5) # random number will generate from 5

TenRandomNumbers <- sort(sample.int(100, 10))

TenRandomNumbers



#> 1. Uniformly Distributed Random Numbers
#>  runif() is used
#>  Default range 0 – 1

# To get 5 uniformly distributed Random Numbers
runif(5) ## number 01 code
#[1] 0.5591728 0.2625931 0.2018752 0.3875257 0.8878698

# Next time run this code 
runif(5)
# [1] 0.5549226 0.8421794 0.8902071 0.7207010 0.2113403

# both code same but number out is different 

# Get 5 random Numbers from 5 to 99
runif(10, min=5, max=50)


# [1] 17.29782 27.07309 19.32818 30.16278 16.81669
# [6] 14.08438 22.43866 44.95414 29.97151 42.89807

floor(runif(10, min=5, max=50))
# [1] 45 37 14 15 11 26 24 48 11 47

#> 2. Normally Distributed Random Numbers
#> normal distribution rnorm()

#> Where mean is 0 and the standard deviation is 1
rnorm(5)

# using a different mean and standard deviation
rnorm(4, mean=70, sd=10)

#> [1] 67.06518 84.18589 84.98774 63.42918
#> 
#> 3. Binomial Random Numbers
#> 
n= 5
p=.5
rbinom(1 ,n, p)
# 1 success in 5 trails
# [1] 2

n= 5
p=.5
rbinom(19, n, p) # 10 binomial numbers

# [1] 1 3 1 4 5 5 4 4 1 4 4 4 3 1 4 0 4 1 3

#> 4. ExponEntially distributed random numbers
#> 


x=rexp(10, 1/15)
x
# [1] 13.660563  9.712364 31.132908 38.182689 10.917707
# [6]  8.494666 14.836635  3.344593  6.390542 15.557015


rn = sample(5:20, 5)
rn

#[1]  7 16 15 20  8
