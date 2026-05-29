library(readxl)
library(dplyr)
library(stringr)

texto <- "hooh"

inverso <- texto |>
  tolower() |>
  strsplit("") |>
  unlist() |>
  rev() |>
  paste(collapse = "")

comparar <- all(texto == inverso)

ifelse(comparar, "Es un palíndromo", "No es un palíndromo")


# con función
localidades_palindromo <- localidades |>
  mutate(palindromo = palindromo(nombre_localidad))

localidades_palindromo |>
  filter(palindromo)
