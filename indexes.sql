EXPLAIN ANALYZE
SELECT title
FROM public.posts
WHERE published_at >= '2025-01-01'
  AND search_vec @@ to_tsquery('english', 'postgres');
