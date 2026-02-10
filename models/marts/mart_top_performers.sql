{{ config(materialized='table') }}

WITH revenue AS (
    SELECT
        r.restaurant_id,
        SUM(t.total_amount) as total_revenue
    FROM {{ ref('stg_restaurants') }} r
    LEFT JOIN {{ ref('stg_transactions') }} t ON r.restaurant_id = t.restaurant_id
    GROUP BY 1
)
SELECT
    r.city,
    r.name,
    rv.total_revenue,
    RANK() OVER (PARTITION BY r.city ORDER BY rv.total_revenue DESC) as city_rank
FROM revenue rv
JOIN {{ ref('stg_restaurants') }} r ON r.restaurant_id = rv.restaurant_id
WHERE rv.total_revenue > 0