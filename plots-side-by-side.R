library(ggplot2)
require(gridExtra)
plot1 <- ggplot(df, aes(x= TV, y= sales)) + geom_point() + geom_smooth(method='lm', se = FALSE)
plot2 <- ggplot(df, aes(x= radio, y= sales)) + geom_point() + geom_smooth(method='lm', se = FALSE)
plot3 <- ggplot(df, aes(x= newspaper, y= sales)) + geom_point() + geom_smooth(method='lm', se = FALSE)
grid.arrange(plot1, plot2, plot3, ncol=2)


# using plot:
par(mfrow=c(3,3))
for( i in colnames(college_only_numeric)){
    hist(college_only_numeric[[i]], xlab = i)
}
