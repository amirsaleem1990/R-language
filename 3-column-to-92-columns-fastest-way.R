library(tidyr)
library(data.table)
load("huge_matrix_revenue.rda")


adf <- setDT(adf)
gr_adf <- adf[,lapply(.SD,sum,na.rm = TRUE),by = list(ACCESS_METHOD_ID_,date)]
start = Sys.time()
casted_dates <- dcast(gr_adf, ACCESS_METHOD_ID_ ~ date, value.var =  "IsUsed")
stop = Sys.time()
stop - start

write.csv(casted_dates,file="casted_btyd.csv")

casted_dates[is.na(casted_dates)] <- 0
casted_dates[casted_dates == 2] <- 1