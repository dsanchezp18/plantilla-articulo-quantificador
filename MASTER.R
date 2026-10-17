# ============================================================
# Reproducir el artículo
# Author: [COMPLETAR]
# Purpose: Ejecutar en orden los scripts de descarga, limpieza y análisis
#   desde la raíz del repositorio. Ver el artículo es un paso aparte,
#   documentado en README.md.
# Inputs:  Los scripts de code/cleaning y code/analysis
# Outputs: data/raw, data/intermediate, data/final, outputs/ y
#   article/images
# ============================================================

# 0. Setup ----

library(purrr)

pipeline_scripts <- c(
  "code/cleaning/00_download_fuente.R",
  "code/cleaning/01_clean_base.R",
  "code/analysis/01_describe_tema.R"
)

# 1. Run the pipeline ----

# Cada script corre en su propio entorno para que los objetos no pasen de
# un paso a otro; un stop() en cualquier script detiene la corrida.

walk(
  pipeline_scripts,
  \(pipeline_script) {
    source(pipeline_script, local = new.env(), encoding = "UTF-8")
  }
)

# 2. Write run record ----

dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)

writeLines(
  capture.output(sessionInfo()),
  "outputs/tables/session_info.txt"
)

message("Pipeline completo. Revisa outputs/ y article/images/.")
