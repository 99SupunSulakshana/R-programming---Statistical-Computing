# The pacman package is an R package management tool that combines the functionality of base library related functions into intuitively named functions. This package is ideally added to .Rprofile to increase workflow by reducing time recalling obscurely named functions, reducing code and integrating functionality of base functions to simultaneously perform multiple actions.
install.packages("pacman")
require(pacman)
library(pacman)
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, plotly, rio, rmarkdown, shiny, stringr, tidyr)

# Plot Charts..................................
library(datasets)# load / unload base packages manually
head(iris)
?plot
plot(iris$Species)#categorical variables
plot(iris$Petal.Length)#Quantitative variable
plot(iris$Species, iris$Petal.Width) # Cat x quant
plot(iris$Petal.Length, iris$Petal.Width)# Quant pair
plot(iris)# Entire data frame

#plot with options
plot(iris$Petal.Length, iris$Sepal.Width,
  col = "#cc0000",
  pch = 19,
  main = "Iris: Petal Length vs. Petal Width",
  xlab = "Petal Length",
  ylab = "Petal Width")

# Plot formulas with plot()

plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

# Formula plot with options

plot(dnorm, -3, +3,
  col = "#cc0000",
  lwd = 5,#line width
  main = "Standard Normal Distribution",
  xlab =  "z-scores",
  ylab = "Density")

# Clean Up

# Clear packages
detach("package:datasets", unload = TRUE)

# Bar Charts............................
library(datasets)
?mtcars
head(mtcars)

barplot(mtcars$cyl)# Doest Not work

# Need a table with frequencies for each category
cylinders <- table(mtcars$cyl) # create table
barplot(cylinders) # Bar chart
plot(cylinders)# Default X-Y plot(lines)

# Clean Up

# Clear Environment
rm(list = ls())

# Histogram......................

library(datasets)
?iris

# Basic Histograms

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)


# Histogram by group

# Put graphs in 3 rows and 1 column
par(mfrow = c(3,1))

# Histograms for each species using options
hist(iris$Petal.Width[iris$Species == "setosa"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal width for setosa",
     xlab ="",
     col="red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Versicolor",
     xlab = "",
     col = "blue")

# Restore graphic parameter
par(mfrow=c(1, 1))

# Scatterplots - for visualizing the association between two quantitative variables.

library(datasets)
head(mtcars)

# Plots ---------------------------------------

# Good to first check univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)

#Basic X-Y plot for two quantitative variables
plot(mtcars$wt, mtcars$mpg)

# Add some options
plot(mtcars$wt, mtcars$mpg,
     pch = 19, #solid circle
     cex = 1.5, # Make 150% size
     col = "#cc0000", # Red
     main = "MPG as a function of weight of cars",
     xlab = "Weight (in 1000 pounds)",
     ylab = "MPG")

# Clean up

# Clear packages
detach("package:datasets", unload = TRUE) # for base


#Overlapping plots...........................................

# Install and load packages

library(datasets)# load / unload base packages manually

# Load data

# Annual Canadian lynx trappings 1821-1934
?lynx
head(lynx)

#Histogram

#Default
hist(lynx)


#Add some option
hist(lynx,
     breaks = 14, #"Suggests" 14 bins
     freq = FALSE, # Axis shows density, not freq.
     col = "thistle1", # Color for histogram
     main = paste("Histogram of Annual Canadian Lynx",
                  "Trappings, 1821-1934"),
     xlab = "Number of Lynx Trapped")

#Add a normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col = "thistle4",     # Color of curve
      lwd = 2,      #Line width of 2 pixels
      add = TRUE)   #Superimpose on previous graph

# Add two kernel density estimators

lines(density(lynx), col = "blue", lwd =2)
lines(density(lynx, adjust=3), col = " purple", lwd = 2)

# Add a rug plot
rug(lynx, lwd =2, col = "gray")

# Clean Up

detach("package:datasets", unload = TRUE) # for base

# Summary() - counts for categories
# Quartiles and mean for qunatitative variables

# Install and load packages

library(datasets) #load/ unload base packages manually

# load data
head(iris)

# Summary

summary(iris$Species)        # categorical variable
summary(iris$Sepal.Length)   #Quantitative variable
summary(iris)                #Entire data frame

# Clean Up
detach("package:datasets", unload = TRUE) # for base

# describe() - n, mean, SD, Median, 10% trimmed mean, MAD, min/max, range, skewness, kurtosis, & SE.
# This still comes after graphical summaries.

