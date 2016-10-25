## Eliminating duplicate rows
var1<-c(1,1,3,4,3,6,1)
var2<-c(2,2,2,4,2,1,2)
var3<-c(3,2,1,2,1,2,3)
var4<-c(1,1,1,1,1,5,2)

dups<-data.frame(var1,var2,var3,var4)
print(dups)

## Row 3 and and row 5 are the same. You can get rid of duplicates use unique()
udups<-unique(dups)
print(udups)

## To view duplicates using duplicated() function
justdups<-dups[duplicated(dups),]
print(justdups)

## Adding margins to a data frame.
## Show departures of seasonal means from overall means.
## and departures of people means from overall means.

# Sales people and sales data for each season
name<-c("Jane.Smith", "RObert.Jones", "Dick.Rogers", "William.Edwards", "Janet.Jones")
spring<-c(14,17,12,15,11)
summer<-c(18,18,16,14,17)
autumn<-c(11,10,9,11,11)
winter<-c(12,13,14,10,16)

# Data frame of people and their sales data.
frame<-data.frame(name,spring,summer,autumn,winter)
print(frame)

# Calculautr the means of the sales people.
people<-rowMeans(frame[,2:5])
print(people)
# Calculate the adjusted mean of the sales people
people<-people-mean(people)
print(people)

# Combine the original dataframe with the adjusted means of the sales people
new.frame<-cbind(frame, people)
print(new.frame)

# Look at the means of the seasons to investigate seasonal effects.
seasons<-colMeans(frame[,2:5])
print(seasons)

# Create a new row and bind it to our original dataframe to show seasonal effects
new.row<-new.frame[1,]
new.row[1]<-"Seasonal.Effects"
print(new.row)
new.row[2:5]<-seasons

new.row[6]<-0
new.frame<-rbind(new.frame,new.row)
print(new.frame)

## Now lets replace the counts of sales in the data frame new.frame[1:5, 2:5]
## by deparatures from the overall mean.
## We can use the sweep() functions that sweeps out array summaries

# Obtain the grand mean
gm<-mean(unlist(new.frame[1:5, 2:5]))
## here unlist will stop R from estimating a separate mean for each column
# create a vector of length 4 (4 seasons) to sweep out the grand mean
gm<-rep(gm,4)
new.frame[1:5,2:5]<-sweep(new.frame[1:5,2:5],2,gm)
## here 2 means sweep out gm by column
print(new.frame)

## tapply - applies a function to produce a table from the values in a vector.
# from vectors, matrices, arrays, or dataframes.
# with()
# table()	
# sapply
# attach()
# by()


## Lists - an indexed set of objects
# unlike a vector the objects can be of different types
# can contain a scalar, a vector, a dataframe, or a list
# used to store function output
# a data frame is a type of list
# a list is created using list() command
# a single brackets select a sublist
# double brackets extract a single element
# when display a list R uses double square brackets [[ ]]
# indicate list elements and single square brackets to indicate
# vector elements
# can name the elements when the list is created using name1=x1, etc.
### to reference the names put within quotes or use with a $

## can also add names using the names() function## names(my.list) <- c(
