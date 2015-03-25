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
    ,src = paste0("data:image/png;base64,",base64enc::base64encode(tf))
  )
)
```
