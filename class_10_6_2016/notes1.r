# Ethan Willis. October 16, 2016

### || vs | for or
### && vs & for and
###
### || and && are not vectorized. 
### || and && are guaranteed to be evalued from left to right.
### A && B if A is false B will not be evaluated since A&&B is false.
### A & B both A and B *may* be evaluated. 

data<-read.table("book1.csv", header=TRUE, sep=",")
print(data)
x<-data$Response
y<-data[[1]]
print(x)
print(y)

## Reference the columns of a data frame
## dataframe$columnname
## dataframe[[column number]]
## dataframe[["column name"]]

## Attaching data attach data and address subelements directly
attach(data)
print(Response)

## You can also create a data frame from vectors using data.frame()
colors<-c("red", "yellow", "blue")
numbers<-c(1,2,3)
colors.and.numbers<-data.frame(colors, numbers, more.numbers=c(4, 5, 6))

print(colors.and.numbers)

## Using head and tail in order to examine portions of a large dataframe.
print(head(colors.and.numbers))
print(tail(colors.and.numbers))

## You can generate a statistical summary of a data frame.
print(summary(colors.and.numbers))

## by staement allows you to compute functions on portions of your dataframe based on a factor variable
print(by(data[,1],Treatment,mean))

## subscripts in square brackets refer to the elements in the dataframe data[a,b] is row a and column b
print(data[1,2])

## You can get a range of values using sequences. 
## All the 2nd column for rows 4-5
## data[4:5,2]
print(data[4:5,2])

print(data[3,])
print(data[,1])

## Check the type of all the values. 
print(class(data[1,]))
print(class(data[,1]))

#### Sorting -- usually we want to sort by rows. 
# order() orders a dataframe by a subelement. By default it orders in ascending order.
print(data[order(Response),])
print(data)

# Order in reverse.
print(data[rev(order(Response)),])

# Sort by more than one column.
print(data[order(Treatment,Response),])

### You can select rows with certain properties using logical conditions
## to select all rows in data that have Treatment level control
print(data[Treatment=="control",])

## You can use sapply with data frames to apply a function to all columns in the data frame
print(data[,sapply(data,is.character)])
print(data[,sapply(data,is.factor)])

### To drop rows from a data frame use a negative subscript.
print(data[-(2:4),])

### Write an expression that keeps all the rows that are not preheated.
print(data[Treatment!="preheated",])

## na.omit and na.exclude
## If youre doing a linear model na.omit will allow the model to predict a value for na values.
## na.exclude however will not allow those values to be imputed.

## Create a dataframe called new
## x has random uniform variables runif
## y has letters abcdefgh letters[]
## z random integers between 1 and 5, sample()
x<-runif(8, 0, 1)
y<-letters[1:8]
z<-sample(5, 8, TRUE)
new<-data.frame(x, y, z)
print(new)


## now supposeyou want to add a variable tha tis random T or F
w<-sample(c(rep(T,4), rep(F,4)))
print(w)
new<-data.frame(new, w)
print(new)

## Generate from random poisson distribution
y<-rpois(1500,1.5)
table(y)

print(is.matrix(table(y)))
print(is.data.frame(table(y)))
print(as.data.frame(table(y)))

## to expand the data frame to have a separate row for every poisson variable
## lapply

short.frame<-as.data.frame(table(y))
long<-as.data.frame(lapply(short.frame,function(x) rep(x.short.frame$Freq)))
head(long)
tail(long)
