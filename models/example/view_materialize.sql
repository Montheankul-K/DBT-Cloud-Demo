{{ config(materialized="view") }}

select *
from {{ ref("table_materialize") }}
where id = 1
