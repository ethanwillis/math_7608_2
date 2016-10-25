## Ethan Willis MATH 7608 Quiz1

## Part A
# This function simulates rolling two dice and returns the sum.
roll_two_dice<-function() {
	die1<-sample(1:6, 1)
	die2<-sample(1:6, 1)
	dice_sum<-die1+die2
	return(dice_sum)
}

## Part B
# this function determines if a roll is a win or a loss using the roll_two_dice() function
# note: will return "neither" if the dice sum isn't 7, 11, 2, or 12.
win_or_loss<-function() {
	# Default return value
	roll_result <- "neither"

	# Roll two dice and then check if the sum is a win or loss.
	dice_sum <- roll_two_dice();
	if(dice_sum == 7 || dice_sum == 11) {
		roll_result <- "win"
	} else if(dice_sum == 2 || dice_sum == 12) {
		roll_result <- "loss"
	}

	# Return result
	return(roll_result)
}

## Part C
# This function simulates rolling two dice "num_simulation_runs" times while keeping a sum of the wins and losses.
win_loss_simulation<-function(num_simulation_runs) {
	wins <- 0
	losses <- 0

	# run our simulation N times.
	for(i in 1:num_simulation_runs) {
		roll_result <- win_or_loss()
		if(roll_result == "win") {
			wins <- wins + 1
		} else if(roll_result == "loss") {
			losses <- losses + 1
		}
	}

	# Combine the results into an informative matrix
	result_matrix <- cbind(wins, losses)
	
	return(result_matrix)
}
## Part D
# Use Part C, win_loss_simulation(N), to estimate the probability of winning and losing.
estimate_probabilities<-function(num_simulation_runs) {
	# Run our simulations and get back the number of wins and losses.
	simulation_results <- win_loss_simulation(num_simulation_runs)

	# Calculate probability of winning and losing. 
	prob_win <- simulation_results[1,1] / num_simulation_runs
	prob_loss <- simulation_results[1,2] / num_simulation_runs

	result_matrix <- c(prob_win, prob_loss)

	return(result_matrix)
}

# Test Part  with 100,000 simulations
print("Test of parts A-D with N=100,000")
print( estimate_probabilities(100000))

## Part E
# This function simulates rolling two dice N times, stores the value of each die, the sum of each dice roll, and whether the roll was a win, loss, or neither. This information is stored in a dataframe and returned.
dataframe_prob_estimation<-function(num_simulation_runs) {
	# Initialize an empty dataframe to hold our result set.
	simulation_dataframe<-data.frame(die1=numeric(0), die2=numeric(0), die_sum=numeric(0), roll_result=character(0))
	# run N simulations.
	for(i in 1:num_simulation_runs) {
		# Sample two fair dice, store the results, their sum, and whether Win, Loss, Neither
		die1<-sample(1:6, 1)
		die2<-sample(1:6, 1)
		die_sum<-die1+die2
		roll_result<-"neither"
		if(die_sum == 7 || die_sum == 11) {
			roll_result<-"win"
		} else if(die_sum == 2 || die_sum == 12) {
			roll_result<-"loss"
		}

		# Create and append a row to our result set dataframe.
		dataframe_row <- data.frame(die1, die2, die_sum, roll_result)
		simulation_dataframe <- rbind(simulation_dataframe, dataframe_row)
	}
	
	# Return our result set.
	return(simulation_dataframe)
}

# Part E continued, use the result of the dataframe_prob_estimation(...) function to figure out the probabilities of winning, losing, or neither.
N = 10000
print("Test of part E with N=10000(might take a couple seconds)")


# Run simulations
simulation_dataframe<-dataframe_prob_estimation(N)

# Count wins, loss, neither from dataframe.
wins<-sum(simulation_dataframe$roll_result == "win")
neither<-sum(simulation_dataframe$roll_result == "neither")
losses<-sum(simulation_dataframe$roll_result == "loss")

# Calculate probabilities
prob_win<-wins/N
prob_loss<-losses/N
prob_neither<-neither/N

# Cbind results and output
print(cbind(prob_win, prob_loss, prob_neither))
