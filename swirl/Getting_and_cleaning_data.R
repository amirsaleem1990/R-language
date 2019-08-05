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
  
  pack_sum <- summarize(by_package,
                        count = n(), # total number of rows (i.e. downloads) for each package
                        unique = n_distinct(ip_id), # total number of unique downloads for each package, as measured by the number of distinct ip_id's
                        countries = n_distinct(country), # number of countries in which each package was downloaded
                        avg_bytes = mean(size)) # mean download size (in bytes) for each package.

  
  quantile(pack_sum$count, probs = 0.99) # 679 # what value in 99% quantile
  top_counts <- filter(pack_sum, count > 679) # only those in last 1% quantile
  

  
3: Tidying Data with tidyr
library(tidyr)

Tidy data is formatted in a standard way that facilitates exploration and analysis and works seamlessly with other tidy data tools. Specifically, tidy data satisfies three conditions:
1) Each variable forms a column
2) Each observation forms a row
3) Each type of observational unit forms a table

Any dataset that doesn't satisfy these conditions is considered 'messy' data. 
Therefore, all of the following are characteristics of messy data, EXCEPT...
1: Column headers are values, not variable names
2: Multiple types of observational units are stored in the same table
3: A single observational unit is stored in multiple tables
4: Multiple variables are stored in one column
5: Every column contains a different variable        # this is tidy data characteristic
6: Variables are stored in both rows and columns

=====================================================
> students
  grade male female
1     A    5      3
2     B    4      1
3     C    8      6
4     D    4      5
5     E    5      5

This dataset actually has three variables: grade, sex, and count. The first variable, grade, is already a column, so that should remain as it is. The second variable, sex, is captured by the second and third column headings. The third variable, count, is the number of students for each combination of grade and sex.

To tidy the students data, we need to have one column for each of these three variables. We'll use the gather() function from tidyr to accomplish this.

> gather(students, sex, count, -grade)
   grade    sex count
1      A   male     5
2      B   male     4
3      C   male     8
4      D   male     4
5      E   male     5
6      A female     3
7      B female     1
8      C female     6
9      D female     5
10     E female     5

 Each row of the data now represents exactly one observation, characterized by a unique combination of the grade and sex variables. Each of our variables (grade, sex, and count) occupies exactly one column. That's tidy data!

==============================================
The second messy data case we'll look at is when multiple variables are stored in one column

> students2
  grade male_1 female_1 male_2 female_2
1     A      7        0      5        8
2     B      4        0      5        8
3     C      7        4      5        6
4     D      8        2      8        1
5     E      8        4      1        0
 This dataset is similar to the first, except now there are two separate classes, 1 and 2, and we have total counts for each sex within each class. students2 suffers from the same messy data problem of having column headers that are values (male_1, female_1, etc.) and not variable names (sex, class, and count).

 However, it also has multiple variables stored in each column (sex and class), which is another common symptom of messy data. Tidying this dataset will be a two step process.


Let's start by using gather() to stack the columns of students2, like we just did with students. This time, name the 'key' column sex_class and the 'value' column count. Save the result to a new variable called res.

res <- gather(students2, key = sex_class, value = count, -grade)

> res
   grade sex_class count
1      A    male_1     7
2      B    male_1     4
3      C    male_1     7
4      D    male_1     8
5      E    male_1     8
6      A  female_1     0
7      B  female_1     0
8      C  female_1     4
9      D  female_1     2
10     E  female_1     4
11     A    male_2     5
12     B    male_2     5
13     C    male_2     5
14     D    male_2     8
15     E    male_2     1
16     A  female_2     8
17     B  female_2     8
18     C  female_2     6
19     D  female_2     1
20     E  female_2     0

 That got us half way to tidy data, but we still have two different variables, sex and class, stored together in the sex_class column. tidyr offers a convenient separate() function for the purpose of separating one column into multiple columns


> separate(data = res, col = sex_class, into = c("sex","class"))
   grade    sex class count
1      A   male     1     7
2      B   male     1     4
3      C   male     1     7
4      D   male     1     8
5      E   male     1     8
6      A female     1     0
7      B female     1     0
8      C female     1     4
9      D female     1     2
10     E female     1     4
11     A   male     2     5
12     B   male     2     5
13     C   male     2     5
14     D   male     2     8
15     E   male     2     1
16     A female     2     8
17     B female     2     8
18     C female     2     6
19     D female     2     1
20     E female     2     0

Conveniently, separate() was able to figure out on its ownhow to separate the sex_class column. Unless you requestotherwise with the 'sep' argument, it splits onnon-alphanumeric values. In other words, it assumes thatthe values are separated by something other than a letteror number (in this case, an underscore.)


