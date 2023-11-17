{{ config(
    materialized="incremental",
    on_schema_change="fail"
    )
}}

WITH cte AS (
    SELECT * FROM {{ ref("table_materialize")}}
)

SELECT * FROM cte
WHERE id IS NOT NULL
{% if is_incremental() %}
    AND id > (SELECT max(id) from {{ this }})
{% endif%}