# Install and load packages

# Packages I load vary time; uses "pacman
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate, plotly,
               rio, rmarkdown, shiny, stringr, tidyr)

library(datasets)

# Load data

head(iris)

# PSYCH Packages

# Load psych package ( download if needed)
p_load(psych)

# Get info on package
p_help(psych)  # Opens package PDF in browser
p_help(psych, web = F) # opens help in R Viewer

# Description()

# For quantitative variables only

describe(iris$Sepal.Length)  # One quantitative variable
describe(iris)    # Entire data frame

# Clean 
# Clear environment
rm(list = ls())

# Selecting cases
# Select by category or by value or both

# Install and load package
library(datasets)

# Load data

head(iris)

# All data
hist(iris$Petal.Length)
summary(iris$Petal.Length)

summary(iris$Species)  # Get names and n for each species

# Select by category

# Versicolor

hist(iris$Petal.Length[iris$Species =="versicolor"],
     main = "Petal Length: Versicolor")

# Virginica
hist(iris$Petal.Length[iris$Species =="virginica"],
     main = "Petal Length: Virginica")

# Setosa
hist(iris$Petal.Length[iris$Species == "setosa"],
     main = "Petal Length: Setosa")

# Select By Value

# Short petals only (all Setosa)
hist(iris$Petal.Length[iris$Petal.Length <2],
     main = "Petal Length <2 ")

# Multiple selectors

# Short Virginica petals only
hist(iris$Petal.Length[iris$Species == "virginica" &
                         iris$Petal.Length < 5.5],
     main = "Petal Length: Short Virginica")

# Create Subsample
# Format : data[rows, columns]
# Leave rows or columns blank to select all
i.setosa <- iris[iris$Species == "setosa",]
head(iris)

# Explore subsample

head(i.setosa)
summary(i.setosa$Petal.Length)
hist(i.setosa$Petal.Length)

# Clean Up
# Clean environment
rm(list = ls())

# Arithmetic operations
# +, -,*,/,^

# Add
6+5
#Sub
6-2
#Multiplication
6*2
#Division
6/2
#Power
6^2

# Examples of arithmetic operations
2*3/2
2*8/4^2
(2+3)+7

# Some functions

# log handling in maths
#natural log
log(10)
# e^1
exp(1)
# e^2
exp(2)
log(exp(1))
log(exp(2))
log10(2)
log10(10000)
log(100,base = 10)

# find square number
sqrt(16)


pi

# Sin values find
sin(pi/2)

# Cos values check
cos(pi/3)

# Tan value check
tan(pi/4)

# Data Formats
# numeric(integer, single & double), character, logical, complex, & raw.

# Data structures
# *Vector *Matrix/array *Data frame *List

# Vector
# -1+ numbers in a 1d array
# - All same data type
# -R's basic data object 

# Matrix
# -Two dimensions
# -Same length
# -Same data class
# -Columns not named.

# Array
# -Identical to a matrix but 3+ dimensions.


# Data frames
# -Can have vector of multiple types
# -All same length
# -Closest R analogue to spreadsheet
# -Special functions

# List 
# -Most flexible
# -Ordered collection of elements
# -Any class, length, or structure
# -Can include lists

# Coercion - That is, changing a data object from one type to another. 
# - character to logical
# - matrix to data frame
# - double to integer

# Data types

# Numeric

n1 <- 15 # Double precision by default
n1
typeof(n1)

n2 <- 1.5
n2
typeof(n2)

# Character

c1 <- "c"
c1
typeof(c1)

c2 <- " a string of text"
c2
typeof(c2)

# Logical

l1 <- TRUE
l1
typeof(l1)

l2 <- F
l2
typeof(l2)


# Data structures

v1 <- c(1,2,3,4,5)
v1
is.vector(v1)
typeof(v1)

v2 <- c("a","b","c","d")
v2
is.vector(v2)
typeof(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE)
v3
is.vector(v3)
typeof(v3)

# Matrix

m1 <- matrix(c(T,T,F,F,T,F), nrow = 2)
m1

m2 <- matrix(c("a","b",
               "c","d"),
             nrow = 2,
             byrow = T)
m2

# Array

# Give data, then dimensions( rows, columns, tables)
a1 <- array(c(1:24), c(4,3,2))
a1

# Data Frame

# Can combine vectors of the same length