we can chaining/piping the above steps for students2 data,

students2 %>%
  gather(key=sex_class,count,-grade) %>%
  separate(sex_class , c("sex", "class"))

   grade    sex class count
1      A   male     1     7
2      B   male     1     4
3      C   male     1     7
4      D   male     1     8
5      E   male     1     8
6      A female     1     0
7      B female     1     0
8      C female     1     4
9      D female     1     2
10     E female     1     4
11     A   male     2     5
12     B   male     2     5
13     C   male     2     5
14     D   male     2     8
15     E   male     2     1
16     A female     2     8
17     B female     2     8
18     C female     2     6
19     D female     2     1
20     E female     2     0


===================================================== 
A third symptom of messy data is when variables are stored in both rows and columns. students3 provides an example of this.

> students3
    name    test class1 class2 class3 class4 class5
1  Sally midterm      A   <NA>      B   <NA>   <NA>
2  Sally   final      C   <NA>      C   <NA>   <NA>
3   Jeff midterm   <NA>      D   <NA>      A   <NA>
4   Jeff   final   <NA>      E   <NA>      C   <NA>
5  Roger midterm   <NA>      C   <NA>   <NA>      B
6  Roger   final   <NA>      A   <NA>   <NA>      A
7  Karen midterm   <NA>   <NA>      C      A   <NA>
8  Karen   final   <NA>   <NA>      C      A   <NA>
9  Brian midterm      B   <NA>   <NA>   <NA>      A
10 Brian   final      B   <NA>   <NA>   <NA>      C

In students3, we have midterm and final exam grades for five students, each of whom were enrolled in exactly two of five possible classes.

The first variable, name, is already a column and should remain as it is. The headers of the last five columns, class1 through class5, are all different values of what should be a class variable. The values in the test column, midterm and final, should each be its own variable containing the respective grades for each student.

students3 %>%
  gather(key = class, value = grade, class1:class5 ,na.rm = TRUE) %>%
  print

    name    test  class grade
1  Sally midterm class1     A
2  Sally   final class1     C
9  Brian midterm class1     B
10 Brian   final class1     B
13  Jeff midterm class2     D
14  Jeff   final class2     E
15 Roger midterm class2     C
16 Roger   final class2     A
21 Sally midterm class3     B
22 Sally   final class3     C
27 Karen midterm class3     C
28 Karen   final class3     C
33  Jeff midterm class4     A
34  Jeff   final class4     C
37 Karen midterm class4     A
38 Karen   final class4     A
45 Roger midterm class5     B
46 Roger   final class5     A
49 Brian midterm class5     A
50 Brian   final class5     C


The next step will require the use of spread()
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade)

    name  class final midterm
1  Brian class1     B       B
2  Brian class5     C       A
3   Jeff class2     E       D
4   Jeff class4     C       A
5  Karen class3     C       C
6  Karen class4     A       A
7  Roger class2     A       C
8  Roger class5     A       B
9  Sally class1     C       A
10 Sally class3     C       B


library(readr)

Lastly, we want the values in the class column to simply be 1, 2, ..., 5 and not class1, class2, ..., class5. We can use the parse_number() function from readr to accomplish this.

students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class = parse_number(class)) %>% # here our task
  print

    name class final midterm
1  Brian     1     B       B
2  Brian     5     C       A
3   Jeff     2     E       D
4   Jeff     4     C       A
5  Karen     3     C       C
6  Karen     4     A       A
7  Roger     2     A       C
8  Roger     5     A       B
9  Sally     1     C       A
10 Sally     3     C       B



==================================================
The fourth messy data problem we'll look at occurs when multiple observational units are stored in the same table. students4 presents an example of this.


> students4
    id  name sex class midterm final
1  168 Brian   F     1       B     B
2  168 Brian   F     5       A     C
3  588 Sally   M     1       A     C
4  588 Sally   M     3       B     C
5  710  Jeff   M     2       D     E
6  710  Jeff   M     4       A     C
7  731 Roger   F     2       C     A
8  731 Roger   F     5       B     A
9  908 Karen   M     3       C     C
10 908 Karen   M     4       A     A


students4 is almost the same as our tidy version of students3. The only difference is that students4 provides a unique id for each student, as well as his or her sex (M = male; F = female)

At first glance, there doesn't seem to be much of a problem with students4. All columns are variables and all rows are observations. However, notice that each id, name, and sex is repeated twice, which seems quite redundant. This is a hint that our data contains multiple observational units in a single table.


student_info <- students4 %>%
  select(id, name, sex) %>%
  unique %>%
  print

   id  name sex
