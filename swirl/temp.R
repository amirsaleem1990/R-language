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
