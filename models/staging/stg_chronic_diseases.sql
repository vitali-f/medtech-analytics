with source as (
    -- Эта функция ref соединяет модель с твоим загруженным CSV
    select * from {{ ref('raw_chronic_diseases') }}
),

renamed as (
    select
        -- Переименовываем колонки в удобный формат (snake_case)
        yearstart as start_year,
        locationabbr as state_code,
        locationdesc as state_name,
        topic as disease_category,
        question as indicator_name,
        datavalue as actual_value,
        datavalueunit as unit,
        stratification1 as demographic_group
    from source
    -- Убираем пустые строки, чтобы не портить статистику
    where actual_value is not null
)

select * from renamed