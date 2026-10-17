# ============================================================
# Limpiar [COMPLETAR: base]
# Author: [COMPLETAR]
# Purpose: Leer [COMPLETAR] desde data/raw, estandarizar nombres y tipos,
#   filtrar el universo del artículo y guardar una base limpia.
#   [COMPLETAR: diseño muestral si es encuesta: pesos, estratos y PSU.]
# Inputs:  data/raw/[COMPLETAR]
# Outputs: data/intermediate/base_clean.rds, data/final/base_analysis.rds
# ============================================================

# 0. Setup ----

library(dplyr)
library(haven)
library(janitor)

raw_file <- "data/raw/[COMPLETAR].sav"
intermediate_file <- "data/intermediate/base_clean.rds"
final_file <- "data/final/base_analysis.rds"

analysis_years <- 2025
expected_rows <- 0

dir.create("data/intermediate", recursive = TRUE, showWarnings = FALSE)
dir.create("data/final", recursive = TRUE, showWarnings = FALSE)

# 1. Read inputs ----

if (!file.exists(raw_file)) {
  stop("Falta ", raw_file, ". Corre primero 00_download_fuente.R.", call. = FALSE)
}

# clean_names() va antes de cualquier otra transformación para trabajar
# siempre con nombres en snake_case.

raw_data <- read_sav(raw_file) |>
  clean_names()

# 2. Check inputs ----

if (nrow(raw_data) != expected_rows) {
  stop(
    raw_file, " tiene ", nrow(raw_data), " filas; se esperaban ",
    expected_rows, ".",
    call. = FALSE
  )
}

# 3. Prepare data ----

# Los códigos de no sabe y no responde se conservan como valores propios;
# se pasan a NA solo en el análisis que lo requiera.

clean_data <- raw_data |>
  filter(anio %in% analysis_years)

saveRDS(clean_data, intermediate_file)

# 4. Build analysis base ----

analysis_data <- clean_data |>
  select(everything())

# 5. Write outputs ----

saveRDS(analysis_data, final_file)

message("Base de análisis guardada en ", final_file)
