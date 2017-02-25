# Load lattice library, lots of functions for graphing
library("lattice")

# Load Iris data.
data(iris)

splom(iris[101:150,1:4])

## to do all three species at once in color
splom(iris[,1:4],groups=iris$Species)
splom(iris[,1:4],groups=iris$Species, col=1, pch=c(1,2,3), cex=c(.5,.5,.5))


## Density plot examples
data(Loblolly)
densityplot(height~age|Seed,data=Loblolly)
densityplot(Sepal.Length~Sepal.Width|Species,data=iris)


# Conditional Distribution
bwplot(height~age|Seed,data=Loblolly)

# Conditional Histogram
histogram(height~age|Seed,data=Loblolly)

# scatterplot
xyplot(height~age|Seed,data=Loblolly)


## Another conditional plot
# coplot(response~explanatory|conditional variables, panel=panel.smooth)
attach(iris)
coplot(Sepal.Length~Sepal.Width|Petal.Length,panel=panel.smooth)

## Interaction plots
# interaction.plot(factor,factor,response)
interaction.plot(CO2$Type,CO2$Type,CO2$Treatment,CO2$uptake)

## Surface plot
## Plot bivariate normal density
f<-function(x,y) {
	z<-1/(2*pi)*exp(-.5*(x^2+y^2))
}

y<-x<-seq(-3,3,length=50)
z<-outer(x,y,f)
persp(x,y,z)

# Turn 45 degrees
persp(x,y,z,theta=45,phi=30,expand=0.6,ltheta=120,shade=.75,ticktype="detailed",xlab="x",ylab="y",zlab="f(x,y)",col="light blue")

# Save perspective drawing into matrix
M<-persp(x,y,z,theta=45,phi=30,expand=.4,box=FALSE)

## Add some points along a circle
a<-seq(-pi,pi,pi/16)
newpts<-cbind(cos(a),sin(a))*2
newpts<-cbind(newpts,0,1)
N<newpts%*%M
points(N[,1]/N[,4],N[,2]/N[,4],col=2)

## Add lines
x2<-seq(-3,3,.1)
y2<- -x2^2/3
z2<- dnorm(x2)*dnorm(y2)
N<- cbind(x2,y2,z2,1)%*%M
lines(N[,1]/N[,4],N[,2]/N[,4],col=4)

## Add text
x3<-c(0,3,1)
y3<-c(0,-3,1)
z3<-dnorm(x3)*dnorm(y3*1.1
N<-cbind(x2,y3,z3)%*%M
text(N[1,1]/N[1,4],N[1,2]/N[1,4],"f(x,y)")


## Surface plots can also be drawn using the wireframe in lattice package. 
x<-y<-seq(-3,3,length=50)
xy<-expand.grid(x,y)
z<-1/(2*pi)*exp(-.5*(xy[,1]^2+xy[,2]^2))

## 3d scatterplot
print(cloud(Petal.Length~Sepal.Length*Sepal.Width,data=iris,groups=Species, pch=1:3,scales=list(draw=FALSE),screem=list(z=30,x=-75,y=0)))

## Contour plots
# represent a 3d surface in the plane by projecting the level curves f(x,y)=c
data(volcano)
image(volcano,col=terrain.colors(100),axes=FALSE)
contour(volcano,asp=1,labcex=1)
contour(volcano,levels=seq(100, 200,by=10),add=TRUE)

## producing more permanent graphics
## to create a pdf file
data(Loblolly)
pdf(file="graphic.pdf",width=4,height=3)
plot(Loblolly$age, Loblolly4height)
dev.off()

