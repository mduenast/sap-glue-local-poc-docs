# Idempotency and Reprocessing

Idempotency means that processing the same accepted batch more than once should not create duplicate analytical records or inconsistent state.

## Rules

- Treat `batch_id` as the primary processing identity.
- Record accepted, failed, skipped, and superseded batch states.
- Reject accidental replay of an already accepted immutable batch.
- Allow explicit reprocessing only through a new batch identifier or controlled supersession.
- Keep raw landed files separate from analytical load state.

## Reprocessing scenarios

- Technical retry: rerun the same batch after a transient failure before acceptance.
- Corrected extract: publish a new batch with corrected data.
- Supersession: mark a prior batch as replaced and process a replacement batch.

The PoC demonstrates the rules conceptually. It does not implement production-grade lineage, reconciliation, audit retention, or operational alerting.
