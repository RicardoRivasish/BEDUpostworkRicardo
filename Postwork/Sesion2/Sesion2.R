library(dplyr)
#1.Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 
#2019/2020 de la primera división de la liga española a R, los datos los 
#puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php
#Se define el ambiente de trabajo
getwd()
setwd("C:/Users/Dell/Documents/GitHub/BEDUpostworkRicardo/Postwork/Sesion2/data/")
#Se definen variables con urls
B1920 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
B1819 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
B1718 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"
#Se descargan los documentos
download.file(url = B1920, destfile = "B1920.csv", mode = "wb")
download.file(url = B1819, destfile = "B1819.csv", mode = "wb")
download.file(url = B1718, destfile = "B1718.csv", mode = "wb")
#Se importan datos como una lista a R
lista <- lapply(list.files(), read.csv)
lista[[1]]


#2.Obten una mejor idea de las características de los data frames
#al usar las funciones: str, head, View y summary
str(lista[[1]]); str(lista[[2]]); str(lista[[3]])
head(lista[[1]]); head(lista[[2]]); head(lista[[3]])
View(lista[[1]]); View(lista[[2]]); View(lista[[3]])
summary(lista[[1]]); summary(lista[[2]]); summary(lista[[3]])

#3.Con la función select del paquete dplyr selecciona únicamente 
#las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para
#cada uno de los data frames. (Hint: también puedes usar lapply).
lista<- lapply(lista, select, Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR) 


#4.Asegúrate de que los elementos de las columnas correspondientes 
#de los nuevos data frames sean del mismo tipo (Hint 1: usa as.Date
#y mutate para arreglar las fechas). Con ayuda de la función rbind 
#forma un único data frame que contenga las seis columnas mencionadas 
#en el punto 3 (Hint 2: la función do.call podría ser utilizada).
str(lista[[1]]); str(lista[[2]]); str(lista[[3]])
lista[[1]]$Date=as.Date(lista[[1]]$Date, "%d/%m/%y")
lista[[2]]$Date=as.Date(lista[[2]]$Date, "%d/%m/%y")
lista[[3]]$Date=as.Date(lista[[3]]$Date, "%d/%m/%y")
lista <- do.call(rbind, lista)
head(lista)
tail(lista)
dim(lista)
View(lista)
setwd("C:/Users/Dell/Documents/GitHub/BEDUpostworkRicardo/Postwork/Sesion2/")
write.csv(lista,"Sesion2.csv")