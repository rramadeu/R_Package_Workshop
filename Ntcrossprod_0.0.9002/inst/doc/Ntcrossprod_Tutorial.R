## ---- eval=TRUE, echo=TRUE-----------------------------------------------
library(Ntcrossprod)
data("example_Ntcrossprod")
y<-Ntcrossprod(example_Ntcrossprod)
plot(y, interval=1:5, method="square")

