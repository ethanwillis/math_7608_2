## curve draws mathematical functions
## general form: curve(func, from, to)

## can do the same thing using plot
x<-seq(2,2,0.01)
y<-x^3-2*x
plot(x,y,type="l")

### Adding other shapes to a plot

## two unlabelled axes without tick marks both scaled 0 to 10 but without
## points on the axes
plot(0:10,0:10, xlab="",ylab="",xaxt="n",yaxt="n",type="n")

## rect plots rectangles
## arrows plot arrows and bars
## polygon plots more complicated straight sided shapes

## To add a solid square in the top right-hand corner
## general form: rect(xleft,ybottom,xright,ytop)
rect(6,6,9,9) # box goes from 0:10 and 0:10

## to draw an arrow from (x0,y0) to (x1,y1) with default arrowhead
## at (x1,y1)
## general form: arrows(x0,y0,x1,y1)
arrows(1,1,3,8)
# a double headed arrow from (1,9) to (5,9) add code=3
arrows(1,9,5,9,code=3)
# a vertical bar with 2 square ends
arrows(4,1,4,6,code=3,angle=90)

## Draw a polygon
x<-c(1.19,3.09,5.56,6.02,4.85,1.51)
y<-c(8.11,9.54,8.06,4.38,4.24,2.54)
polygon(x,y,col="lavender")

## Shade an area corresponding to a p-value
xv<-seq(-3,3,.01)
yv<-dnorm(xv)
plot(xv,yv,type="l")

# Fill in the area to the left of x<=-1
polygon(c(xv[xv<=-1],-1),c(yv[xv<=-1],yv[xv==-3]),col="red")

## Smotth curve using plot in R you need about 100 segments between the minimum and maximum values.

## Suppose we want to plot Ya=482*x*exp(-.45x) and Yb=518*x*exp(-.055x)
## min x=0 max x=100
## we need to generate about 100 values of x between 0 and 100
x<-0:100
ya<-482*x*exp(-.045*x)
yb<-518*x*exp(-.055*x)

## we can let R choose the range for ya and yb
## or we can set the range for ya and yb by finding min's and max's 
## and using ylim= 
## or we user type="n" then use lines to add the smooth functions.
plot(c(x,x),c(ya,yb),type="l")
plot(c(x,x),c(ya,yb),xlab="stock",ylab="recruits",type="n")
lines(x,ya,lty=1,col="blue")
lines(x,yb,lty=2,col="navy")

# requires loading data from files. for speed,dist
data<-data(cars)
par(mfrow=c(2,2))
plot(speed, dist, pch=16)
text(20,10,"lowess",pos=2)
lines(lowess(speed,dist)) ## lowess -- a non-parametric curve fitter

# This builds a model
plot(speed,dist,pch=16)
text(20,10,"loess",pos=2)
model<-loess(dist~speed) # functional form, not cartesian like lowess.
x<-0:25
y<-predict(model,data.frame(speed=x))
lines(x,y) ### loess a modeling tool.

plot(speed,dist,pch=16)
text(20,10,"gam",pos=2)
library(mgcv)
model<-gam(dist~s(speed)) ## fits a generalized additive model
y<-predict(model,list(speed=x))
lines(x,y)

plot(speed,dist,pch=16)
text(20,10,"polynomial",pos=2)
model<-lm(dist~speed+I(speed^2)+I(speed^3))
y<-predict(model,list(speed=x))
lines(x,y)

## Plotting with a categorical explanatory variable
## categorical variables are factors
### Box and Whiskers plot
## minimum
## first quantile
## median
## third quantile
## maximum

### outliers
detach(data)
attach(PlantGrowth)
plot(group,weight)

## barplot
means<-tapply(weight, group, mean)
barplot(means)

## plots for single samples -- when we just have on variable
# histogram
# index plots (shows variable in sequence)
# time series plots
# pie charts

# histograms
hist(rpois(1000,1.7),breaks=seq(-.5,9.5,1)) # generate 1000 points from Poisson with mean=1.7

y<-rbinom(158,size=1,prob=.5)
bks<--0.5:(max(y)+.5)
hist(y,bks)

y<-rbinom(158,size=5,prob=.5)
bks<--0.5:(max(y)+.5)
hist(y,bks)
