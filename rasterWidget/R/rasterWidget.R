#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rasterWidget <- function(raster, width = NULL, height = NULL) {

  # forward options using x
   x = list(
     dimension = dim(raster),
     ncell = ncell(raster),
     resolution = res(raster),
     values = values(raster)
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
