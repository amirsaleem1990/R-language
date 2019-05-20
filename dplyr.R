The first step of working with data in dplyr is to load the data into what the package authors call a 'data frame tbl' or 'tbl_df' ........ df <- tbl_df(df)
# rm object from memory ................. rm("variable name")
dplyr::select() ............ select(df, col3, col1,col2) .................. select(df, col3:col9) .............. select(df, col9:col3) ............. select(df, -column_to_exclude) ............ select(df, -(from_column_to_exlude:to_column_to_exclude) ............. 
dplyr::filter() .............. filter(column_n == "blabla") ............. filter(column_n == "blabla", column_z == "ababab")................ filter(column == "blabla" | column_z == "'ababab") ............ filter(df, !is.na(column_n))

dplyr::arrange() ............ arrange(df, column_n) ................ arrange(df, desc(column_n)) ............. arrange(df, column_n, column_z) ............... arrange(df, column_n, desc(column_z), column_x) 

dplyr::mutate() ............ mutate(df, column_q = column_n / 100) ............ mutate(df, column_x = column_n / 100, column_z = column_x / 1000)

dplyr::summarize() ............ summarize(df avg_size=mean(size)) 
