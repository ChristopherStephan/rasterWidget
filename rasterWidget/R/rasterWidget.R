#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
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
#' @export
rasterWidgetOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'rasterWidget', width, height, package = 'rasterWidget')
}

#' Widget render function for use in Shiny
#'
#' @export
renderRasterWidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, rasterWidgetOutput, env, quoted = TRUE)
}
