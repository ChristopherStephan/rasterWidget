library(rasterWidget)
library(raster)

rasterWidget("", 100, 100)

meuseFile <- system.file("external/test.grd", package="raster")
meuseRaster <- raster(meuseFile)
plot(meuseRaster)

values(meuseRaster)

rasterWidget(meuseRaster)

