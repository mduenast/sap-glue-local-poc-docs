# Ejecucion dbt

En el patron local, la ejecucion dbt se representa mediante `dbt-duckdb` despues de cargar los datos en DuckDB.

## Dentro de alcance

- Mostrar donde encaja la ejecucion dbt despues de una carga de lote correcta.
- Describir un patron de comando que podria invocar un orquestador local.
- Registrar el estado de ejecucion dbt junto al estado de proceso del lote.
- Tratar DuckDB como destino analitico local para dbt-duckdb.

## Patron de comando esperado

El patron de comando esperado es intencionadamente simple:

```bash
dbt run --profiles-dir <profiles-dir> --project-dir <project-dir> --target <target>
```

Validaciones opcionales podrian usar:

```bash
dbt test --profiles-dir <profiles-dir> --project-dir <project-dir> --target <target>
```

## Fuera de alcance

- Disenar un proyecto dbt destino.
- Crear modelos, sources, tests, exposures o modelos semanticos dbt.
- Definir despliegue productivo, scheduling, linaje u observabilidad para dbt.
- Probar que una transformacion de negocio concreta es correcta.

Esta PoC no valida el diseno funcional de ningun proyecto dbt destino. Solo explica donde encaja dbt en el flujo extremo a extremo.
