---
title: "R Packages"
author: "Rodrigo Amadeu"
date: "June 27th 2017"
---

This is the ouline for the R Package workshop based on the [References](references) and it uses R projects with R packages as supplementary material: `ntcrossprod_0.0.9000.Rproj`, `ntcrossprod_0.0.9001.Rproj`, `ntcrossprod_0.0.9002.Rproj`, `onemap.Rproj`

## References
Hardcore:
  https://cran.r-project.org/doc/manuals/r-release/R-exts.html
  
Easy going:
  http://kbroman.org/pkg_primer/

Enough:
  http://r-pkgs.had.co.nz/
  
## Package idea
* `script.R`
* `source("script.R")`
* generic `function()`
* `source("script.R")`

```{r, chache=FALSE}
rm(list=ls())
ls()
source("~/git/R_Package_Workshop/source/Ntcrossprod.R")
ls()
Ntcrossprod
Ntcrossprod(matrix(sample(c(1,0),10000,replace=TRUE),nrow=10,ncol=1000))
```

* +1 function | code | data > PACKAGE!

## My 1st Package! (Version 0.0.9000)
* What is a package?
* Minimal package
* Why RStudio?!

http://hadley.nz/

* METADATA DESCRIPTION
* Build
* Check

* Example Ncrossprod personal package:
    * Problem: Make crossprod in narrow matrices e.g. nrow <<< ncol is memmory consuming. There is no package which leads with this.
    * Solution: Split in summation of several smaller crossprods of size nrow x 1,000.


## Version 0.9001
* Good practices in programming
    * https://google.github.io/styleguide/Rguide.xml

* Ncrossprod.R function

* roxygen2 format

* .Rd is similar to .md and LaTeX

* configure build options

* METADATE DESCRIPTION

* Authors field:
    * http://www.loc.gov/marc/relators/relaterm.html

* DATA:
    * Ideal: 1 object per RData, however, it is not a rule
    * It Should be small, if not, has to be justified. ONLY RDATA!
    * Other types in inst/extdata (later)

## Version 0.9002
* Enhancing functions
    * Open Ntcrossprod.R

* Stop messages
    * avoiding problems/bugs

* S3method
    * generic R function (plot, summary, print)

* DESCRIPTION
    * Imports vs Depends vs Suggests

* NAMESPACES
    * import vs importFrom vs exportPattern
    * use :: to avoid problems!

* Environments

* Vignettes

## MISC
* inst/CITATION
* Compiled code: src/
* Installed files: inst/
* inst/extdata
* inst/java
* inst/stan

```{r}
system.file(package = "Ntcrossprod")
system(paste0("bash ",system.file(package = "Ntcrossprod"), "/shell_script/hello.sh"))
```


## onemap example
* www.github.com/augusto-garcia/onemap
* NAMESPACE
* DESCRIPTION

## CRAN
* Self-contained
    * Changing global options, objetcs, etc
* Check 0 errors | 0 warning  | 0 notes in all OSs
* It does not messed globalenv up -> precise NAMESPACE
* Stable

## Your personal code is slow? Checklist
* Can you use another machine? Why not?
* Find the problem using native benchmark (`htop?`)
* Is it a memory problem? If personal code:
    * Put gc() inside it (if it is one time routine)
    * Avoid apply() family, use loop!
    * Avoid unecessary objects
    * If big data, use big data strategies (e.g. split the data, package `data.table`, etc.)
    * If is a matrix operation, problem there is an easier way to do it: http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/3274/pdf/imm3274.pdf

* It is not a memory problem, it is just taking too long!
    * Abuse the apply() family
    * If several objects transformations, use pipes from `dplyr` package
    * If big data, use big data strategies (e.g. split the data, package `data.table`, etc.). https://www.rstudio.com/resources/webinars/working-with-big-data-in-r/
    * Is there a way to vetorize your loop? hint: apply family, linear algebra
    * Is there a way to "matricilize" your vetorized loop? hint: apply family, linear algebra
    * Is there a way to n-delize your (n-1)-delize loop?
    * When possible use numeric, if not, use factors, only in last option, characters. To do it, you can use index variables, do everything based on the numeric index (which, match, etc).
    * `crossprod` family is faster than `%*%`
    * `(A %*% B) %*% C` is faster than `A %&% B %*% C`

* It is still taking too long:
    * It is time to carrefully benchmark it: http://adv-r.had.co.nz/Profiling.html
    * Find the problem and attack with one of the above strategies
    * If does not work, write in lower-level language: http://adv-r.had.co.nz/Rcpp.html
