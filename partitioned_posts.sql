-- Full-text search for postgres and indexing content, ranked by relevance.
SELECT
    id,
    title,
    ts_rank(search_vec, to_tsquery('english', 'postgres & indexing')) AS rank,
    published_at
FROM public.posts
WHERE search_vec @@ to_tsquery('english', 'postgres & indexing')
ORDER BY rank DESC, published_at DESC;
