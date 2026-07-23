-- Query blog posts that contain the tag performance using JSONB containment.
SELECT
    id,
    title,
    published_at,
    metadata
FROM public.posts
WHERE metadata @> '{"tags": ["performance"]}'::jsonb
ORDER BY published_at DESC;
