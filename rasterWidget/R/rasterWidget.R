#' View raster objects interactively
#' 
#' @description
#' this function produces an interactive view of the specified
#' raster object to inspect its cell values when hovering over them.
#'
#' @import htmlwidgets
#' @import raster
#' @import classInt
#' @importFrom stats na.omit
#' 
#' @param raster a \code{Raster*} or \code{Spatial*} object.
#' @param width width of the widget in px
#' @param height height of the widget in px
#' @param nclass number of classes required 
#' @param style chosen style: one of "fixed", "sd", "equal", "pretty", "quantile", "kmeans", "hclust", "bclust", "fisher", or "jenks"
#' @param colors a character vector for color coding the class intervals
#' @param colNA character for the color of NA values
#' 
#' @export
rasterWidget <- function(raster, width = 400, height = 400, nclass, style="fisher", colors, colNA="gray") {

  # class Intervals
  rasterValues = values(raster)
  classIntervals = classIntervals(na.omit(rasterValues), n=nclass, style=style)

  # forward options using data
  data = list(
    width = width,
    height = height,
    dimension = dim(raster),
    ncell = ncell(raster),
    nrow = nrow(raster),
    ncol = ncol(raster),
    resolution = res(raster),
    xres = xres(raster),
    yres = yres(raster),
    values = rasterValues,
    classBreaks = classIntervals$brks,
    colors = colors,
    colNA = colNA
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rasterWidget',
    data,
    width = width,
    height = height,
    package = 'rasterWidget'
  )
}

#' Widget output function for use in Shiny
#' 
#' @description Widget output function for use in Shiny
#' 
#' @param outputId outputId
#' @param width width in percent
#' @param height height in px
#' @export
rasterWidgetOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'rasterWidget', width, height, package = 'rasterWidget')
}

#' Widget render function for use in Shiny
#'
#' @description Widget render function for use in Shiny
#'
#' @param expr expr
#' @param env env
#' @param quoted quoted
#' @export
renderRasterWidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, rasterWidgetOutput, env, quoted = TRUE)
}
