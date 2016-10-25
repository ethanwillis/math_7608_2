# Ethan Willis -- Math 7608 - Homework 1


# R code to find the monthly payment for loans of
# 1(a) $1500 with monthly interest rate of 1% and 10 payments.
# 1(b) $200,000 with monthly interest rate of .003 based on 300 monthly payments.
#
#	Monthly payments for a loan with payments starting 1 month after disbursal can be found using the following formula:
#		R = P*(i/(1-((1+i)^-n)))
#	Where:
#		R: Monthly payment size
#		P: Initial loan size, principal
#		i: interest rate of loan.
#		n: Number of payment installments.

# Begin code for 1(a)
# Store values for known variables.
a_P <- 1500
a_i <- .01
a_n <- 10
# Calculate and store monthly payment amount.
a_R <- a_P*(a_i/(1-((1+a_i)^-a_n)))
# Output monthly payment amount.
print(a_R)
# End code for 1(a)

# Begin code for 1(b)
# Store values for known variables.
b_P <- 200000
# TODO: Is this supposed to be .003 or .003%?
b_i <- .003
b_n <- 300
# Calculate and store monthly payment amount.
b_R <- b_P*(b_i/(1-((1+b_i)^-b_n)))
# Output monthly payment amount.
print(b_R)
# End code for 1(b)


# Create the following vectors using rep() and seq()
# 2(a) 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4
# 2(b) 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
# 2(c) 1 2 3 4 5 2 3 4 5 6 3 4 5 6 7 4 5 6 7 8 5 6 7 8 9

# Begin code for 2(a)
# Create a vector that's the combination of the repetition of numbers 0, 1, 2, 3, 4
# 5 times each.
a_vector <- c(rep(0, 5), rep(1, 5), rep(2, 5), rep(3, 5), rep(4, 5))
# Output the vector
print(a_vector)
# End code for 2(a)

# Begin code for 2(b)
# Create a vector that's the repetition 5 times of the sequence 1, 2, 3, 4, 5
b_vector <- rep(c(1, 2, 3, 4, 5), 5)
# Output the vector
print(b_vector)
# End code for 2(b)

# Begin code for 2(c)
# Create a vector that's the combination of sequences successively increasing their start and end values by 1
c_vector <- c(seq(1,5), seq(2,6), seq(3,7), seq(4, 8), seq(5,9))
# Output the vector
print(c_vector)
# End code for 2(c)

# Using the following observations..
# 3(a) Assign the data to an object called solar.radiation
# 3(b) Find the mean, median, and variance of the radiation observations.
# 3(c) Add 10 to each of the observations and assign  to sr10. Find the mean, median, and variance of sr10
# 3(d) Multiply each observation by -2 and assign to srm2. Find the mean, median, and variance of srm2.
# 3(e) Plot histograms of solar.radiation, sr10, and srm2 using hist()

# 3(a) Assign the data
solar.radiation <- c(11.1, 10.6, 6.3, 8.8, 10.7, 11.2, 8.9, 12.2)

# 3(b) Find, store, and output the mean of solar.radiation
sr_mean <- sum(solar.radiation)/length(solar.radiation)
print(sr_mean)

# 3(b) Find, store, and output the median of solar.radiation
sr_median <- median(solar.radiation)
print(sr_median)

# 3(b) Find and output the variance of solar.radiation
sr_var <- var(solar.radiation)
print(sr_var)

# 3(c) Add 10 to each of the observations to variable sr10
sr10 <- solar.radiation+10

# 3(c) Find, store, and output  the mean, median, and variance of sr10
sr10_mean <- sum(sr10)/length(sr10)
sr10_median <- median(sr10)
sr10_var <- var(sr10)
print(sr10_mean)
print(sr10_median)
print(sr10_var)

# 3(d) Multiply each observation of solar.radiation and assign to srm2
srm2 <- solar.radiation * -2
srm2_mean <- sum(srm2)/length(srm2)
srm2_median <- median(srm2)
srm2_var <- var(srm2)
print(srm2_mean)
print(srm2_median)
print(srm2_var)

# 3(e) Plot the histograms of solar.radiation, sr10, and srm2
par(mfrow=c(3,1))
hist(solar.radiation)
hist(sr10)
hist(srm2)
