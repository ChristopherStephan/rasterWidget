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
rasterWidget(meuseRaster)
