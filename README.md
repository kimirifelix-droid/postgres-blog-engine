# PostgreSQL Blog Engine

## Project Overview

This repository demonstrates a production-style PostgreSQL blog backend built around partitioned storage, JSONB metadata, and full-text search.

## Objectives

- Model blog posts with a range-partitioned table
- Store flexible metadata in JSONB
- Maintain a `TSVECTOR` with a trigger
- Create search indexes using GIN
- Run full-text and JSONB query examples
- Capture query-performance evidence with `EXPLAIN ANALYZE`

## Repository Structure

```text
postgres-blog-engine/
├── schema/
│   ├── partitioned_posts.sql
│   ├── search_trigger.sql
│   └── indexes.sql
├── data/
│   └── sample_posts.sql
├── queries/
│   ├── jsonb_tag_search.sql
│   ├── full_text_search.sql
│   └── explain_analysis.sql
├── docs/
│   ├── architecture.md
│   ├── jsonb_results.md
│   ├── search_results.md
│   ├── explain_results.md
│   └── reflection.md
└── README.md
```

## Setup Instructions

1. Create a PostgreSQL database.
2. Run the schema files in the following order:

```sql
\i schema/partitioned_posts.sql
\i schema/search_trigger.sql
\i schema/indexes.sql
```

3. Load the sample data:

```sql
\i data/sample_posts.sql
```

4. Run the query scripts:

```sql
\i queries/jsonb_tag_search.sql
\i queries/full_text_search.sql
\i queries/explain_analysis.sql
```

## Commands Used

```bash
psql -d blog_engine -f schema/partitioned_posts.sql
psql -d blog_engine -f schema/search_trigger.sql
psql -d blog_engine -f schema/indexes.sql
psql -d blog_engine -f data/sample_posts.sql
psql -d blog_engine -f queries/jsonb_tag_search.sql
psql -d blog_engine -f queries/full_text_search.sql
psql -d blog_engine -f queries/explain_analysis.sql
```
