# Landing Zone Contract

The landing zone contract defines how extracted batch files and metadata should be organized. It gives the orchestrator a predictable way to discover, validate, and process a batch.

## Suggested layout

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

## Contract fields

| Field | Purpose |
| --- | --- |
| Bucket | Logical container for landed data. In the local PoC this is represented by Floci S3. |
| Prefix | Root path that separates this landing contract from other object paths. |
| Table partition | Identifies the extracted table or entity. |
| Load date | Groups batches by the date they were landed or made available for processing. |
| Batch ID | Stable processing identity for one extract batch. |
| File format | Declares how data files should be read, such as Parquet or CSV. |
| Manifest | Metadata file that declares files, counts, status, and validation expectations. |

## Principles

- Each batch has a stable `batch_id`.
- Data files are immutable once the manifest is accepted.
- The manifest is the processing entry point.
- Object paths are deterministic and include table, load date, and batch identity.
- Reprocessing creates a new batch or a clearly versioned replacement.

This contract is intentionally generic. It does not prescribe real AWS S3 configuration, IAM policies, encryption, lifecycle rules, or Snowflake external stage setup.
