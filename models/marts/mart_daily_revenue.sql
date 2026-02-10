{{ config(materialized='table') }}

SELECT
    t.order_date,
    r.city,
    COUNT(t.transaction_id) as transactions,
    SUM(t.total_amount) as daily_revenue,
    AVG(t.total_amount) as avg_revenue
FROM {{ ref('stg_transactions') }} t
JOIN {{ ref('stg_restaurants') }} r ON t.restaurant_id = r.restaurant_id
GROUP BY 1,2
