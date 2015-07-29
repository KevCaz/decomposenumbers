#' Create objects of class DecomposedNumber.
#'
#' Create objects of class DecomposedNumber from a number or an adequate character string.
#'
#' @param x A number or a character string to be passed to function \code{decomposeNumber} function.
#'
#' @examples
#' dnum <- DecomposedNumber(-536836.3)
#' print(dnum)

DecomposedNumber <- function(x, base=NULL){
  stopifnot(base>1&base<37)
  tbnum <- decomposeNumber(x, signout=TRUE)
  if (is.null(base)) {
    mx <- max(tbnum$digtable)
    if (mx<"3") base=2
    else if (mx<"a") base=10
    else if (mx<"g") base=16
    else base=36
  }
  else {
    if (!all(tbnum$digtable<digitused(base+1))) stop("At least one digit is greater than the base")
  }
  ## ----
  mynum <- structure(
    list(digtable=tbnum[[1]], base=base, sign=tbnum[[2]]),
    class="DecomposedNumber")
  return(mynum)
}
