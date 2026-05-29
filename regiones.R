library(sf)

regiones <- read_sf("datos/DPA_2023-2/REGIONES/")

regiones <- regiones |>
  rmapshaper::ms_simplify(keep = 0.1)

regiones
