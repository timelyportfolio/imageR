#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
imageR <- function(img = NULL, selector = NULL, width = NULL, height = NULL) {

  if( inherits(img, "shiny.tag") ){
    img = as.character(img)
  }

  # forward options using x
  x = list(
    img = img
    ,selector = selector
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
