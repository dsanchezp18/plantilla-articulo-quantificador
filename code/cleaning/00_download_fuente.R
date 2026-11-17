# ============================================================
# Descargar [COMPLETAR: fuente] desde [COMPLETAR: institución]
# Author: [COMPLETAR]
# Purpose: Bajar los archivos oficiales de [COMPLETAR] a data/raw y
#   dejarlos sin modificar. Las descargas ya presentes no se repiten.
# Inputs:  URL oficiales listadas en documentation/fuentes.csv
# Outputs: data/raw/[COMPLETAR].zip y los archivos extraídos
# ============================================================

# 0. Setup ----

library(dplyr)
library(purrr)
library(readr)
library(stringr)

raw_path <- "data/raw"
download_timeout <- 600

dir.create(raw_path, recursive = TRUE, showWarnings = FALSE)

# El límite por defecto de 60 segundos corta archivos grandes y deja un ZIP
# incompleto que parece válido.

options(timeout = download_timeout)

# 1. Read inputs ----

sources <- read_csv("documentation/fuentes.csv", show_col_types = FALSE) |>
  filter(script == "00_download_fuente.R")

pending_downloads <- sources |>
  filter(!file.exists(downloaded_file))

# 2. Download files ----

walk2(
  pending_downloads$official_url,
  pending_downloads$downloaded_file,
  \(url, destination) download.file(url, destination, mode = "wb")
)

# 3. Check results ----

missing_files <- sources |>
  filter(!file.exists(downloaded_file))

if (nrow(missing_files) > 0) {
  stop(
    "No se descargaron: ",
    paste(missing_files$downloaded_file, collapse = ", "),
    call. = FALSE
  )
}

# 4. Extract archives ----

# Se conserva el ZIP original para evitar volver a descargarlo. Si la fuente
# no viene comprimida, borra este paso y library(stringr).

zip_files <- sources |>
  filter(str_ends(downloaded_file, ".zip")) |>
  pull(downloaded_file)

walk(zip_files, \(zip_file) unzip(zip_file, exdir = raw_path))

message("Descarga completa en ", raw_path)
