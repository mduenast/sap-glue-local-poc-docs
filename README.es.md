# Documentacion de la PoC Local de Extraccion Tipo SAP

Este repositorio contiene el esqueleto de un sitio de documentacion para una prueba de concepto local, publica y generica. La PoC simula un flujo de extraccion tipo SAP hacia una landing zone tipo AWS, seguido de carga analitica y ejecucion dbt.

El patron real deseado es:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

El patron de simulacion local es:

```text
PostgreSQL -> extractor simulator -> Floci S3 + Floci DynamoDB -> local orchestrator -> DuckDB -> dbt-duckdb
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

Crea un entorno virtual, instala las dependencias de documentacion y ejecuta MkDocs:

```bash
python3.12 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Abre la URL local que imprima MkDocs, normalmente `http://127.0.0.1:8000/`.

## Build estricto

Usa el mismo comando que el workflow de GitHub Actions:

```bash
mkdocs build --strict
```

## GitHub Pages

El repositorio esta preparado para desplegar GitHub Pages con MkDocs Material y GitHub Actions. El workflow en `.github/workflows/pages.yml` construye la documentacion con Python 3.12 y publica el sitio generado mediante GitHub Pages.
