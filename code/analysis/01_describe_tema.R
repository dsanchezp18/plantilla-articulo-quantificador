# ============================================================
# Describir [COMPLETAR: tema]
# Author: [COMPLETAR]
# Purpose: Calcular las cifras del artículo, exportar sus tablas y
#   figuras, y copiar las figuras numeradas a article/images.
# Inputs:  data/final/base_analysis.rds
# Outputs: outputs/tables/tema.csv, outputs/graphs/tema.png,
#   outputs/graphs/tema.pdf, article/images/grafico1.png
# ============================================================

# 0. Setup ----

library(dplyr)
library(ggplot2)
library(purrr)
library(readr)
library(scales)

source("code/functions/theme_quantificador.R", encoding = "UTF-8")

final_file <- "data/final/base_analysis.rds"
tables_path <- "outputs/tables"
graphs_path <- "outputs/graphs"
images_path <- "article/images"

dir.create(tables_path, recursive = TRUE, showWarnings = FALSE)
dir.create(graphs_path, recursive = TRUE, showWarnings = FALSE)
dir.create(images_path, recursive = TRUE, showWarnings = FALSE)

# El artículo numera las figuras según el orden del texto; este vector
# mapea cada figura del análisis a su nombre en article/images.

article_figures <- c("tema" = "grafico1")

# 1. Read inputs ----

analysis_data <- readRDS(final_file)

# 2. Calculate estimates ----

# Si es encuesta, declara el diseño con srvyr y usa survey_mean(); conserva
# el error estándar en la tabla.

summary_table <- analysis_data |>
  summarise(
    total = n(),
    .by = [COMPLETAR]
  )

# 3. Check results ----

if (any(!is.finite(summary_table$total))) {
  stop("Hay valores no finitos en la columna total.", call. = FALSE)
}

# 4. Build figures ----

caption_text <- wrap_caption_house(
  paste(
    "Fuente: [COMPLETAR: institución, base y periodo].",
    "Elaboración: [COMPLETAR: autor] para El Quantificador de",
    "Laboratorio LIDE.",
    "Nota: [COMPLETAR]."
  )
)

figure_tema <- ggplot(summary_table, aes(x = [COMPLETAR], y = total)) +
  geom_col(fill = "#1f4e79") +
  scale_y_continuous(labels = label_number_intl()) +
  labs(
    title = wrap_title_house("[COMPLETAR: título sin punto final]"),
    subtitle = wrap_subtitle_house("[COMPLETAR: subtítulo]"),
    caption = caption_text,
    x = NULL,
    y = NULL
  ) +
  theme_quantificador()

figure_tema_logo <- add_logo(figure_tema)

# 5. Write outputs ----

write_csv(summary_table, file.path(tables_path, "tema.csv"))

ggsave(
  file.path(graphs_path, "tema.png"),
  plot = figure_tema_logo,
  width = 4,
  height = 5,
  units = "in",
  dpi = 300,
  device = ragg::agg_png
)

ggsave(
  file.path(graphs_path, "tema.pdf"),
  plot = figure_tema_logo,
  width = 4,
  height = 5,
  units = "in"
)

walk2(
  names(article_figures),
  article_figures,
  \(figure_name, article_name) {
    file.copy(
      file.path(graphs_path, paste0(figure_name, ".png")),
      file.path(images_path, paste0(article_name, ".png")),
      overwrite = TRUE
    )
  }
)

message("Tablas y figuras escritas en outputs/ y article/images/")
