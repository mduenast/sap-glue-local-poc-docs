# Contrato Landing Zone

El contrato de landing zone define como organizar ficheros extraidos y metadatos de lote. Da al orquestador una forma predecible de descubrir, validar y procesar un lote.

## Estructura sugerida

```text
bucket=<landing-bucket>/
  prefix=<landing-prefix>/
    table=<source-table>/
      load_date=<yyyy-mm-dd>/
        batch_id=<batch-id>/
          data/
            part-0001.parquet
          manifest.json
```

## Campos del contrato

| Campo | Proposito |
| --- | --- |
| Bucket | Contenedor logico para datos aterrizados. En la PoC local se representa con Floci S3. |
| Prefix | Ruta raiz que separa este contrato de otras rutas de objetos. |
| Particion de tabla | Identifica la tabla o entidad extraida. |
| Load date | Agrupa lotes por la fecha en que fueron aterrizados o puestos a disposicion del proceso. |
| Batch ID | Identidad estable de proceso para un lote de extraccion. |
| Formato de fichero | Declara como deben leerse los ficheros, por ejemplo Parquet o CSV. |
| Manifest | Fichero de metadatos que declara ficheros, conteos, estado y expectativas de validacion. |

## Principios

- Cada lote tiene un `batch_id` estable.
- Los ficheros de datos son inmutables una vez aceptado el manifest.
- El manifest es el punto de entrada del proceso.
- Las rutas incluyen tabla, fecha de carga e identidad de lote.
- Un reproceso crea un nuevo lote o una sustitucion versionada.

Este contrato es generico. No prescribe configuracion real de AWS S3, politicas IAM, cifrado, lifecycle rules ni external stages de Snowflake.
