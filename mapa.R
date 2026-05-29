source("funciones.R")
source("localidades.R")
source("regiones.R")
source("limites.R")

localidades_palindromo <- localidades |>
  mutate(palindromo = palindromo(nombre_localidad)) |>
  filter(palindromo) |>
  distinct(nombre_comuna, nombre_localidad, .keep_all = TRUE)


localidades_palindromo

library(ggplot2)
library(ggrepel)

ggplot() +
  geom_sf(
    data = regiones,
    linewidth = 0,
    fill = "#e9edc9"
  ) +
  geom_sf(
    data = limites,
    color = "#CAD5A5"
  ) +
  geom_sf(
    data = localidades_palindromo |> filter(palindromo),
    aes(geometry = punto),
    color = "#FFFCEE",
    size = 4
  ) +
  ggrepel::geom_text_repel(
    data = localidades_palindromo |> filter(palindromo),
    aes(label = nombre_localidad, geometry = punto),
    stat = "sf_coordinates",
    family = "Manrope Bold",
    box.padding = 0.6,
    segment.alpha = 0.4,
    size = 4.2,
    color = "#584837"
  ) +
  geom_sf(
    data = localidades_palindromo |> filter(palindromo),
    aes(geometry = punto),
    color = "#D9A36E",
    size = 2.6,
    alpha = 0.8
  ) +
  # recortar Chile continental
  coord_sf(expand = FALSE, xlim = c(-79, -62), ylim = c(-56.2, -17.3)) +
  theme_minimal(
    base_size = 12,
    base_family = "Rubik",
    paper = "#FFFDF2",
    ink = "#d4a373"
  ) +
  theme(axis.title = element_blank())

ggsave("mapa.png")
