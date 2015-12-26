install.packages("htmlwidgets")
install.packages("devtools")

devtools::create("rasterWidget")               
setwd("rasterWidget")                          
htmlwidgets::scaffoldWidget("rasterWidget")    

# execute again after changes in rasterWidget code
devtools::install()  
library(rasterWidget)
rasterWidget(meuseRaster, 200, 200)
