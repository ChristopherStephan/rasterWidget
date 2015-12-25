install.packages("htmlwidgets")
install.packages("devtools")

devtools::create("rasterWidget")               
setwd("rasterWidget")                          
htmlwidgets::scaffoldWidget("rasterWidget")    
devtools::install()  

library(rasterWidget)
rasterWidget("hello, world")
