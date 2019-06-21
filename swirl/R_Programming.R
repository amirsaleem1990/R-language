library(swirl)
swirl()

8: Logic
> TRUE & c(TRUE, FALSE, FALSE)
# [1]  TRUE FALSE FALSE


# the left operand is only evaluated with the first member of the right operand (the vector). The rest of the elements in the vector aren't evaluated at all in this expression.
> TRUE && c(TRUE, FALSE, FALSE)
# [1] TRUE


> TRUE | c(TRUE,FALSE, FALSE)
# [1] TRUE TRUE TRUE



> TRUE || c(TRUE, FALSE, FALSE)
# [1] TRUE



# As you may recall, arithmetic has an order of operations and so do logical expressions. All AND operators are evaluated before OR operators. Let's look at an example of an ambiguous case
> 5 > 8 || 6 != 8 && 4 > 3.9
# [1] TRUE



# The function isTRUE() takes one argument. If that argument evaluates to TRUE, the function will return TRUE. Otherwise, the function will return FALSE.
> isTRUE(6 > 4)
# [1] TRUE




# identical() will return TRUE if the two R objects passed to it as arguments are identical.
> identical('twins', 'twins')
# [1] TRUE




# You should also be aware of the xor() function, which takes two arguments. The xor() function stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE, otherwise it will return FALSE.
> xor(5 == 6, !FALSE)
# [1] TRUE



> ints <- sample(10)
# to find the indices of ints that are greater than 7
> which(ints > 7)
# [1] 1 4 7 # the <ints> created randomely, so probeably you get diffrent indices


# any() and all() take logical vectors as their argument. The any() function will return TRUE if one or more of the elements in the logical vector is TRUE. The all() function will return TRUE if every element in the logical vector is TRUE.
> any(ints < 0)
# [1] FALSE


> all(ints > 0)
# [1] TRUE




9: Functions

telegram <- function(...){
  paste("START", ..., "STOP")
}
> telegram("Good", "morning")
# [1] "START Good morning STOP"



# unpack arguments

mad_libs <- function(...){
  args <- list(...)
  place <- args[1]
  adjective <- args[2]
  noun <- args[3]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

> mad_libs("AAAAAAAA", "BBBBBBB", "CCCCCCCCCC")
# [1] "News from AAAAAAAA today where BBBBBBB students took to the streets in protest of the new CCCCCCCCCC being installed on campus."




# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(l, r){ # Remember to add arguments!
  paste(l, r)
}

"Good" %p% "job!"
# [1] "Good job!"

> "I" %p% "love" %p% "R!"
# [1] "I love R!"



14: Dates and Times
Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes. Internally, dates are stored as the number of days since 1970-01-01 and times are stored as either the number of seconds since 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt').

d1 <- Sys.Date() # get the current date

> class(d1)
# [1] "Date"

# We can use the unclass() function to see what d1 looks like internally.
> unclass(d1)
# [1] 18067 # the exact number of days since 1970-01-01!

> d1
# [1] "2019-06-20"

# What if we need to reference a date prior to 1970-01-01?
d2 <- as.Date("1969-01-01")
> unclass(d2)
# [1] -365 # since <1969-01-01> is exactly one calendar year (i.e. 365 days) BEFORE 1970-01-01.


t1 <- Sys.time() # current date and time
> t1
# [1] "2019-06-20 11:10:42 PKT"

> class(t1)
# [1] "POSIXct" "POSIXt" 

# As mentioned earlier, POSIXct is just one of two ways that R represents time information. (You can ignore the second value above, POSIXt, which just functions as a common language between POSIXct and POSIXlt.)


> unclass(t1)
# [1] 1561011043 # number of seconds since the beginning of 1970.

# By default, Sys.time() returns an object of class POSIXct, but we can coerce the result to POSIXlt with as.POSIXlt(Sys.time())

