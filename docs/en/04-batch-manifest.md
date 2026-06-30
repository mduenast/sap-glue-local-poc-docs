# Batch Manifest

The batch manifest describes one extraction batch and provides the local orchestrator with enough metadata to validate and load files.

## Example fields

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

## Expected use

- Validate that required fields are present.
- Check that all declared files exist.
- Compare row counts and checksums when available.
- Record processing state by `batch_id`.
- Load accepted files into analytical tables.

The manifest is a simulation artifact. It does not claim compatibility with any specific enterprise extractor product.
