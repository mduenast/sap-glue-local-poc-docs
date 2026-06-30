# Local PoC Architecture

The local architecture replaces managed and enterprise components with simple local equivalents so the flow can be explained and demonstrated safely.

```mermaid
flowchart LR
  A[PostgreSQL] --> B[Extractor simulator]
  B --> C[Floci S3]
  C --> D[Local orchestrator]
  D --> E[DuckDB]
  E --> F[dbt-duckdb]
```

## Component mapping

| Reference concern | Local substitute |
| --- | --- |
| SAP-like source | PostgreSQL |
| Enterprise extractor | Extractor simulator |
| S3-like landing zone | Floci S3 |
| Managed orchestration | Local orchestrator |
| Analytical warehouse | DuckDB |
| dbt execution platform | dbt-duckdb |

The local PoC is designed for architectural validation and demonstration. It is not evidence that production connectivity, scalability, or operations are ready.
