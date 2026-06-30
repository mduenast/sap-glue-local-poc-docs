# Ejecucion dbt

En el patron local, la ejecucion dbt se representa mediante `dbt-duckdb` despues de cargar los datos en DuckDB.

El limite de la PoC es intencionadamente estrecho:

- El orquestador puede invocar dbt despues de una carga analitica correcta.
- Las transformaciones dbt se tratan como una responsabilidad posterior.
- El estado de ejecucion dbt puede registrarse junto al estado de proceso del lote.
- El diseno del proyecto dbt, modelos, tests, exposures y estrategia de despliegue quedan fuera de alcance.

Esta PoC no valida el diseno funcional de ningun proyecto dbt destino. Solo explica donde encaja dbt en el flujo extremo a extremo.
