# versión no vectorizada
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


# función vectoriazda
palindromo <- function(texto) {
  require(stringi)

  texto_minusc <- tolower(texto)
  texto_limpio <- chartr("áéíóú", "aeiou", texto_minusc)
  texto_invertido <- stri_reverse(texto_limpio)

  return(texto_limpio == texto_invertido)
}
