# Idempotency and Reprocessing

Idempotency means that processing the same accepted table batch more than once should not create duplicate analytical records or inconsistent state.

## Target state key

The preferred processing state key is:

```text
table_name + batch_id
```

This allows different tables to use independent batch sequences without accidental collisions. If the local implementation still treats `batch_id` as globally unique, that should be understood as a local simplification rather than a general contract requirement.

## Batch state

The orchestrator should record state for each `table_name + batch_id`.

Suggested states:

- `discovered`: manifest found but not yet validated.
- `validated`: manifest and files passed validation.
- `loading`: analytical load is in progress.
- `accepted`: load completed successfully.
- `failed`: validation, load, or dbt execution failed.
- `skipped`: batch was intentionally ignored, usually because it was already accepted.
- `superseded`: batch was replaced by a newer explicit batch.

## Avoiding duplicate loads

- Treat `table_name + batch_id` as the primary processing identity.
- Record accepted, failed, skipped, and superseded batch states.
- Reject accidental replay of an already accepted immutable table batch.
- Allow explicit reprocessing only through a new batch identifier or controlled supersession.
- Keep raw landed files separate from analytical load state.

## Failed batch behavior

A failed batch should remain visible with enough error context to support retry or correction. A technical retry may reuse the same `table_name + batch_id` only if the batch was not accepted. If the source data or files need correction after acceptance, the correction should be published as a new batch or as a controlled supersession.

## Reprocessing scenarios

- Technical retry: rerun the same batch after a transient failure before acceptance.
- Corrected extract: publish a new batch with corrected data.
- Supersession: mark a prior batch as replaced and process a replacement batch.

The PoC demonstrates the rules conceptually. It does not implement production-grade lineage, reconciliation, audit retention, or operational alerting.
