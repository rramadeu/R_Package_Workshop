## Created by Rodrigo Rampazo Amadeu
## rramadeu at gmail dot com

## Splits the tcrossprod for narrow matrix product
Ntcrossprod <- function(x){

  ## Splitting the data
  intervals <- seq(1,ncol(x),1000)
  intervals <- c(intervals,ncol(x))
  intervals <- unique(intervals)

  ## Core loop
  for(i in 1:( length(intervals)-1 ) ){
    if(i==1){
      y <- tcrossprod(x[,intervals[i]:c(intervals[i+1]-1)])
    }else{
        y <- y + tcrossprod(x[,(intervals[i]):c(intervals[i+1]-1)])
    }
   
  }
    y <- y + tcrossprod(x[,ncol(x)])
    return(y)
}

