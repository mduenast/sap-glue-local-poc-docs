# Manifest de Lote

El manifest de lote es un contrato de metadatos enriquecido para un lote extraido de una tabla. Aporta al orquestador local informacion suficiente para validar la ruta de landing, confirmar disponibilidad de ficheros, registrar estado de proceso y cargar ficheros en DuckDB.

## Campos obligatorios

| Campo | Descripcion |
| --- | --- |
| `source_system` | Identificador generico de la fuente. El valor local seleccionado es `SAP_SIM`. |
| `extractor` | Identificador del productor. El valor local seleccionado es `EXTRACTOR_SIMULATOR`. |
| `table` | Nombre de tabla tipo SAP expuesto por el simulador, por ejemplo `VBAK`. |
| `source_table` | Tabla fuente PostgreSQL que respalda la extraccion simulada, por ejemplo `sap_vbak`. |
| `mode` | Modo de extraccion, por ejemplo `full`. |
| `batch_id` | Identificador estable del lote dentro del alcance de la tabla. |
| `load_date` | Particion de fecha para el lote aterrizado. |
| `status` | Estado indicado por el productor, normalmente `ready` cuando esta disponible para proceso. |
| `format` | Formato de los ficheros de datos. El formato local seleccionado es `parquet`. |
| `files` | Lista de ficheros de datos con URI compatible con S3 y conteo de filas. |
| `total_rows` | Conteo total de filas entre todos los ficheros. |
| `created_at` | Timestamp de creacion del manifest. |

## JSON de ejemplo

```json
{
  "source_system": "SAP_SIM",
  "extractor": "EXTRACTOR_SIMULATOR",
  "table": "VBAK",
  "source_table": "sap_vbak",
  "mode": "full",
  "batch_id": "2026-01-15T120000Z_VBAK",
  "load_date": "2026-01-15",
  "status": "ready",
  "format": "parquet",
  "files": [
    {
      "uri": "s3://sap-glue-local-landing/landing/sap/VBAK/load_date=2026-01-15/batch_id=2026-01-15T120000Z_VBAK/data/part-0001.parquet",
      "rows": 100
    }
  ],
  "total_rows": 100,
  "created_at": "2026-01-15T12:00:00Z"
}
```

## Reglas de validacion

- Rechazar manifests sin campos obligatorios.
- Rechazar manifests cuyo `status` no sea `ready`.
- Comprobar que la ruta del manifest coincide con `table`, `load_date` y `batch_id`.
- Comprobar que cada `files[].uri` declarado existe bajo el prefijo esperado del lote.
- Validar que el `format` declarado esta soportado por el cargador local.
- Confirmar que `total_rows` coincide con la suma de `files[].rows`.
- Registrar estado de proceso por `table_name + batch_id` antes de cargar.
- Cargar ficheros aceptados una sola vez salvo que aplique una regla explicita de reproceso.

El manifest es un artefacto de simulacion. No afirma compatibilidad con ningun producto extractor empresarial concreto ni runtime de proveedor.
