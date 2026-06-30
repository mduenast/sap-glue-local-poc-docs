# Idempotencia y Reproceso

Idempotencia significa que procesar el mismo lote aceptado de una tabla mas de una vez no debe crear duplicados analiticos ni estados inconsistentes.

## Clave de estado destino

La clave de estado de proceso preferida es:

```text
table_name + batch_id
```

Esto permite que distintas tablas usen secuencias de lote independientes sin colisiones accidentales. Si la implementacion local todavia trata `batch_id` como globalmente unico, debe entenderse como una simplificacion local y no como requisito general del contrato.

## Estado de lote

El orquestador debe registrar estado para cada `table_name + batch_id`.

Estados sugeridos:

- `discovered`: manifest encontrado pero aun no validado.
- `validated`: manifest y ficheros pasaron la validacion.
- `loading`: la carga analitica esta en curso.
- `accepted`: la carga termino correctamente.
- `failed`: fallo la validacion, la carga o la ejecucion dbt.
- `skipped`: el lote fue omitido intencionadamente, normalmente porque ya estaba aceptado.
- `superseded`: el lote fue reemplazado por otro lote explicito.

## Evitar cargas duplicadas

- Tratar `table_name + batch_id` como identidad principal de proceso.
- Registrar estados de lote aceptado, fallido, omitido y sustituido.
- Rechazar la repeticion accidental de un lote inmutable ya aceptado para una tabla.
- Permitir reproceso explicito solo con un nuevo identificador de lote o una sustitucion controlada.
- Separar los ficheros raw aterrizados del estado de carga analitica.

## Comportamiento de lotes fallidos

Un lote fallido debe seguir visible con suficiente contexto de error para permitir reintento o correccion. Un reintento tecnico puede reutilizar el mismo `table_name + batch_id` solo si el lote no fue aceptado. Si los datos fuente o los ficheros necesitan correccion despues de la aceptacion, la correccion debe publicarse como un nuevo lote o como una sustitucion controlada.

## Escenarios

- Reintento tecnico: volver a ejecutar el mismo lote tras un fallo transitorio antes de aceptarlo.
- Extraccion corregida: publicar un lote nuevo con datos corregidos.
- Sustitucion: marcar un lote previo como reemplazado y procesar un lote sustituto.

La PoC demuestra las reglas de forma conceptual. No implementa linaje, reconciliacion, retencion de auditoria ni alertas operativas de nivel productivo.
