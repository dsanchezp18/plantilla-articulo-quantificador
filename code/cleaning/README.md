# Cleaning

## Propósito

Descarga y limpieza de cada fuente. Un script por fuente y etapa.

## Contenido

- `00_download_fuente.R`: descarga los archivos oficiales a `data/raw/`.
- `01_clean_base.R`: limpia la base y escribe `data/intermediate/` y `data/final/`.

## Convención de nombres

`NN_download_<fuente>.R` y `NN_clean_<base>.R`. Renombra los archivos de ejemplo y actualiza `MASTER.R`.

## Dependencias

Lee `documentation/fuentes.csv` y `data/raw/`.
