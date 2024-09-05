###paquetes###
library(quantmod)#descargar series financieras
library(dygraphs)#graficar series interactivas
###proceso###

# Descargar datos de los índices
getSymbols(c("^GSPC", "^IXIC"), src = "yahoo")

head(GSPC)
head(IXIC)

# Seleccionar solo las columnas de cierre ajustado
sp500 <- Cl(GSPC)
nasdaq <- Cl(IXIC)

# Combinar los datos en un solo dataframe
data <- merge(sp500, nasdaq)

# Renombrar las columnas
colnames(data) <- c("S&P 500", "NASDAQ")


# Graficar con dygraph y añadir un selector de rango
dygraph(data, main = "Comparación entre S&P 500 y NASDAQ") %>%
  dyRangeSelector()

