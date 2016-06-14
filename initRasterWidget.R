install.packages("htmlwidgets")
install.packages("devtools")
install.packages("raster")
install.packages("classInt")

setwd("/Users/christopherstephan/Documents/git/rasterWidget/rasterWidget")

# execute again after changes in rasterWidget code
devtools::install()
library(rasterWidget)
rasterWidget(meuseRaster)
