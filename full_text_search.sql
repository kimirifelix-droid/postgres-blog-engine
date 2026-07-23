# Full-Text Search Results

## Query

```sql
SELECT
    id,
    title,
    ts_rank(search_vec, to_tsquery('english', 'postgres & indexing')) AS rank,
    published_at
FROM public.posts
WHERE search_vec @@ to_tsquery('english', 'postgres & indexing')
ORDER BY rank DESC, published_at DESC;
```

## Search Rankings

Relevant results are ranked using `ts_rank()`, which gives higher scores to documents whose search vector contains more matching terms and better term weighting. The most relevant posts are expected to be those that mention both `postgres` and `indexing` in the title or body.

## Explanation

`to_tsquery('english', 'postgres & indexing')` creates a boolean full-text query requiring both terms. `ts_rank()` then orders the result set by relevance rather than insertion order, which is important for content discovery workflows.
