tryCatch({
      a <- b
      b <- b + a
      c / b
      }, error=function(e) stop("There is an error")