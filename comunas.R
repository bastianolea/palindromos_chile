library(readxl)
library(dplyr)
library(stringr)
library(janitor)

datos <- read_xls("CUT_2018_v04.xls")

comunas <- datos |> 
  clean_names() |> 
  select(codigo_comuna = codigo_comuna_2018, 
         nombre_comuna)

comunas |> 
  rowwise() |> 
  mutate(pal = palindromo(nombre_comuna)) |> 
  filter(pal)
