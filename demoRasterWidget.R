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

# debug
r = na.omit(values(meuseRaster))
classIntervals(r)
nclass.Sturges(r)
nclass.scott(r)
nclass.FD(r)
