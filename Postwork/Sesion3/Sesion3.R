library(dplyr)
library(ggplot2)
#1.- Con el último data frame obtenido en el postwork de
#la sesión 2, elabora tablas de frecuencias relativas para 
#estimar las siguientes probabilidades:
#La probabilidad (marginal) de que el equipo que juega en
#casa anote x goles (x=0,1,2,)
setwd("C:/Users/Dell/Documents/GitHub/BEDUpostworkRicardo/Postwork/Sesion2/")
df <- read.csv(file = 'Sesion2.csv')#Se lee data frame
#Aquí se calcula la marginal del equipo de casa
goles<-df %>% select(FTHG, FTAG)#Se crea dataframe con goles de casa y visitantes
n<-length(goles[,1])#Variable que nos dice el total de partidos
marginal.casa <- table(goles$FTHG) #tabla con frecuencia de goles
marginal.casa <- as.data.frame(marginal.casa) #se cambia formato a dataframe
names(marginal.casa)[1] = 'Goles' #se renombra la primer columna
marginal.casa$marginal <- marginal.casa$Freq / n #Se calcula la marginal 
marginal.casa


#La probabilidad (marginal) de que el equipo que juega como 
#visitante anote y goles (y=0,1,2,)
marginal.visitante <- table(goles$FTAG) #tabla con frecuencia de goles
marginal.visitante <- as.data.frame(marginal.visitante) #se cambia formato a dataframe
names(marginal.visitante)[1] <- 'Goles' #se renombra la primer columna
marginal.visitante$marginal <- marginal.visitante$Freq / n
marginal.visitante



#La probabilidad (conjunta) de que el equipo que juega en casa
#anote x goles y el equipo que juega como visitante anote y goles
#(x=0,1,2,, y=0,1,2,)
goles$conjuntas <- paste(goles$FTHG,goles$FTAG)#Se crea una nueva columna con los goles conjuntos
goles
probabilidad.conjunta <- table(goles$conjuntas) #tabla con frecuencia de goles
probabilidad.conjunta <- as.data.frame(probabilidad.conjunta) #se cambia formato a dataframe
names(probabilidad.conjunta)[1] <- 'resultado.partido' #se renombra la primer columna
probabilidad.conjunta$conjunta <- probabilidad.conjunta$Freq / n #Se calcula la conjunta
probabilidad.conjunta

#2.Realiza lo siguiente:
#Un gráfico de barras para las probabilidades marginales 
#estimadas del número de goles que anota el equipo de casa
ggplot(marginal.casa, aes(x = marginal, y = Freq)) + 
  geom_bar (stat="identity", position = "dodge") # Funciones del paquete ggplot2


#Un gráfico de barras para las probabilidades marginales
#estimadas del número de goles que anota el equipo visitante.
ggplot(marginal.visitante, aes(x = marginal, y = Freq)) + 
  geom_bar (stat="identity", position = "dodge") # Funciones del paquete ggplot2


#Un HeatMap para las probabilidades conjuntas estimadas de los 
#números de goles que anotan el equipo de casa y el equipo 
#visitante en un partido.

Conjunta<-goles%>%select(FTHG,FTAG)#Se redefine un dataframe con columnas de goles de casa y visitante
Conjunta<-as.data.frame.matrix(table(Conjunta))#Se aplica la funcion table y se convierte a dataframe
Conjunta <- Conjunta / n #Se divide entre número total de datos para obtener la matriz de probabilidad
Conjunta<-as.matrix(Conjunta)#Se guarda dataframe como matriz
heatmap(Conjunta)#Se grafica el heatmap


