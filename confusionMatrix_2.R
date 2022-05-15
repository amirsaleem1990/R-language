load("ranger_model_1_predictions_stratified.rda")
library(caret)
load("b.rda")
cnf_mtrx <- function(target_var, predictions, cut_point){
  a = confusionMatrix(
    target_var,
    as.factor(ifelse(predictions < cut_point, 0, 1))
  )
  over.All <- a$overall[1]
  sensitivity <- a[4]$byClass["Sensitivity"]
  specificity <- a[4]$byClass["Specificity"]
  Precision  <-  a[4]$byClass["Precision"]
  Recall <-      a[4]$byClass["Recall"]
  f1 <-  a[4]$byClass["F1"]
  c(over.All, sensitivity, specificity, Precision, Recall, f1)
}
cut_points <- c()
lst <- c()
for (i in seq(0.04, 0.99, 0.05)){
    result <- cnf_mtrx(test_lables, predictions_jazz, i)
    lst <- append(lst, result)
    cut_points <- append(cut_points, i)
}

df <- data.frame(matrix(lst, ncol = 6))
df$Cut_point <- cut_points
names(df) <- c("over.All.Accuracy", "sensitivity", "specificity", "Precision", "Recall", "f1", "Threshold")
