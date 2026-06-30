# Batch Manifest

The batch manifest is an enriched metadata contract for one extracted table batch. It gives the local orchestrator enough information to validate the landing path, confirm file availability, record processing state, and load files into DuckDB.

## Required fields

| Field | Description |
| --- | --- |
| `source_system` | Generic source identifier. The selected local value is `SAP_SIM`. |
| `extractor` | Producer identifier. The selected local value is `EXTRACTOR_SIMULATOR`. |
| `table` | SAP-like table name exposed by the simulator, such as `VBAK`. |
| `source_table` | PostgreSQL source table backing the simulated extract, such as `sap_vbak`. |
| `mode` | Extract mode, such as `full`. |
| `batch_id` | Stable identifier for this batch within the table scope. |
| `load_date` | Date partition for the landed batch. |
| `status` | Producer-side state, usually `ready` when available for processing. |
| `format` | Data file format. The selected local format is `parquet`. |
| `files` | Data file list with S3-compatible URI and row count. |
| `total_rows` | Total row count across all files. |
| `created_at` | Timestamp when the manifest was produced. |

## Example JSON

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

## Validation rules

- Reject manifests with missing required fields.
- Reject manifests whose `status` is not `ready`.
- Check that the manifest path matches `table`, `load_date`, and `batch_id`.
- Check that every declared `files[].uri` exists under the expected batch prefix.
- Validate that the declared `format` is supported by the local loader.
- Confirm that `total_rows` equals the sum of `files[].rows`.
- Record processing state by `table_name + batch_id` before loading.
- Load accepted files once and only once unless an explicit reprocessing rule applies.

The manifest is a simulation artifact. It does not claim compatibility with any specific enterprise extractor product or vendor runtime.
