{{ config(materialized='view') }}

select
    restaurant_id,
    name,
    location,
    city,
    category,
    seats,
    avg_rating,
    cast(open_date as date) as go_live_date
from main_raw.restaurants