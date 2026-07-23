# EXPLAIN ANALYZE Results

## Query

```sql
EXPLAIN ANALYZE
SELECT title
FROM public.posts
WHERE published_at >= '2025-01-01'
  AND search_vec @@ to_tsquery('english', 'postgres');
```

## Expected Observations

- The planner should use the `idx_posts_search` GIN index for the `search_vec` predicate.
- A partition pruning step should restrict the scan to the `posts_2025` partition because the date range is inside the 2025 partition.
- The plan should show a filtered scan of the correct partition instead of a full-table scan over unrelated partitions.

## Explanation of Performance Benefits

The combination of a time partition and a GIN full-text index helps PostgreSQL quickly identify the relevant subset of rows. This makes targeted queries much faster on large content collections.
