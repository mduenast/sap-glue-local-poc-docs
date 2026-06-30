# SAP-like Local Extraction PoC

This site documents a public-safe, generic proof of concept for a local SAP-like extraction flow into an AWS-like landing zone, analytical loading, and dbt execution.

Choose a language:

- [English](en/index.md)
- [Espanol](es/index.md)

The desired real-world pattern is:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

The local pattern is:

```text
PostgreSQL -> extractor simulator -> Floci S3 -> local orchestrator -> DuckDB -> dbt-duckdb
```