> t2 <- as.POSIXlt(Sys.time())
> class(t2)
# [1] "POSIXlt" "POSIXt"

> t2
# [1] "2019-06-20 11:27:49 PKT"

# The printed format of t2 is identical to that of t1. Now unclass() t2 to see how it is different internally.

> unclass(t2)
# $sec
# [1] 49.83735

# $min
# [1] 27

# $hour
# [1] 11

# $mday
# [1] 20

# $mon
# [1] 5

# $year
# [1] 119

# $wday
# [1] 4

# $yday
# [1] 170

# $isdst
# [1] 0

# $zone
# [1] "PKT"

# $gmtoff
# [1] 18000

# attr(,"tzone")
# [1] ""    "PKT" "PKT"


> str(unclass(t2))
# List of 11
#  $ sec   : num 49.8
#  $ min   : int 27
#  $ hour  : int 11
#  $ mday  : int 20
#  $ mon   : int 5
#  $ year  : int 119
#  $ wday  : int 4
#  $ yday  : int 170
#  $ isdst : int 0
#  $ zone  : chr "PKT"
#  $ gmtoff: int 18000
#  - attr(*, "tzone")= chr [1:3] "" "PKT" "PKT"



# If, for example, we want just the minutes from the time stored in t2, we can access them with t2$min
> t2$min
# [1] 27


# day of week
> weekdays(d1)
# [1] "Thursday"


> months(t1)
# [1] "June"


# quarters() returns the quarter of the year (Q1-Q4) from any date or time object
> quarters(t2)
# [1] "Q2"


# Often, the dates and times in a dataset will be in a format that R does not recognize. The strptime() function can be helpful in this situation, strptime() converts character vectors to POSIXlt. In that sense, it is similar to as.POSIXlt(), except that the input doesn't have to be in a particular format (YYYY-MM-DD).

t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")

> t4
# [1] "1986-10-17 08:24:00 PKT"


> class(t4)
# [1] "POSIXlt" "POSIXt"


# t1 contains the time at which you created it (recall you used Sys.time())
# compare it to the current time
> Sys.time() > t1
# [1] TRUE


> Sys.time() - t1
# Time difference of 38.02935 mins


# If you want more control over the units when finding the above difference in times, you can use difftime(), which allows you to specify a 'units' parameter.
> difftime(Sys.time(), t1, units = 'days')
# Time difference of 0.02690689 days





12: Looking at Data 


> class(plants)
# [1] "data.frame"

> object.size(plants)
# 686080 bytes


13: Simulation

# simulate rolling four six-sided dice
> sample(1:6, 4, replace = TRUE)
# [1] 5 4 1 6

> LETTERS
# [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T"
# [21] "U" "V" "W" "X" "Y" "Z"

> sample(LETTERS)
# [1] "W" "K" "D" "E" "Z" "Q" "T" "C" "Y" "N" "F" "P" "J" "G" "X" "A" "M" "V" "L" "S"
# [21] "H" "O" "U" "R" "B" "I"
# This is identical to taking a sample of size 26 from LETTERS, without replacement. When the 'size' argument to sample() is not specified, R takes a sample equal in size to the vector from which you are sampling.


# Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size 100 from the vector c(0,1), with replacement. Since the coin is unfair, we must attach specific probabilities to the values 0 (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7)
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
> flips
# [1] 0 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 1 0 0 1 1 1 1 1 1 1 1 1 0 1 1
# [40] 0 1 1 1 0 1 1 1 0 0 1 1 1 1 0 0 0 1 0 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1
# [79] 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 0 0 0 1 0 1 


# A coin flip is a binary outcome (0 or 1) and we are performing 100 independent trials (coin flips), so we can use rbinom() to simulate a binomial random variable


# Each probability distribution in R has an r*** function (for "random"), a d*** function (for "density"), a p*** (for "probability"), and q*** (for "quantile"). We are most interested in the r*** functions in this lesson, but I encourage you to explore the others on your own.



