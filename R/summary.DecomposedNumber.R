#' Summary methods for DecomposedNumber objects.
#'
#' Summarize the property of objects of class \code{DecomposedNumber} by simple
#' \code{print} methods.
#'
#' @param x: Object of class \code{DecomposedNumber}.
#'
#' @examples
#' dnum <- DecomposedNumber("-536836,3")
#' summary(dnum)

summary.DecomposedNumber <- function(x){
  cat("\nComposed Form:\n")
  cat(composeNumber(x))
  cat("\n")
  cat("\nTable of digits:\n")
  print(x$digtable)
  cat("\nBase:\n")
  cat(x$base)
  cat("\n")
  cat("\nSign:\n")
  if (x$sign==1L) cat("Positive")
  else cat("Negative\n")
  cat("\n")
}
