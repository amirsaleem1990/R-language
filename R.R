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



# ROC curve
library(ROCR)
Rocr_pred <- prediction(prediction_train, df$target_var)
Rocr_perf <- performance(Rocr_pred, "X axis label", "Y axis label")
plot(Rocr_perf, colorize = TRUE, print.cutoffs.at = seq(0,1,0.1), text.adj = c(-0.2, 1.7))
	

# confusion matrix:
table(train$target_var, test_predictions > THRESHOLD)


# AUC value on testing set
# AUC : height value of AUC value means: the model can differentiate low-risk from high-risk patients (eg: AUC=0.75)
library(ROCR)
Rocr_pred <- ROCR::prediction(test_predictions, df$target_var)
as.numeric(ROCR::performance(Rocr_pred, "auc")@y.values)


# Multiple imputation
library(mice)
simple = df[c("col1", "col2", "col3", "col4")] # col1 and col2 have missing values
set.seed(144)
imputed = complete(mice(simple))
df$col1 = imputed$col1
df$col2 = imputed$col2



sign : negative to -1; posetive to 1; and 0 to 0
sign(-4) ==> -1
sign(9)  ==> 1
sign(0)  ==> 0


Drawbacks of Logistic Regrassion:
	Logistic Regrassion models are generally not INTERPRETABLE
	Logistic Regrassion models coefficients indicate importance and ralative effect of variable s, but do not give a simple explanation of how decision is made.
	
