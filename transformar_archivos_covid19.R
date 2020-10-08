#-------------------- Paquetes --------------------

library(dplyr)
library(tidyr)
library(sf)

#--------------- Archivos de datos ----------------

# COVID19
archivo_general_pais <- 'https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/covid19/ministerio-salud/10_07_CSV_GENERAL.csv'
archivo_positivos_cantones <- 'https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/covid19/ministerio-salud/10_07_CSV_POSITIVOS.csv'
archivo_activos_cantones <- 'https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/covid19/ministerio-salud/10_07_CSV_ACTIVOS.csv'
archivo_recuperados_cantones <- 'https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/covid19/ministerio-salud/10_07_CSV_RECUP.csv'
archivo_fallecidos_cantones <- 'https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/covid19/ministerio-salud/10_07_CSV_FALLECIDOS.csv'

# DIVISÓN POLÍTICA
# Dirección base del servicio WFS
url_base_wfs <- "http://geos.snitcr.go.cr/be/IGN_5/wfs?"
# Solicitud de la capa WFS:
solicitud_wfs <- 
  "request=GetFeature&service=WFS&version=2.0.0&typeName=IGN_5:limitecantonal_5k&outputFormat=application/json"

#--------------- Otros parámetros -----------------
# Separador para lectura de datos CSV
caracter_separador <- ','

#---------------------- Datos ---------------------

# GENERAL

# Objeto sf de cantones
# Carga desde un archivo GeoJSON simplificado
sf_cantones <- st_read('https://raw.githubusercontent.com/tpb708-programacionsig-2020/datos/main/delimitacion-territorial-administrativa/cr/ign/cr_limite_cantonal_ign_wgs84.geojson')

# Data frame de datos generales por país
df_general_pais <- read.csv(archivo_general_pais, sep = caracter_separador)
df_general_pais$FECHA <- as.Date(df_general_pais$FECHA, "%d/%m/%Y")

# Data frame de datos generales por país en la última fecha
df_general_pais_ultima_fecha <- 
  df_general_pais %>%
  filter(FECHA == max(FECHA, na.rm = TRUE))

# CASOS POSITIVOS

# Data frame de casos positivos por cantón
df_positivos_cantones_ancho <- read.csv(archivo_positivos_cantones, sep = caracter_separador)
df_positivos_cantones <-
  df_positivos_cantones_ancho %>%
  pivot_longer(cols = c(-cod_provin, -provincia, -cod_canton, -canton), names_to = "fecha", values_to = "positivos")
df_positivos_cantones$fecha <- as.Date(df_positivos_cantones$fecha, "X%d.%m.%Y")

# Data frame de casos positivos por cantón en la última fecha
df_positivos_cantones_ultima_fecha <- 
  df_positivos_cantones %>%
  filter(fecha == max(fecha, na.rm = TRUE)) %>%
  select(cod_canton, positivos)

# Escritura de CSV
write.csv(x=df_positivos_cantones_ultima_fecha, file="C:/Users/mfvargas/10_07_CSV_POSITIVOS_ULTIMA_FECHA.csv")

# CASOS ACTIVOS

# Data frame de casos activos por cantón
df_activos_cantones_ancho <- read.csv(archivo_activos_cantones, sep = caracter_separador)
df_activos_cantones <-
  df_activos_cantones_ancho %>%
  pivot_longer(cols = c(-cod_provin, -provincia, -cod_canton, -canton), names_to = "fecha", values_to = "activos")
df_activos_cantones$fecha <- as.Date(df_activos_cantones$fecha, "X%d.%m.%Y")

# Data frame de casos activos por cantón en la última fecha
df_activos_cantones_ultima_fecha <- 
  df_activos_cantones %>%
  filter(fecha == max(fecha, na.rm = TRUE)) %>%
  select(cod_canton, activos)

# Escritura de CSV
write.csv(x=df_activos_cantones_ultima_fecha, file="C:/Users/mfvargas/10_07_CSV_ACTIVOS_ULTIMA_FECHA.csv")

# CASOS RECUPERADOS

# Data frame de casos recuperados por cantón
df_recuperados_cantones_ancho <- read.csv(archivo_recuperados_cantones, sep = caracter_separador)
df_recuperados_cantones <-
  df_recuperados_cantones_ancho %>%
  pivot_longer(cols = c(-cod_provin, -provincia, -cod_canton, -canton), names_to = "fecha", values_to = "recuperados")
df_recuperados_cantones$fecha <- as.Date(df_recuperados_cantones$fecha, "X%d.%m.%Y")

# Data frame de casos recuperados por cantón en la última fecha
df_recuperados_cantones_ultima_fecha <- 
  df_recuperados_cantones %>%
  filter(fecha == max(fecha, na.rm = TRUE)) %>%
  select(cod_canton, recuperados)

# Escritura de CSV
write.csv(x=df_recuperados_cantones_ultima_fecha, file="C:/Users/mfvargas/10_07_CSV_RECUPERADOS_ULTIMA_FECHA.csv")

# CASOS FALLECIDOS

# Data frame de casos fallecidos por cantón
df_fallecidos_cantones_ancho <- read.csv(archivo_fallecidos_cantones, sep = caracter_separador)
df_fallecidos_cantones <-
  df_fallecidos_cantones_ancho %>%
  pivot_longer(cols = c(-cod_provin, -provincia, -cod_canton, -canton), names_to = "fecha", values_to = "fallecidos")
df_fallecidos_cantones$fecha <- as.Date(df_fallecidos_cantones$fecha, "X%d.%m.%Y")

# Data frame de casos fallecidos por cantón en la última fecha
df_fallecidos_cantones_ultima_fecha <- 
  df_fallecidos_cantones %>%
  filter(fecha == max(fecha, na.rm = TRUE)) %>%
  select(cod_canton, fallecidos)

# Escritura de CSV
write.csv(x=df_fallecidos_cantones_ultima_fecha, file="C:/Users/mfvargas/10_07_CSV_FALLECIDOS_ULTIMA_FECHA.csv")

# CANTONES

# Recuperación de los datos en un data frame
sf_cantones_crtm05 <- st_read(paste0(url_base_wfs, solicitud_wfs))

# Reproyección
sf_cantones <- st_transform(sf_cantones_crtm05, 4326)

# Escritura de GeoJSON
st_write(obj = sf_cantones, dsn = "C:/Users/mfvargas/cr_cantones_wgs84.geojson")
