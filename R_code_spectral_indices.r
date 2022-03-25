2°esercitazione

library(raster)
library(RStoolbox)

setwd("C:/Users/natasha/Desktop/TELERILEVAMENTO/2esercitazione") 

l1992 <- brick("defor1_.jpg")
plotRGB(l1992, r=1, g=2, b=3, stretch="lin") # la banda 1 = NIR, b2 = rosso, b3 = verde (di solito si montano in seguenza le bande seguendo lo spettro elettromagnetico)

l2006<- brick("defor2_.jpg")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin") 

# ESERCIZIO: Plot multiframe
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin") 
plotRGB(l2006, r=1, g=2, b=3, stretch="lin") 

# Stima DVI: Difference Vegetation Index
DVI_1992 <- l1992$defor1_.1 - l1992$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(DVI_1992, col=cl)

DVI_2006 <- l2006$defor2_.1 - l2006$defor2_.2
plot(DVI_2006, col=cl)
dev.off()

DVI_diff <- DVI_1992 - DVI_2006
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(DVI_diff, col=cld)
