swirl <Getting and Cleaning Data>
# your can install this course by: swirl::install_course("Getting and Cleaning Data")

  
# | When you are at the R prompt (>):
# | -- Typing skip() allows you to skip the current question.
# | -- Typing play() lets you experiment with R on your own; swirl will
# | ignore what you do...
# | -- UNTIL you type nxt() which will regain swirl's attention.
# | -- Typing bye() causes swirl to exit. Your progress will be saved.
# | -- Typing main() returns you to swirl's main menu.
# | -- Typing info() displays these options again.
# 

1: Manipulating Data with dplyr

# The first step of working with data in dplyr is to load the data into what the package authors call a 'data frame tbl' or 'tbl_df'
cran <- tbl_df(mydf)

# The main advantage to using a tbl_df over a regular data frame is the printing.

# The dplyr philosophy is to have small functions that each do one thing well." Specifically, dplyr supplies five 'verbs' that cover most fundamental data manipulation tasks: select(), filter(), arrange(), mutate(), and summarize()
select(): # works on columns
  select(df, column_n, column_x, column_z) # returned dataframe column order as we put in select statement
  select(df, column_5: column_11) # select range of columns
  select(df, -column_7) # select all columns except column_7
  select(cran, -(column_7:column_11)) # select all columns except range of columns specified
  
  
filter(): # works on rows
  filter(cran, package == "swirl") # select all rows that have value "swirl" in <package> column
  filter(cran, r_version == "3.1.1", country == "US") # and
  filter(cran, country == "US" | country == "IN")     # or
  filter(cran, !is.na(r_version)) # select all rows that not a NA in <r_version> column
  
arrange(): # for sorting / ordering
  arrange(cran2, ip_id) # order <cran_2> dataframe by column <ip_id> in ascending order
  arrange(cran2, desc(ip_id)) # same as above, but in decending order
  arrange(cran2, package, ip_id) # first arrange by package names (ascending alphabetically), then by ip_id. This means that if there are multiple rows with the same value for package, they will be sorted by ip_id (ascending numerically)
  
mutate(): #create a new variable based on the value of one or more variables already in a dataset
  mutate(cran3, size_mb = size / 2 ^ 20) # create a new variable size_mb that contain values <size / 2^20>
  mutate(cran3, size_mb = size / 2 ^ 20, size_gb = size_mb / 2 ^ 10) # create first variable as expalined above, and using this new crated variable; create third variable in same line.
  
summarize(): # collapses the dataset to a single row
  summarize(cran, avg_bytes = mean(size)) # return just one value which is mean of <size> variable




2: Grouping and Chaining with dplyr


group_by(): # grop data base of particuler colum/s values
  by_package <- group_by(cran, package)
  summarise(by_package, mean(size)) # mean or variable <size> for EACH group
  