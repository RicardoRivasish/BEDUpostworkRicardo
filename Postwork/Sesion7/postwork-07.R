#postwork-07

#install.packages("mongolite")
library(mongolite)

### 1 ###
# Leyendo dataset
match <- read.csv("C:/Users/Dell/Documents/GitHub/Programacion-con-R-Santander/Sesion-07/Postwork/data.csv")

# Alojando dataset en mongodb
colection <- mongo(collection = "match", db = "match_games", url="mongodb+srv://BeduUser:<password>@beducluster.irh1j.mongodb.net/<dbname>?retryWrites=true&w=majority")
colection$insert(match)

#### 2 ###
# Realizando count para conocer numero de registros
colection$count()
colection$find()

### 3 ###
# Realizando consulta de goles que metio Real Madrid el 20 de diciembre de 2015
colection$find('{"date":"2015-12-20", "HomeTeam":"Real Madrid"}')
# Sin embargo, no hay partidos del anno 2015 en el dataset

### 4 ###
# cerrando conexion
rm(colection)
