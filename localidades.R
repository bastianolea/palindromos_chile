library(readxl)
library(dplyr)
library(janitor)
library(stringr)

# localidades <- read_xlsx("datos/LAC_2021_CENSO2017.xlsx")

library(sf)

sf_use_s2(FALSE)

localidades_mapa <- read_sf("datos/GDB/ACTUALIZACION.gdb/")

localidades_mapa |>
  clean_names() |>
  glimpse()

localidades_puntos <- localidades_mapa |>
  mutate(punto = st_centroid(Shape)) |>
  select(-Shape)

localidades <- localidades_puntos |>
  clean_names() |>
  select(
    codigo_region = reg_cod,
    nombre_region = reg_nom,
    codigo_comuna = cut,
    nombre_comuna = com_nom,
    nombre_localidad = nombre,
    habitantes,
    punto
  ) |>
  distinct() |>
  mutate(
    nombre_localidad = str_to_title(nombre_localidad),
    nombre_comuna = str_to_title(nombre_comuna),
    nombre_region = str_to_title(nombre_region)
  ) |>
  mutate(
    codigo_comuna = as.numeric(codigo_comuna),
    codigo_region = as.numeric(codigo_region)
  )

localidades |>
  filter(codigo_region == 13) |>
  count(nombre_comuna) |>
  print(n = Inf)

localidades |>
  filter(nombre_comuna == "San Joaquín")
