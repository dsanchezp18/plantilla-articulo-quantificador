# ============================================================
# Aplicar estilo y lint al código del proyecto
# Author: [COMPLETAR]
# Purpose: Aplicar la configuración fijada de styler a MASTER.R y a los
#   scripts de code/, y reportar los hallazgos de lintr según .lintr.
#   Se corre desde la raíz antes de dar un script por terminado.
# Inputs:  MASTER.R y los scripts de code/
# Outputs: Los mismos archivos, reformateados; resultados de lintr en
#   pantalla
# ============================================================

# 0. Setup ----

library(lintr)
library(styler)

style_scope <- "tokens"
style_indent <- 2L

# 1. Style scripts ----

# scope = "tokens" respeta los saltos de línea y comentarios intencionales.
# La copia del tema de la casa queda fuera para no alejarla de su origen.

style_file("MASTER.R", scope = style_scope, indent_by = style_indent)
style_dir("code/cleaning", scope = style_scope, indent_by = style_indent)
style_dir("code/analysis", scope = style_scope, indent_by = style_indent)

# 2. Lint scripts ----

lint("MASTER.R")
lint_dir("code")
