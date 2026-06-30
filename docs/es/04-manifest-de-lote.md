# Manifest de Lote

El manifest de lote describe una extraccion y aporta al orquestador local los metadatos necesarios para validar y cargar ficheros.

## Campos obligatorios

| Campo | Descripcion |
| --- | --- |
| `batch_id` | Identificador estable del lote de proceso. |
| `source_system` | Identificador generico de la fuente. |
| `table` | Tabla o entidad fuente representada por el lote. |
| `load_date` | Particion de fecha para el lote aterrizado. |
| `extract_type` | Modo de extraccion declarado, como full o incremental. |
| `status` | Estado indicado por el productor, normalmente `ready` cuando esta disponible para proceso. |
| `file_format` | Formato usado por todos los ficheros listados salvo que se indique lo contrario. |
| `files` | Lista de ficheros de datos con ruta, conteo de filas y checksum opcional. |
| `created_at` | Timestamp de creacion del manifest. |

## JSON de ejemplo

```json
{
  "batch_id": "2026-01-15T120000Z_CUSTOMER",
  "source_system": "demo_erp",
  "table": "customer",
  "load_date": "2026-01-15",
  "extract_type": "full",
  "status": "ready",
  "file_format": "parquet",
  "created_at": "2026-01-15T12:00:00Z",
  "files": [
    {
      "path": "data/part-0001.parquet",
      "format": "parquet",
      "row_count": 1000,
      "checksum": "sha256:example"
    }
  ]
}
```

## Reglas de validacion

- Rechazar manifests sin campos obligatorios.
- Rechazar manifests cuyo `status` no este listo para proceso.
- Comprobar que cada fichero declarado existe bajo el prefijo esperado del lote.
- Validar que los formatos de fichero coinciden con el `file_format` declarado.
- Comparar conteos y checksums cuando esten disponibles.
- Registrar estado de proceso por `batch_id` antes de cargar.
- Cargar ficheros aceptados una sola vez salvo que aplique una regla explicita de reproceso.

El manifest es un artefacto de simulacion. No afirma compatibilidad con ningun producto extractor empresarial concreto.
