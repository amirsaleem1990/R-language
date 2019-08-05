# linear regrassion find best variable with adjusted R square

options(warn=-1)
library(dplyr)
nam <- c()
val  <- c()
for (i in names(movies[, -14])){
    nam  <- append(nam, i)
    val  <- append(val, summary(lm(audience_score ~ movies[[i]], data = movies))$adj.r.squared)
}
a  <- data.frame(nam, val)
arrange(a, desc(val))[1,]


options(warn=-1)
ok_vars  <- c('audience_score')
variable_selection <- function(ok_vars, balance_variables){
  nam <- c()
  val  <- c()
  for (i in balance_variables){
    nam  <- append(nam, i)
    
    a = paste("audience_score ~ ", paste(ok_vars[2:length(ok_vars)], collapse=" + "))
    b = formula(paste(a,ok_vars,i, sep = " + "))
    model  <- lm(b, data=movies)
    
    val  <- append(val,summary(model)$adj.r.squared)
  }
  a  <- data.frame(nam, val)
  print(arrange(a, desc(val))[1,])
}
update <- function(n){
  ok_vars <<- append(ok_vars, n)
  balance_vars <<- names(movies)[!names(movies) %in% ok_vars]
}


update('imdb_rating')
variable_selection(ok_vars, balance_vars)
# Note: in second last line 'imdb_rating' is a best variable with adjusted R sqare, so we added his to our base line model, and tha last line we find second variable for our model.
