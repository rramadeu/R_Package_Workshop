## Splits the tcrossprod for narrow matrix product

Ntcrossprod <- function(x){

  ## Splitting the data
  intervals <- seq(1,ncol(x),1000)
  intervals <- c(intervals,ncol(x))
  intervals <- unique(intervals)

  ## Core loop
  for(i in 1:( length(intervals)-1 ) ){
    if(i==1){
      y <- tcrossprod( x[ , intervals[i]:intervals[i+1] ] )
    }else{
      y <- y + tcrossprod( x[ , intervals[i]:intervals[i+1] ] )
    }
  }
  return(y)
}
