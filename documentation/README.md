# Documentación

## Propósito

Reúne lo que explica el artículo sin ser dato ni código.

## Contenido

- `ficha.md`: datos propios del artículo (título, autoría, fuentes, estado).
- `fuentes.csv`: manifiesto de fuentes con su enlace oficial y el archivo que
  produce cada descarga. Lo lee `code/cleaning/00_download_fuente.R`.
- `codebooks/`: libros de códigos de las bases usadas.
- `dictionaries/`: diccionarios de variables.

## Convención de nombres

Archivos en `snake_case`. Un archivo por fuente en `codebooks/` y
`dictionaries/`.
