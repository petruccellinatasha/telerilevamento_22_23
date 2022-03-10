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
