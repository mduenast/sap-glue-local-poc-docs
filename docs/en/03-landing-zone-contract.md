# Landing Zone Contract

The landing zone contract defines how extracted batch files and metadata should be organized.

## Suggested layout

```text
landing/
  source_system=<source>/
    entity=<entity>/
      batch_id=<batch-id>/
        data/
          part-0001.parquet
        manifest.json
```

## Contract principles

- Each batch has a stable `batch_id`.
- Data files are immutable once the manifest is accepted.
- The manifest is the processing entry point.
- Object paths are deterministic and include source, entity, and batch identity.
- Reprocessing creates a new batch or a clearly versioned replacement.

This contract is intentionally generic. It does not prescribe real AWS S3 configuration, IAM policies, encryption, lifecycle rules, or Snowflake external stage setup.
