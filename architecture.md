INSERT INTO public.posts (title, body, metadata, published_at)
VALUES
(
    'PostgreSQL Indexing for Modern Backends',
    'PostgreSQL indexing strategies help application teams keep query latency low while maintaining write flexibility. Performance tuning often starts with the correct index type and high-selectivity predicates.',
    '{"tags": ["postgres", "indexing", "performance"]}'::jsonb,
    '2025-02-14 09:30:00+00'
),
(
    'Understanding JSONB in Content Systems',
    'JSONB gives PostgreSQL applications a flexible metadata model for tags, categories, and author attributes without needing a separate schema change for every new field.',
    '{"tags": ["jsonb", "metadata", "content"]}'::jsonb,
    '2025-03-21 13:45:00+00'
),
(
    'Full-Text Search with tsvector and tsquery',
    'A full-text search pipeline can rank structured content around practical topics such as postgres and indexing. This approach outperforms simple LIKE filters for relevant content retrieval.',
    '{"tags": ["search", "postgres", "indexing"]}'::jsonb,
    '2025-04-09 16:00:00+00'
),
(
    'Partitioning for Large Blog Archives',
    'Partitioning large tables by date makes retention and archival management easier. A range partition on published_at keeps hot recent data separate from older historical content.',
    '{"tags": ["partitioning", "scalability", "performance"]}'::jsonb,
    '2025-05-19 10:15:00+00'
);

-- Verify that the trigger automatically populated search_vec.
SELECT id, title, search_vec FROM public.posts ORDER BY published_at;
