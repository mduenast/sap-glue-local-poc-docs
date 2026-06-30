# Contrato Landing Zone

El contrato de landing zone define como organizar ficheros extraidos y metadatos de lote.

## Estructura sugerida

```text
landing/
  source_system=<source>/
    entity=<entity>/
      batch_id=<batch-id>/
        data/
          part-0001.parquet
        manifest.json
```

## Principios

- Cada lote tiene un `batch_id` estable.
- Los ficheros de datos son inmutables una vez aceptado el manifest.
- El manifest es el punto de entrada del proceso.
- Las rutas incluyen fuente, entidad e identidad de lote.
- Un reproceso crea un nuevo lote o una sustitucion versionada.

Este contrato es generico. No prescribe configuracion real de AWS S3, politicas IAM, cifrado, lifecycle rules ni external stages de Snowflake.
