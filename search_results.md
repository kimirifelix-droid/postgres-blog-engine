# JSONB Query Results

## Query

```sql
SELECT
    id,
    title,
    published_at,
    metadata
FROM public.posts
WHERE metadata @> '{"tags": ["performance"]}'::jsonb
ORDER BY published_at DESC;
```

## Result Returned

This query is expected to return the post titled `PostgreSQL Indexing for Modern Backends` because its metadata contains the tag `performance` in the `tags` array.

## Explanation

The `@>` operator checks whether the left-hand JSONB document contains the right-hand JSONB document. In this case, the metadata column must contain a `tags` array that includes the string `performance`.
