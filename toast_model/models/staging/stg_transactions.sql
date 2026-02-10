{{ config(materialized='view') }}

select
    transaction_id,
    restaurant_id,
    cast(order_date as date) as order_date,
    total_amount,
    tip_amount,
    items_count
from main_raw.transactions