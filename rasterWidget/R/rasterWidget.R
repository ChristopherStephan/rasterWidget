#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rasterWidget <- function(raster, width = 400, height = 400) {

  # class Intervals
  rasterValues = values(raster)
  classIntervals = classIntervals(na.omit(values), n=5, style="fisher")
  
  # forward options using x
   x = list(
     width = width,
     height = height,
     dimension = dim(raster),
     ncell = ncell(raster),
     resolution = res(raster),
     values = rasterValues,
     classBreaks = classIntervals$brks,
     colors = c("yellow", "organge", "red")
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rasterWidget',
    x,
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
