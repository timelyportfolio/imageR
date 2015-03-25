#' Full screen pannable R plots for the web
#'
#' \code{intense} wraps a plot or HTML element with the
#' effect provided by \href{http://tholman.com/intense-images/}{\code{intense-images}}.
#'
#' @param img \code{string} of a img with src equal to
#'          url or a \code{base64} encoded image or a \code{tag}
#'          from \code{htmltools}.  Note, the \code{tag} does not need to be an \code{img}
#'          and also does not need to contain an image.  If using a \code{tag}, the attributes
#'          \code{"data-image"}, \code{"data-title"}, and \code{"data-caption"} should contain
#'          the information to render the intense-image as desired.
#' @param selector \code{string} of the css selector of the element for which
#'          you would like to apply intense-images.  The attributes
#'          \code{"data-image"}, \code{"data-title"}, and \code{"data-caption"}
#'          should contain the information to render the intense-image as desired.
#' @param width \code{integer} in px for the width of the \code{div} container.
#' @param height \code{integer} in px for the height of the  \code{div} container.
#'
#' @import htmlwidgets htmltools
#'
#' @export
intense <- function(img = NULL, selector = NULL, width = NULL, height = NULL) {

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
    name = 'intense',
    x,
    width = width,
    height = height,
    package = 'imageR'
  )
}


#' Widget output function for use in Shiny
#'
#' @export
intenseOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'intense', width, height, package = 'imageR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderImageR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, intenseOutput, env, quoted = TRUE)
}
