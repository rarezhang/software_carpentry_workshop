# ggplot learning script 
# Wenli Zhang, wenlizhang@email.arizona.edu
"
install.packages("ggplot2",dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")
"

library(ggplot2)
library(plyr)
library(ggthemes)
library(reshape2)

## ggplot 
# data: must be a data.frame
# gets pulled into the ggplot() object

# mapping: which data on the x, which data on the y, also color, size
# specify the data an variables inside the ggplot function
# anything else that goes in here becomes a global setting 
# then add layers: geometric objects
myplot <- ggplot(data = iris, aes(x =Sepal.Length, y= Sepal.Width))
myplot + geom_point()
# set the size
myplot + geom_point(size = 5)

# set color: mappint to species
myplot <- ggplot(data = iris, aes(x =Sepal.Length, y= Sepal.Width, color = Species))
myplot + geom_point(size = 3)

# set shape: mappint to species
myplot <- ggplot(data = iris, aes(x =Sepal.Length, y= Sepal.Width, color = Species))
myplot + geom_point(aes(shape = Species),size = 3)


## ramdom sample from a big data set
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
dimondsplot <- ggplot(data = d2, aes(x = carat, y = price, color = color))
dimondsplot + geom_point(size =5)


## stats
# binning for a histogram or fitting a linear model
# Boxplots
library(MASS)
# x = factor(racy), y = bwt
ggplot(birthwt,aes(factor(race),bwt)) + geom_boxplot()


## facets
# single column, multiple rows
ggplot(iris,aes(Sepal.Length,Sepal.Width,color = Species)) +
  geom_point() +
  facet_grid(.~ Species) # or facet_wrap(~ Species)  ##wrap blocks

## Scales
# color bar
"install.packages("RColorBrewer")"
library("RColorBrewer")
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Set1")

df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")


