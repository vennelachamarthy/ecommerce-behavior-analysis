-- 01_setup.sql | Week 1 | Run in DBeaver on public@ecommerce
-- Table: events (loaded via psql \copy from C:/data/2019-Oct.csv, 42448764 rows)
SELECT COUNT(*) FROM events;
SELECT event_type, COUNT(*) FROM events GROUP BY event_type ORDER BY 2 DESC;
CREATE INDEX idx_user ON events(user_id);
CREATE INDEX idx_type ON events(event_type);
ANALYZE events;
-- Data quality check
SELECT
  COUNT(*)                                      AS total_rows,
  COUNT(*) FILTER (WHERE brand IS NULL)         AS null_brand,
  COUNT(*) FILTER (WHERE category_code IS NULL) AS null_category_code,
  COUNT(*) FILTER (WHERE price <= 0)            AS price_le_zero,
  COUNT(*) FILTER (WHERE price IS NULL)         AS null_price,
  COUNT(*) FILTER (WHERE user_session IS NULL)  AS null_session,
  MIN(event_time)                               AS min_event_time,
  MAX(event_time)                               AS max_event_time
FROM events;
-- Price <= 0 by event type
SELECT event_type, COUNT(*) AS n
FROM events
WHERE price <= 0
GROUP BY event_type
ORDER BY n DESC;