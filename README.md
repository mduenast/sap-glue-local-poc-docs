# SAP-like Local Extraction PoC Documentation

This repository contains the documentation site skeleton for a public, generic local proof of concept that simulates an enterprise extraction flow into an AWS-like landing zone, followed by analytical loading and dbt execution.

The intended real-world pattern is:

```text
SAP-like source / enterprise extractor -> S3-like landing zone -> manifest-driven processing -> analytical warehouse -> dbt execution
```

The local simulation pattern is:

```text
PostgreSQL -> extractor simulator -> Floci S3 -> local orchestrator -> DuckDB -> dbt-duckdb
```

This repository is documentation-only. It does not contain lab code, dbt models, executable PoC logic, client material, internal project content, commercial proposal material, or production system details.

## What the PoC validates

- The shape of a file-based landing zone contract.
- Batch manifest conventions for extraction batches.
- Idempotency and reprocessing expectations.
- Separation between extraction, landing, loading, and transformation concerns.
- A local demonstration path for explaining the architecture without cloud dependencies.

## What the PoC does not validate

- Real SAP connectivity.
- Real SNP Glue execution.
- Real AWS infrastructure.
- Real Snowflake external stages.
- The functional design of any target dbt project.
- Production-grade security, operations, scale, performance, or compliance controls.

## Local preview

Create a virtual environment, install the documentation dependencies, and run MkDocs:

```bash
python3.12 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Open the local URL printed by MkDocs, usually `http://127.0.0.1:8000/`.

## Strict build

Use the same command as the GitHub Actions workflow:

```bash
mkdocs build --strict
```

## GitHub Pages

The repository is prepared for GitHub Pages deployment with MkDocs Material and GitHub Actions. The workflow in `.github/workflows/pages.yml` builds the documentation with Python 3.12 and publishes the generated site through GitHub Pages.