1 168 Brian   F
3 588 Sally   M
5 710  Jeff   M
7 731 Roger   F
9 908 Karen   M


gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print

    id class midterm final
1  168     1       B     B
2  168     5       A     C
3  588     1       A     C
4  588     3       B     C
5  710     2       D     E
6  710     4       A     C
7  731     2       C     A
8  731     5       B     A
9  908     3       C     C
10 908     4       A     A

It's important to note that we left the id column in both tables. In the world of relational databases, 'id' is called our 'primary key' since it allows us to connect each student listed in student_info with their grades listed in gradebook. Without a unique identifier, we might not know how the tables are related. (In this case, we could have also used the name variable, since each student happens to have a unique name.)


====================================
The fifth and final messy data scenario that we'll address is when a single observational unit is stored in multiple tables. It's the opposite of the fourth problem.

To illustrate this, we've created two datasets, passed and failed.

> passed
   name class final
1 Brian     1     B
2 Roger     2     A
3 Roger     5     A
4 Karen     4     A


> failed
   name class final
1 Brian     5     C
2 Sally     1     C
3 Sally     3     C
4  Jeff     2     E
5  Jeff     4     C
6 Karen     3     C


Teachers decided to only take into consideration final exam grades in determining whether students passed or failed each class. As you may have inferred from the data, students passed a class if they received a final exam grade of A or B and failed otherwise.

The name of each dataset actually represents the value of a new variable that we will call 'status'. Before joining the two tables together, we'll add a new column to each containing this information so that it's not lost when we put everything together.

passed <- mutate(passed, status = "passed")
failed <- mutate(failed, status = "failed")

> bind_rows(passed, failed)
    name class final status
1  Brian     1     B passed
2  Roger     2     A passed
3  Roger     5     A passed
4  Karen     4     A passed
5  Brian     5     C failed
6  Sally     1     C failed
7  Sally     3     C failed
8   Jeff     2     E failed
9   Jeff     4     C failed
10 Karen     3     C failed

Of course, we could arrange the rows however we wish at this point, but the important thing is that each row is an observation, each column is a variable, and the table contains a single observational unit. Thus, the data are tidy.

> sat
# A tibble: 6 x 10
  score_range read_male read_fem read_total math_male math_fem math_total write_male write_fem write_total
  <chr>           <int>    <int>      <int>     <int>    <int>      <int>      <int>     <int>       <int>
1 700-800         40151    38898      79049     74461    46040     120501      31574     39101       70675
2 600-690        121950   126084     248034    162564   133954     296518     100963    125368      226331
3 500-590        227141   259553     486694    233141   257678     490819     202326    247239      449565
4 400-490        242554   296793     539347    204670   288696     493366     262623    302933      565556
5 300-390        113568   133473     247041     82468   131025     213493     146106    144381      290487
6 200-290         30728    29154      59882     18788    26562      45350      32500     24933       57433


sat %>%
  select(-contains("total")) %>% # all columns that do NOT contain the word "total"
  gather(key = part_sex, value = count, -score_range) %>% # gather() all columns EXCEPT score_range
  separate(part_sex, c("part", "sex")) %>% # separate() part_sex into two separate variables (columns), called "part" and "sex", respectively
  print

# A tibble: 36 x 4
   score_range part  sex    count
   <chr>       <chr> <chr>  <int>
 1 700-800     read  male   40151
 2 600-690     read  male  121950
 3 500-590     read  male  227141
 4 400-490     read  male  242554
 5 300-390     read  male  113568
 6 200-290     read  male   30728
 7 700-800     read  fem    38898
 8 600-690     read  fem   126084
 9 500-590     read  fem   259553
10 400-490     read  fem   296793
# … with 26 more rows


sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part, sex)%>%
  mutate(total = sum(count),
         prop = count / total) %>% 
  print

# A tibble: 36 x 6
# Groups:   part, sex [6]
   score_range part  sex    count  total   prop
   <chr>       <chr> <chr>  <int>  <int>  <dbl>
 1 700-800     read  male   40151 776092 0.0517
 2 600-690     read  male  121950 776092 0.157 
 3 500-590     read  male  227141 776092 0.293 
 4 400-490     read  male  242554 776092 0.313 
 5 300-390     read  male  113568 776092 0.146 
 6 200-290     read  male   30728 776092 0.0396
 7 700-800     read  fem    38898 883955 0.0440
 8 600-690     read  fem   126084 883955 0.143 
 9 500-590     read  fem   259553 883955 0.294 
10 400-490     read  fem   296793 883955 0.336 
# … with 26 more rows
