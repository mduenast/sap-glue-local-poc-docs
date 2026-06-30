# dbt Execution

In the local pattern, dbt execution is represented by `dbt-duckdb` running after data has been loaded into DuckDB.

## In scope

- Showing where dbt execution fits after a successful batch load.
- Describing a command pattern that a local orchestrator could invoke.
- Recording dbt run status alongside batch processing status.
- Treating DuckDB as the local analytical target for dbt-duckdb.

## Expected command pattern

The expected command pattern is intentionally simple:

```bash
dbt run --profiles-dir <profiles-dir> --project-dir <project-dir> --target <target>
```

Optional checks could use:

```bash
dbt test --profiles-dir <profiles-dir> --project-dir <project-dir> --target <target>
```

## Out of scope

- Designing a target dbt project.
- Creating dbt models, sources, tests, exposures, or semantic models.
- Defining production deployment, scheduling, lineage, or observability for dbt.
- Proving that a specific business transformation is correct.

This PoC does not validate the functional design of any target dbt project. It only explains where dbt would sit in the end-to-end flow.
