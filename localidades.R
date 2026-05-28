localidades <- read_xlsx("LAC_2021_CENSO2017.xlsx")

localidades |> 
  glimpse()

localidades <- localidades |> 
  clean_names() |> 
  select(codigo_comuna = cut, nombre_localidad = nombre) |> 
  distinct()

localidades |> 
  rowwise() |> 
  mutate(palindromo = palindromo(nombre_localidad)) |> 
  filter(palindromo)
