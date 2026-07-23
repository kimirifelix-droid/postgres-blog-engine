# Architecture

This blog backend uses a partitioned PostgreSQL table to store posts in a scalable, time-aware structure. The central table, `posts`, is range-partitioned by `published_at`, with the first partition in place for 2025. This design keeps recent content fast to query and improves archival management over time.

## Why JSONB was used

JSONB stores flexible metadata such as tags, categories, author attributes, and custom workflow flags. Unlike a rigid relational schema, JSONB allows the backend to evolve without forcing repeated schema migrations for each new metadata field.

## Why full-text search was implemented

The `search_vec` column stores a PostgreSQL `TSVECTOR` built from the `title` and `body`. This makes content discovery much more capable than a plain `LIKE` lookup because it supports stemming, ranking, and natural-language queries.

## Why triggers were used

A trigger keeps `search_vec` synchronized automatically whenever a post is inserted or updated. This removes manual maintenance from the application layer and ensures the full-text index is always consistent.

## Why partitioning improves performance

Partitioning by `published_at` allows PostgreSQL to scan only relevant partitions for time-bound queries. This reduces the amount of data examined and supports better retention and maintenance strategies for large archives.

## How GIN indexes accelerate searches

GIN indexes are ideal for `TSVECTOR` and `JSONB` search. They support fast containment and full-text matching at scale, letting the database evaluate search predicates efficiently.

## Simplified architecture diagram

```text
Application
   |
   v
PostgreSQL
   |
   +--> posts (partitioned by published_at)
   |       |
   |       +--> posts_2025
   |
   +--> search_vec (TSVECTOR)
   |
   +--> metadata (JSONB)
   |
   +--> GIN indexes: idx_posts_search, idx_posts_meta
```
