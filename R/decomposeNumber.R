#' Decompose a number.
#'
#' Break apart a multidigit number and return a matrix of its components.
#'
#' @param x A number or a character string that contains digits as alphanumeric characters and optionnaly a sign mark and a decimal mark.
#' @param signout logical. If TRUE the sign of the number is returned.
#'
#' @export
#'
#' @details
#' If a sign mark is detected, it will be removed from the matrix returned but retuned if \code{signout} is TRUE.
#'
#' @examples
#' decomposeNumber(983)
#' decomposeNumber("34,53")
#' decomposeNumber("092092EKXEKE")
#' decomposeNumber(-536836.3, signout=TRUE)

decomposeNumber <- function(x, signout=FALSE){
    ## ----
    y <- tolower(as.character(x))
    tbnum <- unlist(strsplit(y, ""))
    ## ----
    sig <- 1L
    if (tbnum[1L]=="-") {
      tbnum <- tbnum[-1L]
      if (signout) sig <- -1L
    }
    id <- which(sapply(tbnum, grepl, pattern="(,|\\.)"))
    if (length(id)>1) stop("More than one decimal mark.")
    if (length(id)>0) tbnum <- tbnum[-id]
    ## ----
    sz <- length(tbnum)
    id2 <- which(!sapply(tbnum, grepl, pattern="[[:alnum:]]"))
    if (length(id2)>0) stop("At least one digit is not an alphanumeric character.")
    ## ----
    seqpow <- seq(sz-1,0,-1)
    if (length(id)==1) seqpow <- seqpow-(sz-id+1)
    ## ----
    matdig <- matrix(tbnum,nrow=1L)
    colnames(matdig) <- seqpow
    if (signout) return(list(digtable=matdig,sign=sig))
    return(matdig)
}
