# Guia Demo

La demostracion debe centrarse en la arquitectura y el contrato de datos, no en comportamiento productivo.

## Flujo sugerido

1. Mostrar una pequena tabla fuente en PostgreSQL como sustituto tipo SAP.
2. Simular un extractor escribiendo ficheros y un manifest en Floci S3, con estado de lote registrado en Floci DynamoDB.
3. Revisar la estructura de landing zone y los campos del manifest.
4. Ejecutar conceptualmente un orquestador local contra el manifest.
5. Cargar datos aceptados en DuckDB.
6. Lanzar `dbt-duckdb` como paso de transformacion analitica.
7. Mostrar estado de proceso para lotes aceptados, fallidos, omitidos o sustituidos.

## Mensaje de la demo

La demo valida la forma del flujo y el contrato operativo. No valida conectividad empresarial, servicios cloud gestionados, seguridad productiva ni diseno de transformaciones destino.
