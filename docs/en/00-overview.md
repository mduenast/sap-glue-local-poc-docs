# Overview

This proof of concept is a documentation-led, local simulation of an analytical extraction pattern. It explains how data can move from an operational source into a file landing zone, be processed through a batch manifest, loaded into an analytical database, and then made available for dbt execution.

The PoC is intentionally generic. It is meant to help readers reason about contracts, responsibilities, and failure modes without requiring access to real enterprise systems or cloud services.

## Problem illustrated

Analytical ingestion from enterprise systems often fails when the boundaries between extraction, landing, loading, and transformation are unclear. This PoC illustrates a simple contract-first pattern where each extraction batch is represented by immutable files plus a manifest that drives downstream processing.

The desired real-world pattern is:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

The local simulation uses:

```text
PostgreSQL -> extractor simulator -> Floci S3-compatible landing zone -> local orchestrator -> DuckDB -> dbt-duckdb
```

## What it validates

- A clear landing zone contract for batch-oriented extracted files.
- A manifest that describes data files, schemas, counts, status, and processing metadata.
- Idempotent loading behavior based on stable batch identifiers and object paths.
- Reprocessing rules that avoid hidden mutation of already accepted batches.
- A local explanation path for orchestration, analytical loading, and dbt invocation.

## What it does not validate

The PoC does not validate real SAP connectivity, real SNP Glue execution, real AWS infrastructure, real Snowflake external stages, production guarantees, vendor-specific runtime behavior, or the functional design of any target dbt project.
