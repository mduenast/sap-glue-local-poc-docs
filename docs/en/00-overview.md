# Overview

The PoC validates the mechanics of a manifest-driven analytical ingestion flow using only local components.

The desired real-world pattern is:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

The local simulation uses:

```text
PostgreSQL -> extractor simulator -> Floci S3 -> local orchestrator -> DuckDB -> dbt-duckdb
```

## Validated

- A clear landing zone contract for batch-oriented extracted files.
- A manifest that describes data files, schemas, counts, status, and processing metadata.
- Idempotent loading behavior based on stable batch identifiers and object paths.
- Reprocessing rules that avoid hidden mutation of already accepted batches.
- A local explanation path for orchestration, analytical loading, and dbt invocation.

## Not validated

The PoC does not validate real SAP connectivity, real SNP Glue execution, real AWS infrastructure, real Snowflake external stages, or the functional design of any target dbt project.
