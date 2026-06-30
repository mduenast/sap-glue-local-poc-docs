# Arquitectura PoC Local

La arquitectura local sustituye componentes gestionados y empresariales por equivalentes locales simples para poder explicar el flujo de forma segura.

```mermaid
flowchart LR
  A[PostgreSQL] --> B[Simulador de extractor]
  B --> C[Floci S3]
  C --> D[Orquestador local]
  D --> E[DuckDB]
  E --> F[dbt-duckdb]
```

## Mapeo de componentes

| Responsabilidad de referencia | Sustituto local |
| --- | --- |
| Fuente tipo SAP | PostgreSQL |
| Extractor empresarial | Simulador de extractor |
| Landing zone tipo S3 | Floci S3 |
| Orquestacion gestionada | Orquestador local |
| Warehouse analitico | DuckDB |
| Plataforma de ejecucion dbt | dbt-duckdb |

La PoC local sirve para validacion arquitectonica y demostracion. No prueba que la conectividad, escalabilidad u operacion productiva esten listas.
