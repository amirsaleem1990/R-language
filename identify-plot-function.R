Auto  <- read.table('/home/amir/learning/ISLR/Datasets-and-Figures/Auto.data', header=TRUE ,na.strings ="?")
Auto  <- na.omit(Auto)
Auto <- as.factor(cylinders)
plot(Auto$horsepower, Auto$mpg); identify(Auto$horsepower, Auto$mpg)
