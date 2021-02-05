#### Postwork 6 ####

#DIRECTORIO
setwd("C:/Users/Dell/Documents/GitHub/BEDUpostworkRicardo/Postwork/Sesion6")
setwd("C:/Users/Dell/Documents/GitHub/Programacion-con-R-Santander/Sesion-06/Postwork")

# Carga de datos
data <- read.csv("match.data.csv", header = TRUE)
str(data)

# LIBRERIAS
library(dplyr)
library(ggplot2)

# 1. Agrega una nueva columna sumagoles que contenga la suma de goles por partido. ####
data$sumagoles <- data$FTHG + data$FTAG

# 2. Obt?n el promedio por mes de la suma de goles.####
data <- mutate(data, date = as.Date(Date, "%Y-%m-%d"))
data <- mutate(data, Ym = format(Date, "%Y-%m"))
(sumag_mes <- data %>% group_by(Ym) %>% summarise(goles = mean(sumagoles)) )

# 3. Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019. ####
pmes_sg <- ts(sumag_mes$goles, start = c(1, 1), end = c(10, 6), frequency = 10)

# 4. Grafica la serie de tiempo. ####
ts.plot(pmes_sg, col = 4, ylim = c(0, 5))
abline(h = mean(pmes_sg), lwd = 1, col = 4, lty = 2)
legend(x = 6, y = 5,
       legend = "promedio por mes de la suma de goles",
       col = 4, lty = c(1, 1))
