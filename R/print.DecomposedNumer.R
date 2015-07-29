#' Print methods for DecomposedNumber objects
#'
#' Printing objects of class \code{DecomposedNumber} by simple \code{print} methods.
#'
#' @param x: Object of class \code{DecomposedNumber}.
#'
#' @examples
#' dnum <- DecomposedNumber("-536836,3")
#' print(dnum)

print.DecomposedNumber <- function(x){
  y <- composeNumber(x)
  cat("\nNumber: ", y, " Base: ",x$base)
  cat("\n")
}
