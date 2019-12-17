# lm formula
form.in<-paste('y ~',paste(names(lm.dat)[-1],collapse='+'))



# Opposite of %in% .............. D2 = subset(D1, !(V1 %in% c('B','N','T'))).......... 
# You can also make an operator yourself:
'%!in%' <- function(x,y)!('%in%'(x,y))
c(1,3,11)%!in%1:10
[1] FALSE FALSE  TRUE
# https://stackoverflow.com/questions/5831794/opposite-of-in

# Build a model excluding the tax variable
model2 <- lm(medv ~. -tax, data = train.data)


# split data into train and test with regards of distribution of target variable
split = caTools::sample.split(df$target_var, Split.Ratio = 0.75) # test retio os 75 %
train = subset(df, split == TRUE)
test = subset(df, split == FALSE)
