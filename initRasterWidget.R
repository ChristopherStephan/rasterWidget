install.packages("htmlwidgets")
install.packages("devtools")

devtools::create("rasterWidget")               
setwd("/home/christopher/Documents/git/rasterWidget/rasterWidget")                          
htmlwidgets::scaffoldWidget("rasterWidget")    

# execute again after changes in rasterWidget code
devtools::install()  
library(rasterWidget)
rasterWidget(meuseRaster)
