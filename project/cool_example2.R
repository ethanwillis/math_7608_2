library(rgl)
library(GA)

polynomial <- function(x1, x2) {
	x2^2 - 2*cos(x1) + x1^3 + 13
}

x1 <- x2 <- seq(-10, 10, by= 0.1)
f<-outer(x1, x2, polynomial)

GA <- ga(type="real-valued",
	 fitness = function(x) polynomial(x[1], x[2]),
	 min = c(-10, -10), max = c(10, 10),
	 popSize = 50, maxiter = 1000, run = 100)

plot(GA)
print(summary(GA))
plot(x=x1, y=x2, type="l", f, xlim=c(-10, 10), ylim=c(-10, 10))
