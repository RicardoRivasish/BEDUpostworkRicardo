library(dplyr)

#1.-Importa los datos de soccer de la temporada 2019/2020 
#de la primera división de la liga española a R

setwd("C:/Users/Dell/Desktop/BEDU/postwork/Sesion1")
getwd()
df <- read.csv("SP1.csv")
df<-data.frame(df)
typeof(df)
class(df)
df

#2.-Del data frame que resulta de importar los datos a R, extrae
#las columnas que contienen los números de goles anotados por 
#los equipos que jugaron en casa (FTHG) y los goles anotados 
#por los equipos que jugaron como visitante (FTAG)

goles<-df %>% select(FTHG, FTAG)
n<-length(goles[,1])
n

#3.-Consulta cómo funciona la función table en R al ejecutar 
#en la consola ?table
?table

#Probabilidad marginal equipo en casa
marginal.casa <- table(goles$FTHG) #tabla con frecuencia de goles
marginal.casa = as.data.frame(marginal.casa) #se cambia formato a dataframe
names(marginal.casa)[1] = 'Goles' #se renombra la primer columna
marginal.casa$marginal <- frecuencia.casa$Freq / n
marginal.casa

#Probabilidad marginal equipo visitante
frecuencia.visitante <- table(goles$FTAG) #tabla con frecuencia de goles
frecuencia.visitante = as.data.frame(frecuencia.visitante) #se cambia formato a dataframe
names(frecuencia.visitante)[1] = 'Goles' #se renombra la primer columna
frecuencia.visitante$marginal.visitante <- frecuencia.visitante$Freq / n
frecuencia.visitante

#Probabilidad conjunta
goles$conjuntas <- paste(goles$FTHG,goles$FTAG)#Se crea una nueva columna con los goles conjuntos
goles
probabilidad.conjunta <- table(goles$conjuntas) #tabla con frecuencia de goles
probabilidad.conjunta = as.data.frame(probabilidad.conjunta) #se cambia formato a dataframe
names(probabilidad.conjunta)[1] = 'resultado.partido' #se renombra la primer columna
probabilidad.conjunta$conjunta <- probabilidad.conjunta$Freq / n
probabilidad.conjunta
