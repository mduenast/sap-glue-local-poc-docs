# Idempotencia y Reproceso

Idempotencia significa que procesar el mismo lote aceptado mas de una vez no debe crear duplicados analiticos ni estados inconsistentes.

## Reglas

- Tratar `batch_id` como identidad principal de proceso.
- Registrar estados de lote aceptado, fallido, omitido y sustituido.
- Rechazar la repeticion accidental de un lote inmutable ya aceptado.
- Permitir reproceso explicito solo con un nuevo identificador de lote o una sustitucion controlada.
- Separar los ficheros raw aterrizados del estado de carga analitica.

## Escenarios

- Reintento tecnico: volver a ejecutar el mismo lote tras un fallo transitorio antes de aceptarlo.
- Extraccion corregida: publicar un lote nuevo con datos corregidos.
- Sustitucion: marcar un lote previo como reemplazado y procesar un lote sustituto.

La PoC demuestra las reglas de forma conceptual. No implementa linaje, reconciliacion, retencion de auditoria ni alertas operativas de nivel productivo.
