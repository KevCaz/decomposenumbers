#' Convert the values of digits used.
#'
#' @param x Either a numeric of a string.
#' @param inv logical. If TRUE, the reverse transformed is computed.
#'
#' @examples
#' digitused("5", inv=TRUE)

digitused <- function(x, inv=FALSE){
  tbdig <- c(0:9,letters)
  if (!inv) {
    x <- as.numeric(x)
    stopifnot(x<37)
    return(tbdig[x])
  }
  else {
    stopifnot(grepl(pattern="[[:alnum:]]{1}",x))
    return(which(tbdig==x)-1)
  }
}
