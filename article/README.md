# Artículo

## Propósito

Contiene la versión del artículo que se publica en El Quantificador.

## Contenido

- `index.Rmd`: fuente del artículo, con el front matter del sitio.
- `references.bib`: referencias citadas con `@clave`.
- `citation-es.csl`: estilo de referencias; conserva sus créditos y licencia.
- `tables/`: tablas usadas por cifras en línea, copiadas por el análisis.
- `images/`: figuras numeradas según el orden del texto. Las copia
  `code/analysis/`; no las edites a mano.
- `thumbnail.png`: portada del artículo para tarjetas y redes. Agrégala antes
  de publicar.

## Cómo ver el artículo

Abre `index.Rmd` en RStudio y usa Knit. El HTML resultante es un artefacto de
compilación y no se versiona.

## Publicación

Copia `index.Rmd`, `images/`, `tables/`, `thumbnail.png`, `references.bib`
y `citation-es.csl` a
`content/post/[categoria]/[slug]/` en el repositorio del sitio, que genera el
`index.html` con `blogdown`. Revisa que `authors` coincida con un archivo de
`content/los-quantificadores/` y que las categorías estén en sentence case.
