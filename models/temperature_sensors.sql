{{ config(materialized='view') }}

SELECT 
    context_id, 
    entity_id, 
    state AS temperature_f, 
    last_updated 
FROM {{ ref('events') }}
WHERE 
    device_class = 'temperature' 
    and unit_of_measurement = '°F'
    and entity_id NOT LIKE '%dew_point%'