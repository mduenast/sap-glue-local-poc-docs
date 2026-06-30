# Manifest de Lote

El manifest de lote describe una extraccion y aporta al orquestador local los metadatos necesarios para validar y cargar ficheros.

## Campos de ejemplo

```json
{
  "batch_id": "2026-01-15T120000Z_CUSTOMER",
  "source_system": "demo_erp",
  "entity": "customer",
  "extract_type": "full",
  "status": "ready",
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

## Uso esperado

- Validar que los campos obligatorios existen.
- Comprobar que los ficheros declarados existen.
- Comparar conteos y checksums cuando esten disponibles.
- Registrar estado de proceso por `batch_id`.
- Cargar ficheros aceptados en tablas analiticas.

El manifest es un artefacto de simulacion. No afirma compatibilidad con ningun producto extractor empresarial concreto.
