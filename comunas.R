library(readxl)
library(dplyr)
library(stringr)
library(janitor)

datos <- read_xls("datos/CUT_2018_v04.xls")

comunas <- datos |>
  clean_names() |>
  select(codigo_comuna = codigo_comuna_2018, nombre_comuna) |>
  mutate(codigo_comuna = as.numeric(codigo_comuna))


comunas |>
  mutate(palindromo = palindromo(nombre_comuna)) |>
  filter(palindromo)
