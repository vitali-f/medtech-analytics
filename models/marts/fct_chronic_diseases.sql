{{ config(materialized='table', schema='core') }}

with staging as (
    select * from {{ ref('stg_chronic_diseases') }}
)

select
    state_name,
    disease_category,
    avg(actual_value) as avg_value,
    count(*) as total_indicators
from staging
group by 1, 2