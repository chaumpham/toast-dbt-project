{{ config(materialized='view') }}

select
    transaction_id,
    restaurant_id,
    strptime(order_date, '%m/%d/%y')::DATE as order_date,
    total_amount,
    tip_amount,
    items_count
from {{ source ('main_raw', 'transactions') }}