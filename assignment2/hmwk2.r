# Ethan Willis - MATH 7608 - Homework 2

# Problem 2
#
# Use a while loop to determine the solution in [0,1] of x = cos(x) iteratively.

#
#iterative_solver:  This function iterates over a function on the interval [start, stop] at the specified tolerance until x = func(x)
#
iterative_solver<-function(start, stop, tolerance, func) {
	# Variables for storing result output message, the variable x where x = func(x),
	# And whether or not a solution has been found
	result<-""
	x = start
	solution_found <- FALSE

	# Iterate while we haven't found a solution to x = func(x) within tolerance
	# Or until we're outside of the domain [start, stop]
	while( solution_found != TRUE && x <= stop) {
		if( func(x) - x < tolerance ) {
			solution_found = TRUE
		} else {
			x = x + tolerance
		}
	}

	# Calculate the number of iterations, 0 inclusive. 
	num_iterations = floor((x - start)/tolerance) + 1

	# If a solution was found, output the solution.
	if(solution_found) {
		result = paste("Solution found at x =",
				x,
				" func(",
				x,
				") = ",
				func(x),
				" In ",
				num_iterations,
				" iteratons with tolerance =, ",
				tolerance,
				" on the interval [",
				start,
				", ",
				stop,
				"]."
			      )
	} else {
		result<-("No Result Found.")
	}

	print(result)
}

# 2 Find the solution to x = cos(x) in [0, 1]
iterative_solver(0, 1, .001, cos)

# 2 (A) use a starting value of 0.5 and tolerance 0.001. Find the number of iterations required.
iterative_solver(0.5, 1, .001, cos)

# 2 (B) use a starting value of 0.7 and a tolerance of 0.001. Compare the number of iterations required with the previous case, 2A 
iterative_solver(0.7, 1, .001, cos)

print("With a starting point of 0.5 and tolerance .001 in 2(A) versus a starting point of 0.7 and a tolerance of .001 in 2(B) the same loop took 200 less iterations to find a solution to x = cos(x) on [0; 1]")

# 3 Construct a list of all twin primes below 1000

# Sieving function that sieves out all primes from 2 to max
prime_sieve<-function(max) {
	# Create our number list.
	num_list<-c(2:max)
	
	# Create a logical vector for marking numbers as primes or not primes.
	prime_list<-as.logical(rep(TRUE, length(num_list)))
	
	# variable to store the current factor
	factor<-0

	# Create start and stop points for loop
	start_i = 1
	stop_i = length(num_list)

	# Go through 2:max and sieve out all prime numbers through elimination.
	for(i in start_i:stop_i) {
		# Set our current factor
		factor<-num_list[i]
	
		# Create start and stop points for loop
		start_j = i + 1
		stop_j = length(num_list)
			
		if(stop_j > start_j) {
			# Search for non primes in the rest of the list using this factor
			for(j in start_j:stop_j) {
	
				# if num_list[j] is factored then mark it as not a prime
				mod <- num_list[j] %% factor
				if(mod == 0) {
					prime_list[j]<-FALSE
				}
			}
		}
	}

	# print primes
	
}
prime_sieve(1000)
