# Resumen

La PoC valida la mecanica de un flujo analitico guiado por manifests usando solo componentes locales.

El patron real deseado es:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

La simulacion local usa:

```text
PostgreSQL -> extractor simulator -> Floci S3 -> local orchestrator -> DuckDB -> dbt-duckdb
```

## Que valida

- Un contrato claro de landing zone para ficheros extraidos por lote.
- Un manifest que describe ficheros, esquemas, conteos, estado y metadatos de proceso.
- Carga idempotente basada en identificadores de lote y rutas estables.
- Reglas de reproceso que evitan mutaciones ocultas de lotes ya aceptados.
- Una ruta local para explicar orquestacion, carga analitica y ejecucion dbt.

## Que no valida

La PoC no valida conectividad SAP real, ejecucion real de SNP Glue, infraestructura AWS real, external stages reales de Snowflake ni el diseno funcional de ningun proyecto dbt destino.
