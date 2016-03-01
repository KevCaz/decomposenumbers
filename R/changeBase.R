#' Convert number from one base to another.
#'
#' Convert number from one base to another. Base values are picked between 2 and 36.
#'
#' @export
#'
#' @param x Object of class \code{DecomposedNumber} or an object that is coerced by ‘DecomposedNumber’.
#' @param from The base in which x is written.
#' @param from The base to which x must be written.
#' @param as.character Logical. Shall the number be retuned as an object of type ‘"character"’.
#'
#' @examples
#' changeBase(-265, from=10, to=16)
#' changeBase("e2792a", from=16, to=10)

changeBase <- function(x, from=NULL, to=2, as.character=FALSE){
    ## ---- format checking
    if (class(x)!="DecomposedNumber") x <- DecomposedNumber(x, base=from)
    ##
    if (paste0(x$digtable, collapse="")!="0"){
      ## ---- to base 10
      if (x$base!=10){
        num10 <- 0
        seqpow <- x$base^as.numeric(colnames(x$digtable))
        for (i in 1L:length(seqpow)) num10 <- num10+digitused(x$digtable[i], inv=TRUE)*seqpow[i]
      }
      else num10 <- abs(composeNumber(x))
      print(num10)
      print(floor(num10))
      ## --- from base 10 to base to
      # warning("Currenlty decimals are not converted")
      # num10 <- floor(num10)
      ## --
      szpw <- floor(log(num10,base=to))+1
      tbz <- integer(szpw)
      for(i in 1L:szpw){
        pow <- szpw-i
        div <- to^pow
        tbz[i] <- floor(num10/div)
        num10 <- num10%%div
      }
      z <- paste(sapply(tbz+1, FUN=digitused),collapse="")
    }
    else z <- "0"
    ##
    if (!as.character){
      z <- DecomposedNumber(z, base=to)
      if (x$sign==-1) z$sign=-1L
    }
    return(z)
}
# changeBase("1248675075", from=10, to=16, as.character=T)
