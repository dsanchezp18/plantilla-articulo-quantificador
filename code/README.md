# Código

## Propósito

Todo el código que produce los resultados del artículo, en el orden en que
lo corre `MASTER.R`.

## Contenido

- `cleaning/`: descarga y limpieza de cada fuente.
- `analysis/`: cálculos, tablas y figuras.
- `functions/`: funciones compartidas por más de un script.
- `setup/`: herramientas fuera del pipeline.

## Convención de nombres

`NN_verbo_descripcion.R`, con el número de orden de ejecución. Cada script
empieza con la cabecera de cinco campos y secciones numeradas.

## Dependencias

Los scripts no instalan paquetes: usan `library()` al inicio.
