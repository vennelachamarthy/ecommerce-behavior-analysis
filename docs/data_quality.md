# Data Quality Notes (2019-Oct)

| Check | Count | Share |
|---|---|---|
| Total rows | 42,448,764 | 100% |
| Null brand | 6,113,008 | 14.4% |
| Null category_code | 13,515,609 | 31.8% |
| Price <= 0 | 68,673 | 0.16% |
| Null price | 0 | 0% |
| Null user_session | 2 | ~0% |

Date range: 2019-10-01 00:00 UTC to 2019-10-31 23:59:59 UTC.

## Handling decisions
- Null brand: keep rows, label as 'unknown' in brand analysis.
- Null category_code: keep rows, label as 'unknown' in category analysis.
- Price <= 0: found only on view (68,523) and cart (150) events, none on purchase, so revenue is unaffected. Kept in the data.
- Null user_session: exclude from session level analysis (2 rows).
- Revenue is counted on event_type = 'purchase' only.
- All times analysed in UTC.