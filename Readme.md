### intense-images htmlwidget

**This is experimental and pre-alpha**, but if you do everything just right you might get some worthwhile output.


```r
# devtools::install_github("timelyportfolio/imageR")

library(imageR)

tf <- tempfile()
png( file = tf, height = 400, width = 600 )
plot(1:50)
dev.off()

imageR(base64::img(tf))
```

```r
library(shiny)
library(htmltools)
library(lattice)
library(imageR)

tf <- tempfile()
tf2 <- tempfile()
png( file = tf, height = 600, width = 600 )
  image(volcano)
dev.off()

png( file = tf2, height = 610, width = 870)
  ## volcano  ## 87 x 61 matrix
wireframe(volcano, shade = TRUE,
          aspect = c(61/87, 0.4),
          light.source = c(10,0,10))
dev.off()

html_print(fluidPage(fluidRow(
  column(width = 6,  imageR(base64::img(tf)))
  ,column(width = 6,  imageR(base64::img(tf2)))
)))
```

```r
tf <- tempfile()
png( file = tf, height = 600, width = 1400 )
plot(1:50)
dev.off()

imageR(
  tags$img(
    style = "height:200px"
    ,"data-title" = "sample intense plot"
    ,"data-caption" = "imageR at work"
    ,src = paste0("data:image/png;base64,",base64enc::base64encode(tf))
  )
)
```

```r
library(htmltools)
library(imageR)
library(ggplot2)

tf <- tempfile()

png( file = tf, height = 1400, width = 1400 )
  ggplot(diamonds, aes(carat, price)) + geom_hex()
dev.off()

imageR(
  tags$div(
    tags$h1("does this work? click and see")
    ,"data-image" = paste0("data:image/png;base64,",base64enc::base64encode(tf))
  )
)
```

```r
library(htmltools)
library(curl)
library(navr)
library(sortableR)
library(imageR)

n1 <- navr(
  selector = "#sortableR-toolbar"
  ,taglist = tagList(
    tags$ul(id = "sort-navr"
      ,style="line-height:120px; text-align:center; vertical-align:middle;"
      ,tags$li(
        style="border: solid 0.1em white;border-radius:100%;line-height:inherit;width:130px;height:130px;"
        , class="fa fa-binoculars fa-4x"
        #  attribution everywhere Creative Commons Flickr
        #  awesome picture by https://www.flickr.com/photos/12859033@N00/2288766662/
        , "data-image" = paste0(
          "data:image/jpg;base64,"
          ,base64enc::base64encode(
            curl("https://farm4.staticflickr.com/3133/2288766662_c40c168b76_o.jpg","rb")
          )
        )
        , "data-title" = "Binoculars, a working collection"
        , "data-caption" = "awesome picture courtesy Flickr Creative Commons
            <a href = 'https://www.flickr.com/photos/12859033@N00/2288766662/'>jlcwalker</a>"
      )        
      ,tags$li(
        style="border: solid 0.1em white;border-radius:100%;line-height:inherit;width:130px;height:130px;"
        , class="fa fa-camera fa-4x"
        #  attribution everywhere Creative Commons Flickr
        #  awesome picture by https://www.flickr.com/photos/s58y/5607717791
        , "data-image" = paste0(
          "data:image/jpg;base64,"
          ,base64enc::base64encode(
            curl("https://farm6.staticflickr.com/5309/5607717791_b030229247_o.jpg","rb")
          )
        )
        , "data-title" = "Leica IIIc converted to IIIf BD ST"
        , "data-caption" = "awesome picture courtesy Flickr Creative Commons
            <a href = 'https://www.flickr.com/photos/s58y/5607717791'>s58y</a>"
      )
    )
  )
)

html_print(tagList(
  tags$div(
    id = "sortableR-toolbar"
    ,style="width:300px;border: dashed 0.2em lightgray; float:left;"
    ,tags$h3("sortableR Icons for Intense Images")
    ,"These icons drag and drop. Click on them for an"
    ,tags$strong("intense")
    ,"result."
  )
  ,add_font_awesome(n1)
  ,sortableR("sort-navr")
  ,imageR( selector = "#sort-navr li" )
))

```
