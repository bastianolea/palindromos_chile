library(gt)

source("funciones.R")
source("localidades.R")


localidades_palindromo_tabla <- localidades |>
  st_drop_geometry() |>
  mutate(palindromo = palindromo(nombre_localidad)) |>
  filter(palindromo) |>
  distinct(nombre_comuna, nombre_localidad, nombre_region, .keep_all = TRUE)

color_fondo <- "#FFFDF2"
color_texto <- "#584837"

localidades_palindromo_tabla |>
  arrange(codigo_region) |>
  mutate(nombre_region = str_replace(nombre_region, "De", "de")) |>
  mutate(
    nombre_region = recode_values(
      nombre_region,
      "Región del Libertador General Bernardo O'higgins" ~ "Región de O'Higgins",
      default = nombre_region
    )
  ) |>
  # Región Del Libertador General Bernardo O'higgins
  select(nombre_region, nombre_comuna, nombre_localidad) |>
  gt() |>
  opt_table_font(font = "Manrope") |>
  tab_options(
    table.background.color = color_fondo,
    table.font.color = color_texto,
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden",
    # table_body.hlines.style = "hidden",
    # column_labels.border.bottom.style = "hidden"
  ) |>
  tab_style(
    style = cell_borders(
      sides = "bottom",
      color = "#584837",
      weight = px(2),
      style = "solid"
    ),
    locations = cells_column_labels()
  ) |>
  tab_style(
    style = cell_borders(
      sides = "bottom",
      color = "#EEE9CE",
      weight = px(1),
      style = "solid"
    ),
    locations = cells_body()
  ) |>
  tab_style(
    style = cell_text(weight = "bold"),
    locations = list(
      cells_column_labels(),
      cells_body(columns = nombre_localidad)
    )
  ) |>
  cols_label(
    nombre_region ~ "Región",
    nombre_comuna ~ "Comuna",
    nombre_localidad ~ "Localidad"
  ) |>
  tab_style(
    style = css(padding.left = "20px", padding.right = "20px"),
    locations = list(cells_body(), cells_column_labels())
  ) |>
  # print() |>
  gtsave("tabla.png", )
