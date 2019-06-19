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


