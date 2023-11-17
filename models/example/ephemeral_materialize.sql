{{ config(
    materialized="ephemeral",
    )
}}

SELECT * FROM {{ ref("table_materialize")}}