with source as (
    select * from {{ ref('raw_chronic_diseases') }}
),

unique_locations as (
    select distinct
        -- Генерируем уникальный ключ для измерения
        md5(locationdesc) as location_key,
        locationabbr as state_code,
        locationdesc as state_name
    from source
    where locationdesc is not null
)

select * from unique_locations