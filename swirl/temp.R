> shape_mat <- sapply(flag_shapes, range)
> shape_mat
# circles crosses saltires quarters sunstars
# [1,]       0       0        0        0        0
# [2,]       4       2        1        4       50


# confirm that shape_mat is a matrix.
> class(shape_mat)
# [1] "matrix"


# As we've seen, sapply() always attempts to simplify the result given by lapply(). It has been successful in doing so for each of the examples we've looked at so far. Let's look at an example where sapply() can't figure out how to simplify the result and thus returns a list, no different from lapply().


# Occasionally, you may need to apply a function that is not yet defined, thus requiring you to write your own.
lapply(unique_vals, function(elem) elem[2]) # return a list containing the second item from each element of the unique_vals list.



11: vapply and tapply
# In the last lesson, you learned about the two most fundamental members of R's *apply family of functions: lapply() and sapply(). Both take a list as input, apply a function to each element of the list, then combine and return the result. lapply() always returns a list, whereas sapply() attempts to simplify the result.

# What if you had forgotten how unique() works and mistakenly thought it returns the *number* of unique values contained in the object passed to it? Then you might have incorrectly expected sapply(flags, unique) to return a numeric vector, since each element of the list returned would contain a single number and sapply() could then simplify the result to a vector.
# When working interactively (at the prompt), this is not much of a problem, since you see the result immediately and will quickly recognize your mistake. However, when working non-interactively (e.g. writing your own functions), a misunderstanding may go undetected and cause incorrect results later on. Therefore, you may wish to be more careful and that's where vapply() is useful
# Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly. If the result doesn't match the format you specify, vapply() will throw an error, causing the operation to stop. This can prevent significant problems in your code that might be caused by getting unexpected return values from sapply().
# vapply(flags, unique, numeric(1)), which says that you expect each element of the result to be a numeric vector of length 1. Since this is NOT actually the case, YOU WILL GET AN ERROR. Once you get the error

# Recall from the previous lesson that sapply(flags, class) will return a character vector containing the class of each column in the dataset.

> sapply(flags, class)
# name   landmass       zone       area population   language   religion       bars    stripes    colours        red      green 
# "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
# blue       gold      white      black     orange    mainhue    circles    crosses   saltires   quarters   sunstars   crescent 
# "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
# triangle       icon    animate       text    topleft   botright 
# "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 

# If we wish to be explicit about the format of the result we expect, we can use vapply(flags, class, character(1)). The 'character(1)' argument tells R that we expect the class function to return a character vector of length 1 when applied to EACH column of the flags dataset.

> vapply(flags, class, character(1))
# name   landmass       zone       area population   language   religion       bars    stripes    colours        red      green 
# "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
# blue       gold      white      black     orange    mainhue    circles    crosses   saltires   quarters   sunstars   crescent 
# "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
# triangle       icon    animate       text    topleft   botright 
# "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 

# since our expectation was correct (i.e. character(1)), the vapply() result is identical to the sapply() result

# You might think of vapply() as being 'safer' than sapply(), since it requires you to specify the format of the output in advance, instead of just allowing R to 'guess' what you wanted. In addition, vapply() may perform faster than sapply() for large datasets. However, when doing data analysis interactively (at the prompt), sapply() saves you some typing and will often be good enough.

# As a data analyst, you'll often wish to split your data up into groups based on the value of some variable, then apply a function to the members of each group. The next function we'll look at, tapply(), does exactly that.
