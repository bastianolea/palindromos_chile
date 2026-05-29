library(sf)
library(dplyr)

limites <- read_sf("datos/74_limites_dpa_2022/")

limites <- limites |> 
  filter(TIPO == "REGIONAL")
