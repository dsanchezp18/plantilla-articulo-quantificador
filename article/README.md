# Artículo

## Propósito

Contiene la versión del artículo que se publica en El Quantificador.

## Contenido

- `index.Rmd`: fuente del artículo, con el front matter del sitio.
- `references.bib`: referencias citadas con `@clave`.
- `images/`: figuras numeradas según el orden del texto. Las copia
  `code/analysis/`; no las edites a mano.
- `thumbnail.png`: portada del artículo para tarjetas y redes. Agrégala antes
  de publicar.

## Cómo ver el artículo

Abre `index.Rmd` en RStudio y usa Knit. El HTML resultante es un artefacto de
compilación y no se versiona.

## Publicación

Copia `index.Rmd`, `images/`, `thumbnail.png` y `references.bib` a
`content/post/[categoria]/[slug]/` en el repositorio del sitio, que genera el
`index.html` con `blogdown`. Revisa que `authors` coincida con un archivo de
`content/los-quantificadores/` y que las categorías estén en sentence case.
