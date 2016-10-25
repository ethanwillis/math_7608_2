# Ethan Willis Homework 3

# 1) A function to estimate the value of Pi

# Helper function to determine if point (x, y) lies within a circle.
# I use the standard equation for a circle: (x-h)^2 + (y-k)^2 = r^2
# and plug in x and y and compare to the r^2 value.
point_in_circle<-function(x, y, h, k, r) {
	is_in_circle<-FALSE
	
	r_squared<-r^2
	
	# calculate left hand side of standard equation for circle
	lhs<-((x-h)^2) + ((y-k)^2)
	
	# compare to r^2 value
	if(lhs < r_squared) {
		is_in_circle<-TRUE
	}

	return(is_in_circle)
}

# Generate N random points and determine how many fall within the circle. 
estimate_pi<- function() {
	h<-1/2
	k<-1/2
	r<-1/2
	N<-100000
	num_in_circle<-0
	for(i in 1:N) {
		x<-runif(1, 0, 1)
		y<-runif(1, 0, 1)
		if(point_in_circle( x, y, h, k, r)) {
			num_in_circle<-num_in_circle+1
		}
	}
	print("Pi Approx")
	print(4*(num_in_circle/N))
}
estimate_pi()

# 2) A function to calculate the mean life span given a constant survival rate S. using the formula
# MLS = -(1/log(S))
mls<-function(S) {
	mean_life_span = -(1/log(S))
	return(mean_life_span)
}

mls_range<-function(start, stop, step) {
	# empty result dataframe
	mls_2_column<-data.frame(survival_rate=numeric(0), mean_life_span=numeric(0))

	# Build list of survival rates
	survival_rates<-seq(start, stop, by=step)

	# Calculate mls for each survival rate
	mean_life_spans<-lapply(survival_rates, mls)

	mls_2_column<-cbind(survival_rates, mean_life_spans)

	return(mls_2_column)
}
print("2 Column output for Problem #2.")
mls_range_result<-mls_range(.2, .95, .05)
print(mls_range_result)
plot(mls_range_result, main="Mean Life Span vs. Survival Rate", xlab="Survival Rate", ylab="Mean Life Span")

# 3) Bisection Algorithm
bisection_algorithm<-function(func, x1, x2, epsilon) {
	result_found<-FALSE
	result<-0

	while(!result_found) {
		midpoint<-(x1 + x2)/2
		midpoint_eval<-func(midpoint)
		
		# Base case
		if(midpoint_eval == 0 || ((x2-x1)/2 < epsilon)) {
			result_found<-TRUE
			result<-midpoint
		} else {
			# Determine our new window.
			if((func(x1) >= 0 && midpoint_eval >= 0) || (func(x1) < 0 && midpoint_eval < 0)) {
				x1<-midpoint
			} else {
				x2<-midpoint
			}
		}
	}
	return(result)
} 

find_root<-function() {
	f<-function(x) {
		return(x^3+(2*(x^2))-7)
	}
	bisection_result = bisection_algorithm(f, 0, 30, .0000001);
	print("The root of f(x)=x^3+2x^2-7 is the following(with .0000001 precision)")
	print(bisection_result)
}
find_root()
