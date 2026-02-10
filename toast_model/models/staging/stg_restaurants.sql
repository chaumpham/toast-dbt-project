{{ config(materialized='view') }}

select
    restaurant_id,
    name,
    location,
    city,
    category,
    seats,
    avg_rating,
    strptime(open_date, '%m/%d/%y')::DATE as go_live_date
from {{ source('main_raw', 'restaurants') }}