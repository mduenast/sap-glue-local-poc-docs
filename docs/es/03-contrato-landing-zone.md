# Contrato Landing Zone

El contrato de landing zone define como organizar ficheros extraidos y metadatos de lote en la landing zone compatible con S3 de Floci. Da al orquestador una forma predecible de descubrir, validar y procesar un lote.

## Estructura seleccionada

```text
s3://sap-glue-local-landing/landing/sap/<TABLE>/load_date=<YYYY-MM-DD>/batch_id=<BATCH_ID>/
  data/
    part-0001.parquet
  manifest.json
```

## Campos del contrato

| Campo | Proposito |
| --- | --- |
| Bucket | `sap-glue-local-landing`, el bucket local de landing expuesto mediante Floci. |
| Prefix | `landing/sap`, la ruta raiz para extracciones del simulador tipo SAP. |
| Particion de tabla | `<TABLE>`, por ejemplo `VBAK`, que identifica el dataset extraido tipo tabla. |
| Load date | `load_date=<YYYY-MM-DD>`, la particion de fecha para el lote aterrizado. |
| Batch ID | `batch_id=<BATCH_ID>`, la identidad estable del lote dentro del alcance de la tabla. |
| Formato de fichero | Parquet para el contrato local seleccionado. |
| Manifest | `manifest.json`, el fichero de metadatos enriquecido que guia validacion y carga. |

## Principios

- Cada ruta de lote es deterministica y esta acotada por tabla.
- Los ficheros de datos son inmutables una vez aceptado el manifest.
- El manifest es el punto de entrada del proceso.
- Un reproceso crea un nuevo lote o una sustitucion versionada.
- El estado de proceso destino debe usar `table_name + batch_id` como clave logica.

Este contrato es generico. No prescribe configuracion real de AWS S3, politicas IAM, cifrado, lifecycle rules ni external stages de Snowflake.
