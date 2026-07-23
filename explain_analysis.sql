# Reflection

This project deepened my understanding of how PostgreSQL supports production-style content systems. JSONB proved especially useful because a blog backend often needs flexible metadata such as tags, audiences, custom flags, and trending fields that do not fit neatly into a fixed schema. Using JSONB allows those attributes to be stored in a structured, queryable format while preserving flexibility for future changes.

PostgreSQL full-text search also stood out as more powerful than basic text matching. Rather than scanning raw text with a simple `LIKE` predicate, `TSVECTOR` and `TSQUERY` enable stemming, term weighting, and relevance ranking. That means queries can return results in a meaningful order according to how closely they match the search intent.

The trigger-based automation was another valuable lesson. With a trigger tied to `title` and `body` updates, the application does not need to manually keep the search vector synchronized. This reduces the risk of data inconsistency and makes the data layer more robust.

Partitioning is important when a dataset grows over time because it limits the amount of data scanned for time-based queries. In a large blog platform, partitioning by `published_at` makes retention, archival, and governance much easier while keeping recent content fast to access. The most valuable PostgreSQL feature in this assignment was the combination of `TSVECTOR` search with GIN indexing because it provides both relevance and performance in one design.
