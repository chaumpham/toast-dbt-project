{{ config(severity = 'error') }}

select
    transaction_id,
    total_amount
from {{ ref('stg_transactions')}}
where total_amount <= 0