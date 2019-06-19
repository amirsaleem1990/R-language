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

