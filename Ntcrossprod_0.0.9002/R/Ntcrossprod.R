#' \code{tcrossprod} for narrow matrix.
#'
#' This function turns the \code{base::tcrossprod} less RAM memory intense for a narrow matrix
#' , i.e. the number of rows is much smaller than the number of columns. The function splits
#' the multiplication in several smaller \code{tcrossprod}s and summing them up at the end.
#'
#' @param x A numeric matrix.
#' @return The 'tcrossprod' result.
#' @examples
#' #-Example-1-#
#' x <- matrix(sample(c(1,0),100000,replace=TRUE),100,10000)
#' Ntcrossprod(x)
#'
#' #-Example-2-#
#' data(example_Ntcrossprod)
#' Ntcrossprod(example_Ntcrossprod)
#'

Ntcrossprod <- function(x, split_interval = 1000){

  ## -------------------------------------------------------------
  ## Check data input
  if( !is.matrix(x)!="matrix" )
    stop(deparse("class of x must be matrix"))

  if( !is.numeric(x) )
    stop(deparse("class of x must be numeric"))

  if( nrow(x) >= ncol(x) )
    stop(deparse("x must be narrow: nrow < ncol"))

  if( split_interval < 10 )
    stop(deparse("split_inverval must be integer and > 10"))
  ## -------------------------------------------------------------

  ## -------------------------------------------------------------
  ## Split the data
  intervals <- seq( 1, ncol(x), 1000 )
  intervals <- c( intervals, ncol(x) )
  intervals <- unique( intervals )
  ## -------------------------------------------------------------

  ## Core loop
  ## -------------------------------------------------------------
  for(i in 1:( length(intervals)-1 ) ){
    if(i==1){
      y <- tcrossprod(x[,intervals[i]:c(intervals[i+1]-1)])
    }else{
        y <- y + tcrossprod(x[,(intervals[i]):c(intervals[i+1]-1)])
    }
    y <- y + tcrossprod(x[,ncol(x)])   
  }

  ## -------------------------------------------------------------

  class(y) <- c("matrix","Ntcrossprod")
  return(y)
}
