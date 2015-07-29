#' Compose an objects of class DecomposedNumber.
#'
#' Convert a \code{DecomposedNumber} object into a object of class \code{numeric} or \code{character}.
#'
#' @param x A number or a character string to be passed to function \code{decomposeNumber} function.
#'
#' @export
#'
#' @examples
#' dnum <- DecomposedNumber("-776846,3")
#' composeNumber(dnum)

composeNumber <- function(x){
  stopifnot(class(x)=="DecomposedNumber")
  ## ----
  dmk <- as.numeric(colnames(x$digtable))
  id <- which(dmk=="-1")
  if (length(id)){
    sz <- length(x$digtable)
    neg <- paste(x$digtable[id:sz], collapse="")
    if (id>1) pos <- paste(x$digtable[1:(id-1)], collapse="")
    else pos <- ""
    cnum <- paste0(pos,".",neg)
  }
  else cnum <- paste(x$digtable, collapse="")
  ## ---
  if (x$sign==-1) cnum <- paste0("-",cnum)
  if (x$base<11) cnum <- as.numeric(cnum)
  return(cnum)
}
