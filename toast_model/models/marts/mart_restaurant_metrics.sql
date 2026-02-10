{{ config(materialized='table') }}

WITH restaurant_stats AS (
    SELECT
        r.city,
        r.category,
        AVG(r.avg_rating) as avg_city_rating,
        AVG(r.seats) as avg_seats,
        COUNT(DISTINCT r.restaurant_id) as restaurant_count,
        COUNT(t.transaction_id) as total_transactions,
        SUM(t.total_amount) as total_revenue
    FROM {{ ref('stg_restaurants') }} r
    LEFT JOIN {{ ref('stg_transactions') }} t ON r.restaurant_id = t.restaurant_id
    GROUP BY 1,2
)
SELECT *
FROM restaurant_stats
