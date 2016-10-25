###par(mfrow=c(2,2))
###curve(x*sin(x), from=0, to=100, n=1001)
###curve(x*sin(x), from=0, to=10, n=1001)
###curve(x*sin(x), from=0, to=1, n=1001)
###curve(x*sin(x), from=0, to=.1, n=1001)

# reset par
###par(mfrow=c(1,1))

## Functions
# functions are like subroutines.
# R is unusual among programming languages in that functions are objects
# that can be manipulated like vectors, matrices.
## Form of a function
# name<- function(argumentlist) {
#          expressions
#          return(value)
#        }
## Function tidbits
# {} are optional if only one expression.
# All functions in R produce a single output.
# Names are optional
# When R executes a function it produces an object with 3 parts.
# header - describe the inputs(arguments)
# body - expressions that specify what computations are carried out.
#	 the function.
# environment - in which the function was defined. 
# The function is not evaluated until you call the function
## To call the function:
# name(X1, X2, ...) where X1, X2, ... are the inputs that correspond with argument list
# When you call the function the output of the function is returned
# evaluated at X1, X2, ...
#
# If a function has more than one return statement it stops after the first one it reaches
#
# If there is no return statement, then the function returns the value of the last expression within the braces(unless it is assigned to a variable)
#
# If you call a function but don't assign to a variable name then the value will be printed to the console.

###### Example 1
### write a function to find the median of a set of data
med<-function(x) {
	odd.even<-length(x)%%2
	if(odd.even == 0) {
		(sort(x)[length(x)/2] + sort(x)[length(x)/2+1])/2
	} else {
		sort(x)[ceiling(length(x)/2)]
	}
}

y<-c(5,3,5,4,3)
med(y)
median(y)
med(y[-1])


###### Example 2
sumdice<-function(n) {
	k<-sample(1:6, size=n, replace=T)
	return(sum(k))
}

## From the book, quadratic function in order to find the zeroes of a quadratic equation using a function.
