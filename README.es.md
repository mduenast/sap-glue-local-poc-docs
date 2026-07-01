# Documentacion de la PoC Local de Extraccion Tipo SAP

Este repositorio contiene el esqueleto de un sitio de documentacion para una prueba de concepto local, publica y generica. La PoC simula un flujo de extraccion tipo SAP hacia una landing zone tipo AWS, seguido de carga analitica y ejecucion dbt.

El patron real deseado es:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

El patron de simulacion local es:

```text
PostgreSQL -> extractor simulator -> Floci S3-compatible landing zone -> local orchestrator -> DuckDB -> dbt-duckdb
```

Este repositorio es solo de documentacion. No contiene codigo de laboratorio, modelos dbt, logica ejecutable de PoC, material de cliente, contenido de proyectos internos, material de propuestas comerciales ni detalles de sistemas productivos.

## Que valida la PoC

- La forma de un contrato de landing zone basado en ficheros.
- Convenciones de manifest para lotes de extraccion.
- Expectativas de idempotencia y reproceso.
- Separacion entre extraccion, landing, carga y transformacion.
- Una ruta de demostracion local para explicar la arquitectura sin dependencias cloud.

## Que no valida la PoC

- Conectividad SAP real.
- Ejecucion real de SNP Glue.
- Infraestructura AWS real.
- External stages reales de Snowflake.
- El diseno funcional de cualquier proyecto dbt destino.
- Seguridad, operacion, escala, rendimiento o controles de cumplimiento de nivel productivo.

## Vista previa local

Crea un entorno virtual e instala las dependencias de documentacion:

```bash
make setup
make doctor
make build
```

Sirve la documentacion localmente:

```bash
make serve
```

Abre la URL local que imprima MkDocs, normalmente `http://127.0.0.1:8000/`.

## Build estricto

Ejecuta el build estricto de la documentacion:

```bash
make build
```

El Makefile usa `.venv/bin/mkdocs`, por lo que no hace falta instalar MkDocs globalmente.

## GitHub Pages

El repositorio esta preparado para desplegar GitHub Pages con MkDocs Material y GitHub Actions. El workflow en `.github/workflows/pages.yml` construye la documentacion con Python 3.12 y publica el sitio generado mediante GitHub Pages.
