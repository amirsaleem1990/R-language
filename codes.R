# save objects in drive 
obj <- c(1:100)
system("touch obj.rds", intern=T)
saveRDS(s, 'obj.rds')
obj_restored <- readRDS('obj.rds')
identical(obj, obj_restored)
# ...................................
