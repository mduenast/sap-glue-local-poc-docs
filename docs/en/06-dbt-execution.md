# dbt Execution

In the local pattern, dbt execution is represented by `dbt-duckdb` running after data has been loaded into DuckDB.

The PoC boundary is intentionally narrow:

- The orchestrator may call dbt after a successful analytical load.
- dbt transformations are treated as a downstream concern.
- dbt run status can be recorded alongside batch processing status.
- dbt project design, model logic, tests, exposures, and deployment strategy are out of scope.

This PoC does not validate the functional design of any target dbt project. It only explains where dbt would sit in the end-to-end flow.
