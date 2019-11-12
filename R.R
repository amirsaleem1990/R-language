# lm formula
form.in<-paste('y ~',paste(names(lm.dat)[-1],collapse='+'))



# Opposite of %in% .............. D2 = subset(D1, !(V1 %in% c('B','N','T'))).......... 
# You can also make an operator yourself:
'%!in%' <- function(x,y)!('%in%'(x,y))
c(1,3,11)%!in%1:10
[1] FALSE FALSE  TRUE
# https://stackoverflow.com/questions/5831794/opposite-of-in

