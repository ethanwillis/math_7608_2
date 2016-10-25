# Ethan Willis Math 7608 Fall 2016 Test 1 -- Part 2
# Problem 1
# Plot in a 2x2 grid
par(mfrow=c(2,2))
# 1-(a) graph sin(x) over the region 0 to 2pi
# Vertical lines at x = pi/2, x=3pi/2
# Label the y-axis and include a main title.
x<-seq(0, 2*pi, 0.01)
y<-sin(x)
plot(x, y, main="sin(x) plot", ylab="sin(x)", type='l')
abline(v=pi/2, col="red")
abline(v=(3*pi)/2, col="red")

# 1-(b) graph cos(x) over the region 0 to 2pi
# Vertical line at x = pi
# Label the y-axis and include a main title.
y<-cos(x)
plot(x, y, main="cos(x) plot", ylab="cos(x)", type='l') 
abline(v=pi, col="blue")

# 1-(c) graph tan(x) over the region 0 to 2pi
# Restrict the range of the y-axis from -3 to 3
# Label the y-axis and include a main title.
y<-tan(x)
plot(x, y, ylim=c(-3, 3), main="tan(x) plot", ylab="tan(x)", type='l')

# Problem 2
# 2-(a) construct two vectors of height = (172, 168, 167, 175, 180)
# weight = (62, 64, 52, 71, 69)
heights<-c(172, 168, 167, 175, 180)
weights<-c(62, 64, 51, 71, 69)
# Find the correlation between height and weight. 
covariance_height_weight<-cov(heights,weights)
correlation_height_weight<-covariance_height_weight/(sqrt(var(heights) * var(weights)))
# output (a) answer
print("2a Correlation between height and weight is: ")
print(correlation_height_weight)
# 2-(b) Bind the vectors into a matrix with the given labels of height, weight, and the names of the participants.
# Create the column and row names.
row_names<-c("Neil", "Cindy", "Pardeep", "Deepak", "Hao")
col_names<-c("height", "weight")
dimnames=list(row_names, col_names)
# Create and output matrix
height_weight_mat<-matrix(c(heights, weights), nrow=5, ncol=2, byrow=FALSE,dimnames=list(row_names, col_names))
print("2b Matrix: ")
print(height_weight_mat)
# 2-(c) Replace the biggest and smallest heights with the average height
# Calculate average height.
average_height<-sum(heights)/length(heights)
# Find index of smallest height
smallest_height_index <- 1
smallest_height <- heights[smallest_height_index]
for(i in 1:length(heights)) {
 if(smallest_height > heights[i]) {
  smallest_height <- heights[i]
  smallest_height_index <- i
 }
}
smallest_height_index
# Find index of largest height
largest_height_index = 1
largest_height = heights[largest_height_index]
for(i in 1:length(heights)) {
 if(largest_height < heights[i]) {
  largest_height <- heights[i]
  largest_height_index <- i
 }
}
largest_height_index
# Replace the smallest + largest height with the average height
#average_heights <- c(heights(1:smallest_height_index), average_height, heights(smallest_height_index, length(heights))
heights[smallest_height_index]<-average_height
# Replace the largest height with the average height
heights[largest_height_index]<-average_height
# Recreate the matrix with the average heights and output it.
# Create and output matrix
average_height_weight_mat<-matrix(c(heights, weights), nrow=5, ncol=2, byrow=FALSE,dimnames=list(row_names, col_names))
print("2c Matrix with replaced heights: ")
print(average_height_weight_mat)

# 2-(d) Replace each weight with the weight minus the average weight
average_weight<-sum(weights)/length(weights)
for(i in 1:length(weights)) {
 weights[i]<-weights[i]-average_weight
}
average_height_weight_modified_mat<-matrix(c(heights, weights), nrow=5, ncol=2, byrow=FALSE,dimnames=list(row_names, col_names))
print("2d Matrix with modified weights: ")
print(average_height_weight_modified_mat)

# 2-(e) Draw a scatterplot of height versus weight with proper labels and main title
plot(heights, weights, main="Modified Height vs (Weight - Avg Weight)", ylab="weight - average weight", xlab="heights")

