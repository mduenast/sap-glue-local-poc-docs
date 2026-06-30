# Batch Manifest

The batch manifest describes one extraction batch and provides the local orchestrator with enough metadata to validate and load files.

## Required fields

| Field | Description |
| --- | --- |
| `batch_id` | Stable identifier for this processing batch. |
| `source_system` | Generic source identifier. |
| `table` | Source table or entity represented by the batch. |
| `load_date` | Date partition for the landed batch. |
| `extract_type` | Full, incremental, or other declared extract mode. |
| `status` | Producer-side state, usually `ready` when available for processing. |
| `file_format` | Format used by all listed files unless overridden. |
| `files` | Data file list with path, row count, and optional checksum. |
| `created_at` | Timestamp when the manifest was produced. |

## Example JSON

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

## Validation rules

- Reject manifests with missing required fields.
- Reject manifests whose `status` is not ready for processing.
- Check that every declared file exists under the expected batch prefix.
- Validate that file formats match the declared `file_format`.
- Compare row counts and checksums when available.
- Record processing state by `batch_id` before loading.
- Load accepted files once and only once unless an explicit reprocessing rule applies.

The manifest is a simulation artifact. It does not claim compatibility with any specific enterprise extractor product.