vNumeric <- c(1,2,3)
vCharacter <- c("a","b","c")
vLogical <-c(T,F,T)

dfa <- cbind(vNumeric, vCharacter, vLogical) 
dfa # Matrix of one data type


df <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df # Makes a data frame with three different data types

# List

o1 <- c(1,2,3)
o2 <- c("a","b","c","d")
o3 <- c(T,F,F,T)

list1 <- list(o1,o2,o3)
list1

list2 <- list(o1, o2, o3, list1)# Lists within lists
list2

# Coercing types

# Automatic coercion

(coerce1 <- c(1, "b", TRUE))
typeof(coerce1)

# Coerce numeric to integer

(coerce2 <-5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

# Coerce character to numeric

(coerce4 <- c("1","2","3"))
typeof(coerce4)

(coerce5 <- as.numeric(c("1","2","3")))
typeof(coerce5)

# Coerce matrix to data frame

(coerce6 <- matrix(1:9, nrow = 3))
is.matrix(coerce6)

(coerce7 <- as.data.frame(matrix(1:9, nrow = 3)))
is.data.frame(coerce7)


# Clean Up
# Clean environment
rm(list = ls())


# Factors
# An "attribute" of a vector that specifies the possible values and their order.

# Create data

(x1 <- 1:3)
(y <-1:9)

# combine variables
(df1 <- cbind.data.frame(x1,y))
typeof(df1$x1)
str(df1)

# AS.FACTOR

(x2 <- as.factor(c(1:3)))
(df2 <- cbind.data.frame(x2, y))
typeof(df2$x2)
str(df2)

#Define existing variable as factor

x3 <- c(1:3)
df3 <- cbind.data.frame(x3, y)
(df3$x3 <- factor(df3$x3,
    levels = c(1,2,3)))
typeof(df3$x3)
str(df3)

# labels for factor

x4 <- c(1:3)
df4 <- cbind.data.frame(x4, y)
df4$x4 <- factor(df4$x4,
  levels = c(1,2,3),
  labels = c("macOS","Windows","Linux"))  
df4
typeof(df4$x4)
str(df4)


# Ordered factory and labels

x5 <- c(1:3)
df5 <- cbind.data.frame(x5, y)
df5
(df5$x5 <- ordered(df5$x5,
  levels = c(3,1,2),
  labels = c("No","Maybe","Yes")))
df5
typeof(df5$x5)
str(df5)

# Clean Up
#clean environment
rm(list = ls())


# Entering data
# Many methods: colon, seq,c, scan, & rep.

# <- That's the " assignment operators "

# Assignment operator
#b Use "<-" to assign values to a variable. This is read as "gets". It can go the
# other direction "->" and you can use an equals sign "=" but those are generally
# poor from in R.

# In RStudio, the shortcut option+- (option-dash) inserts
# the assignment operator and a space: "<-"

# Colon operator

# Assigns number 0 through 10 to x1
x1 <- 0:10
x1

# Descending order
x2 <- 10:0
x2


# seq

?seq   # R help on seq

# Ascending values ( duplicates 1:10)
(x3 <- seq(10))

# Specify change in values
(x4 <- seq(30,0, by = -3))


# Enter multiple values with concatenate ( or combine or collect)
?c # R help on c

x5 <- c(5,4,6,3,4,5,6,6,7,5,6,7,3)
x5


# scan
?scan # R help on scan

x6 <- scan() # After running this command, go to console
# hit return after each number
# Hit return twice to stop
x6

# REP

?rep # R help on rep
x7 <- rep(TRUE, 5)
x7

# Repeats set
x8 <- rep(c(TRUE, FALSE), 5)
x8


# Repeats items in set
x9 <- rep(c(TRUE, FALSE), each=5)
x9


# Importing data
# 1. csv.
# 2. txt.
# 3. xlsx.
# 4. json.

# R Has built-in functions for importing data in many formats
# rio combines all of R's import functions into one simple utility

# Install and load packages

# Packahes I load every time; uses "pacman"
install.packages("pacman")
require(pacman)
library(pacman)
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)

# About excel files

# from the official R documentation
browseURL("http://j.mp/2aFZUrJ")


# Importing with rio

# CSV

rio_csv <- import("~/D:/DataSet/data1.csv")
head(rio_csv)

# TXT
rio_txt <- import("~/Desktop/supun.xlsx")
head(rio_txt)

# Excel XLSX
rio_xlsx <- import("~/Descktop/supun.xlsx")
head(rio_xlsx)

