library(rasterWidget)
library(raster)
library(classInt)
library(devtools)

meuseFile <- system.file("external/test.grd", package="raster")
meuseRaster <- raster(meuseFile)
plot(meuseRaster)

# execute again after changes in rasterWidget code
setwd("/Users/christopherstephan/Documents/git/rasterWidget/rasterWidget")
devtools::install()
library(rasterWidget)
rasterWidget(meuseRaster, nclass=5, style='fisher', colors=c('yellow', 'orange', 'darkorange', 'red', 'darkred'))
rasterWidget(meuseRaster, 500, 800, nclass=5, colors=c("yellow", "orange", "darkorange", "red", "darkred"))

rasterWidget(meuseRaster, nclass=15, style='fisher', colors=c("#FF0000", "#EC1200", "#DA2400", "#C83600", "#B64800", "#A35B00", "#916D00", "#7F7F00", "#6D9100", "#5BA300", "#48B600", "#36C800", "#24DA00", "#12EC00", "#00FF00"))

rasterWidget(meuseRaster)
rasterWidget(meuseRaster, nclass=7)

r <- raster()
r
rasterWidget(r, nclass=5, style='fisher', colors=c('yellow', 'orange', 'darkorange', 'red', 'darkred'))


# medium sized scene (300 x 300)
r1 <- raster(ncol=300, nrow=300)
r1[] <- rnorm(ncell(r1), 0, 50)
Sys.time()
# [1] "2016-07-17 20:54:10 CEST"
rasterWidget(r1, nclass=5, style="fisher", colors=c("yellow", "orange", "darkorange", "red", "darkred"))
Sys.time()
# [1] "2016-07-17 20:54:10 CEST"

#Large Landsat7 scene (593 x 653)
download.file(url = 'https://github.com/GeoScripting-WUR/IntroToRaster/raw/gh-pages/data/gewata.zip', destfile = 'gewata.zip', method = 'auto')
unzip('gewata.zip')
gewata <- raster('LE71700552001036SGS00_SR_Gewata_INT1U.tif')

Sys.time()
# [1] "2016-07-17 20:41:25 CEST"
rasterWidget(gewata, nclass=5, style="fisher", colors=c("yellow", "orange", "darkorange", "red", "darkred"))
Sys.time()
# [1] "2016-07-17 20:49:56 CEST"

# debug
r = na.omit(values(meuseRaster))
classIntervals(r)
nclass.Sturges(r)
nclass.scott(r)
nclass.FD(r)

# tests

