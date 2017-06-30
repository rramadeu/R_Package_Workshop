#' \code{plot} Ntcrossprod class
#'
#' Plots a corrplot for Ntcrossprod class product
#'
#' @param x A Ntcrossprod class
#' @param interval sequence of the lines wish to plot
#' @param ... parameters to be passed on corrplot function
#'
#' @return The corrplot graphic
#' @examples
#' #-Example-1-#
#' data("example_Ntcrossprod")
#' y<-Ntcrossprod(example_Ntcrossprod)
#' plot(y)
#'
#' #-Example-2-#
#' data("example_Ntcrossprod")
#' y<-Ntcrossprod(example_Ntcrossprod)
#' plot(y, interval=1:5, method="square")
#'
plot.Ntcrossprod <- function(x, interval = 1:10, ...){
  if(is(x,"Ntcrossprod"))
    corrplot::corrplot( (x[interval,interval]/max(x)), is.corr=FALSE, ...)
}