# data viewer

?view
View(rio_csv)

# READ.TABLE for txt files

# R's built-in function for text files ( used by rio)

# TEXT FILES

# Load a spreadsheet that has been saved as tab- delimited
# Text file. Need to give complete address to file. This command gives an error on missing data but works
# on complete data

r_txt1 <- read.table("~/Desktop/supun.txt", header = TRUE)

# This works with missing data by specifying the separator:
# \t is for tabs, sep ="," for commas.R converts missing to"NA"
r_txt2 <- read.table("~/Desktop/supun.text",
                     header = TRUE,
                     sep = "\t")

# READ.CSV FOR CSV FILES

# Don't have to specify delimiters for missing data
# Because CSV means " comma separated values"

trends.csv <- read.csv("~/Desktop/supun.csv", header = TRUE)

# Clean Up
# Clear Environment
rm(list = ls())


# Hierarchical Clustering
# But similarity depends on your criteria.

# Install and load packages
# packages I load every time: uses " pacman "
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)

library(datasets)

# load data

?mtcars
head(mtcars)
cars <- mtcars[, c(1:4, 6:7, 9:11)] # select variables
head(cars)


# Computing and plot clusting

# Save hierarchical clustering to "hc." This codes uses pipes from dplyr
hc <- cars %>% # Get cars data
      dist %>%  # Computer distance/dissimilarity matrix
      hclust #Computer hierarchical clusters

plot(hc) # Plot dendrogram

# Add boxes to plot

rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k =3, border = "blue")
rect.hclust(hc, k =4, border = "purple")
rect.hclust(hc, k =5, border = "black")



# Principal components

# Less = more
# That is, less noise and fewer unhelpful variables in data = more meaning

# dimensional reduction
# Most common method is principal component analysis( PCA ).
# - Two variables
# - Regression
# - Perpendicular distance
# - Collapse
# - Rotate

# Went from 2D to 1D but maintained some of the information
# Went from 2D to 1D but maintained most of the information
# We made analysis and interpretation easier and more reliable


pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)
library(datasets)

head(mtcars)

# Compute PCA
# For entire data frame
pc <- prcomp(cars,
             center = TRUE, # Centers means to 0 (optional)
             scale = TRUE) # Sets units variance ( helpful)

# To specify variables

pc <- prcomp(~ mpg + cyl + disp + hp + qsec + am +
                gear + carb,
              data = mtcars,
              center = TRUE,
              scale = TRUE)

# examine results

# Get summary stats
summary(pc)

# Screeplot for number of components
plot(pc)

# Get standard deviations and rotation
pc

# See how cases load on PCs
predict(pc) %>% round(2)

# Biplot of first two components
biplot(pc)

# Clean Up
# clean environment
rm(list = ls())



# Regression
# Our of many variables, one variable.
# Our of many scores, one score.
# Use many variables to predict scores on one variable
# Many versions and adaptations of regression make it flexible and powerful

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr)
library(datasets)

# Load data

?USJudgeRatings
head(USJudgeRatings)
data <- USJudgeRatings

# Define variable groups
x <- as.matrix(data[-12])
y <- data[, 12]


# Regression with simultaneous entry

# Using variable groups
reg1 <- lm(y ~ x)

# Or specify variables individually
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + 
           DECI + PREP + FAMI + ORAL + WRIT + PHYS, 
           data = USJudgeRatings)
# Results
reg1 #Coefficients only
summary(reg1) #Inferential tests

# More Summaries

anova(reg1)   # Coefficients w/inferential tests
coef(reg1)    # Coefficients(same as reg1)
confint(reg1)  # CI for coefficients
resid(reg1)   # Residuals case-by-case
hist(residuals(reg1))  # Histogram of residuals


# Additional Models

# Use two additional librarries
p_load(lars, caret)

# Conventional stepwise regression
stepwise <-lars(x,y, type = "stepwise")

# Stagewise : Like stepwise but with better generalizability
forward <- lars(x, y, type = "forward.stagewise")

# LAR : Least Angle Repression
lar <- lars(x,y, type ="lasso")

# Comparison of R^2 for new models
r2comp <- c(stepwise$R2[6], forward$R2[6],
            lar$R2[6], lasso$R2[6]) %>%
            round(2)
names(r2comp) <- c("stepwise", "forward", "lar","lasson")
r2comp # show values of R^2

# Clean Up
# clean environment
rm(list = ls())
