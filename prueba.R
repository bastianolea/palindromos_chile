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


palindromo <- function(texto) {
  inverso <- texto |> 
    tolower() |> 
    strsplit("") |>
    unlist() |> 
    rev() |> 
    paste(collapse = "")
  
  comparar <- all(tolower(texto) == inverso)
  
  return(comparar)
}
