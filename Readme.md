### intense-images htmlwidget

**This is experimental and pre-alpha**, but if you do everything just right you might get some worthwhile output.


```r
# devtools::install_github("timelyportfolio/imageR")

library(imageR)

tf <- tempfile()
png( file = tf, height = 600, width = 600 )
plot(1:50)
dev.off()

imageR(base64::img(tf))
```
