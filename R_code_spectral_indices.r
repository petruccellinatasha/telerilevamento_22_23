2°esercitazione

library(raster)
library(RStoolbox)
library(rasterdiv)

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

# Stima NDVI: Normalized Difference Vegetation Index
# Range DVI (8 bit): -255 a 255     Range DVI(16 bit): -65535 a 65535
# Range NDVI (8 bit): -1 a 1        Range NDVI(16 bit): -1 a 1 

NDVI_1992 <- (l1992$defor1_.1 - l1992$defor1_.2)/(l1992$defor1_.1 + l1992$defor1_.2)
NDVI_2006 <- (l2006$defor2_.1 - l2006$defor2_.2)/(l2006$defor2_.1 + l2006$defor2_.2)

# Multiframe con il plot RGB e il NDVI 
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(NDVI_1992, col=cl)

par(mfrow=c(2,1))
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
plot(NDVI_2006, col=cl)

# Multiframe con NDVI dei diversi anni
par(mfrow=c(2,1))
plot(NDVI_1992, col=cl)
plot(NDVI_2006, col=cl)

# Utilizzo della libreria RStoolBox: SpectralIndices = calcola tutti i possibili indici
si1992 <- spectralIndices(l1992, green=3, red=, nir=1)
plot(si1992, col=cl)

si2006 <- spectralIndices(l2006, green=3, red=, nir=1)
plot(si2006, col=cl)

# utilizzo della libreria Rasterdiv: stima copernicus NDVI
plot(copNDVI)










