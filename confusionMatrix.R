library(caret)
cnf_mtrx <- function(target_var, predictions, cut_point){
    a = confusionMatrix(
      target_var,
      as.factor(ifelse(predictions < cut_point, 0, 1))
    )
    b <- a$table
    TN <- b[1]
    FN <- b[2]
    FP <- b[3]
    TP <- b[4]
    c(TN, TP, FP, FN)
}

load("All_FULL_MODEL_predictions_combined_in_one_place.rda")

df_all <- data.frame(matrix(nrow = 0, ncol = 6))
names(df_all) <- c("TN", "TP", "FP", "FN", "Threshold", "Model")

for (var in names(predictions_df)){
  if (var != "Actual"){
    cut_points <- c()
    lst <- c()
    for (i in seq(0.04, 0.99, 0.01)){
      if (i <= max(predictions_df[, var])){
        result <- cnf_mtrx(predictions_df$Actual, 
                           predictions_df[, var], i)
        lst <- append(lst, result)
        cut_points <- append(cut_points, i)
    }}
    df <- data.frame(matrix(lst, ncol = 4, byrow = T))
    df$Cut_point <- cut_points
    names(df) <- c("TN", "TP", "FP", "FN", "Threshold")
    df$Model <- rep(var, nrow(df))
    df_all <- rbind(df_all, df)
  }}

df_all$Precision <- df_all$TP / (df_all$TP + df_all$FP)
df_all$Recall <- df_all$TP / (df_all$TP + df_all$FN)
df_all$Total <- df_all$TN + df_all$TP + df_all$FP + df_all$FN


library(ggplot2)
ggplot(df_all, aes(x = Precision, y = Recall)) +
  geom_line() + 
  scale_x_continuous(breaks = c(seq(0, 1, 0.03))) 
  