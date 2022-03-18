# Questo è il primo script che useremo a lezione

# install.packages("   ") per installare il pacchetto e library per richiamarlo 
library(raster)

# R carica i dati raster come datui temporanei e se cambiamo il computer non abbiamo più i dati, quindi serve ricaricarlo ogni volta.
# dobbiamo settare la cartella di lavoro (work directory) inserendo il percorso della cartella
setwd("C:/Users/natasha/Desktop/TELERILEVAMENTO/1esercitazione/lab") # colleghiamo così la cartella di lavoro esterna ad R

# per importare il blocco di dati utilizziamo la funzione del pacchetto raster
# questa funzione crea un oggetto unico con tutte le informazioni delle varie bande
l2011 <- brick("p224r63_2011.grd")

# visualizziamo l'immagine caricata; le righe e le colonne (x e y) sono già contenute all'interno del file immagine
plot(l2011)

# creiamo una nuova palette (dal nero al grigio chiaro) utilizzando la funzione colorRampPalette 
cl <- colorRampPalette(c("black", "grey", "light grey"))(100) #100=numero di colori possibili
plot(l2011, col=cl)

# Bande del Landsat:
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino (NIR)

# Plottiamo soltanto la banda del blu --> possiamo farlo in due modi: conoscere il nome della banda (B1_sre) 
# oppure se la banda del blu è il primo elemento allora estraiamo questo
# plot(l2011$B1_sre) #oppure
# plot(l2011[[1]])
bl <- colorRampPalette(c("darkblue", "cornflowerblue", "deepskyblue", "cadetblue1"))(100) #creiamo una palette diversa sui toni del blu
plot(l2011$B1_sre, col=bl)
# Esportare il plot come pdf; è un formato favoloso. Si perdono informazioni di georeferenziazione
pdf("banda_blu.pdf")
plot(l2011$B1_sre, col=bl)
dev.off()
# Esportare il plot come png. Si perdono informazioni di georeferenziazione
png("banda_blu.png")
plot(l2011$B1_sre, col=bl)
dev.off()
# writeRaster è la funzione per esportare l'immagine = intero dataset -> writeRaster("  .tif")

# Plottiamo la banda del blu e del verde insieme (blu a sinistra e verde a destra)
vr = colorRampPalette(c("darkgreen", "chartreuse4", "chartreuse", "darkolivegreen1"))(100) #creiamo una palette diversa sui toni del verde
#  esporta multiframe plot 
pdf("banda_blu_verde.pdf")
par(mfrow=c(1,2)) # per plottare insieme due bande (1 riga e 2 colonne)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

# esercizio: vogliamo fare un plot multiframe con il blu sopra e il verde sotto
pdf("banda_blu_verde.pdf")
par(mfrow=c(2,1)) # per plottare insieme due bande (2 righe e 1 colonna)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

# Plottiamo 4 bande insieme
rd <- colorRampPalette(c("darkred", "brown3", "brown1", "bisque1"))(100) #creiamo una palette diversa sui toni del rosso
nir <- colorRampPalette(c("darkorange", "darkgoldenrod1", "azure1"))(100) #creiamo una palette diversa sui toni dell'arancione per il NIR
pdf("banda_blu_verde_rosso_nir.pdf")
par(mfrow=c(2,2)) # per plottare insieme 4 bande (2 righe e 1 colonna)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
plot(l2011$B3_sre, col=rd)
plot(l2011$B4_sre, col=vr)
dev.off()






























