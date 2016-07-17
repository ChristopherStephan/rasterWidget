library(rasterWidget)
library(raster)
library(classInt)

meuseFile <- system.file("external/test.grd", package="raster")
meuseRaster <- raster(meuseFile)
plot(meuseRaster)
rasterWidget(meuseRaster)

# execute again after changes in rasterWidget code
devtools::install()
library(rasterWidget)
rasterWidget(meuseRaster, nclass=5, style="fisher", colors=c("yellow", "orange", "darkorange", "red", "darkred"))
rasterWidget(meuseRaster, 500, 800, 5)

# medium sized scene (300 x 300)
r1 <- raster(ncol=300, nrow=300)
r1[] <- rnorm(ncell(r1), 0, 50)
rasterWidget(r1, nclass=5, style="fisher", colors=c("yellow", "orange", "darkorange", "red", "darkred"))

#Large Landsat7 scene (593 x 653)
download.file(url = 'https://github.com/GeoScripting-WUR/IntroToRaster/raw/gh-pages/data/gewata.zip', destfile = 'gewata.zip', method = 'auto')
unzip('gewata.zip')
gewata <- raster('LE71700552001036SGS00_SR_Gewata_INT1U.tif')
rasterWidget(gewata, nclass=5, style="fisher", colors=c("yellow", "orange", "darkorange", "red", "darkred"))

# debug
r = na.omit(values(meuseRaster))
classIntervals(r)
nclass.Sturges(r)
nclass.scott(r)
nclass.FD(r)

# tests

