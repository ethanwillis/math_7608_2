# The geometric mean of X_1, x_2, ..., X_n is prod(X_i)^(1/n)
# given a vector x, calculate the gemeotric mean using a for loop and vector operations.

# Note: geom.mean = (x1 * x2 * ... * xn)^(1/n)

x <- c(10, 12, 8, 7, 9, 2)
## For loop
prod<-1
for(i in 1:length(x)) {
	prod <- prod*x[i]
}

print(geom.mean<-prod^(1/length(x)))

# vector operations
print(geom.mean<-prod(x)^(1/length(x)))

# harmonic mena
# harm.mean = (1/x1 + 1/x2 + ... + 1/xn)^-1

# Find the harmoninc mean of x using a for loop and using vector operations.
# For loop
my_sum <- 0
for(i in 1:length(x)) {
	my_sum <- my_sum+1/(x[i])
}
print(harm.mean<-my_sum^-1)

# vector operation
print(harm.mean<-sum(1/x)^-1)

# write a loop that adds every third element in x
sum <- 0
for(i in 1:length(x)) {
	if(i%%3 == 0) {
		sum <- sum + x[i]
	}
}
print(sum)

## scan is for vector only.
## scan(file="fname",what=0, n=01, sep="", skip=0, quiet=F)
## data()
## dir()
## dir.name
## list.files(path="dir.name")
