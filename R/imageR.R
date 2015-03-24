#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
imageR <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'imageR',
    x,
    width = width,
    height = height,
    package = 'imageR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
imageROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'imageR', width, height, package = 'imageR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderImageR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, imageROutput, env, quoted = TRUE)
}
