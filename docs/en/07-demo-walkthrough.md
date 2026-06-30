# Demo Walkthrough

The demonstration should focus on the architecture and data contract, not on production behavior.

## Suggested flow

1. Show a small PostgreSQL source table as a SAP-like stand-in.
2. Simulate an extractor writing files and a manifest to Floci S3.
3. Inspect the landing zone layout and manifest fields.
4. Run a local orchestrator conceptually against the manifest.
5. Load accepted data into DuckDB.
6. Trigger `dbt-duckdb` as the analytical transformation step.
7. Show processing state for accepted, failed, skipped, or superseded batches.

## Demo message

The demo validates the shape of the flow and the operating contract. It does not validate enterprise connectivity, managed cloud services, production security, or target transformation design.
