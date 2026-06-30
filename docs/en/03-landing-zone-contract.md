# Landing Zone Contract

The landing zone contract defines how extracted batch files and metadata should be organized in the Floci S3-compatible landing zone. It gives the orchestrator a predictable way to discover, validate, and process a batch.

## Selected layout

```text
s3://sap-glue-local-landing/landing/sap/<TABLE>/load_date=<YYYY-MM-DD>/batch_id=<BATCH_ID>/
  data/
    part-0001.parquet
  manifest.json
```

## Contract fields

| Field | Purpose |
| --- | --- |
| Bucket | `sap-glue-local-landing`, the local landing bucket exposed through Floci. |
| Prefix | `landing/sap`, the root path for SAP-like simulator extracts. |
| Table partition | `<TABLE>`, such as `VBAK`, identifying the extracted table-like dataset. |
| Load date | `load_date=<YYYY-MM-DD>`, the date partition for the landed batch. |
| Batch ID | `batch_id=<BATCH_ID>`, the stable batch identity within the table scope. |
| File format | Parquet for the selected local contract. |
| Manifest | `manifest.json`, the enriched metadata file that drives validation and loading. |

## Principles

- Each batch path is deterministic and table-scoped.
- Data files are immutable once the manifest is accepted.
- The manifest is the processing entry point.
- Reprocessing creates a new batch or a clearly versioned replacement.
- The target processing state should use `table_name + batch_id` as the logical key.

This contract is intentionally generic. It does not prescribe real AWS S3 configuration, IAM policies, encryption, lifecycle rules, or Snowflake external stage setup.
