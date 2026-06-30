# Resumen

Esta prueba de concepto es una simulacion local, guiada por documentacion, de un patron de extraccion analitica. Explica como los datos pueden moverse desde una fuente operacional hacia una landing zone de ficheros, procesarse mediante un manifest de lote, cargarse en una base analitica y quedar disponibles para ejecucion dbt.

La PoC es intencionadamente generica. Ayuda a razonar sobre contratos, responsabilidades y modos de fallo sin necesitar acceso a sistemas empresariales reales ni servicios cloud.

## Problema ilustrado

La ingestion analitica desde sistemas empresariales suele fallar cuando los limites entre extraccion, landing, carga y transformacion no estan claros. Esta PoC ilustra un patron basado en contrato donde cada lote de extraccion se representa mediante ficheros inmutables y un manifest que guia el procesamiento posterior.

El patron real deseado es:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

La simulacion local usa:

```text
PostgreSQL -> extractor simulator -> Floci S3-compatible landing zone -> local orchestrator -> DuckDB -> dbt-duckdb
```

## Que valida la PoC

- Un contrato claro de landing zone para ficheros extraidos por lote.
- Un manifest que describe ficheros, esquemas, conteos, estado y metadatos de proceso.
- Carga idempotente basada en identificadores de lote y rutas estables.
- Reglas de reproceso que evitan mutaciones ocultas de lotes ya aceptados.
- Una ruta local para explicar orquestacion, carga analitica y ejecucion dbt.

## Que no valida la PoC

La PoC no valida conectividad SAP real, ejecucion real de SNP Glue, infraestructura AWS real, external stages reales de Snowflake, garantias productivas, comportamiento de runtimes especificos de proveedor ni el diseno funcional de ningun proyecto dbt destino.
