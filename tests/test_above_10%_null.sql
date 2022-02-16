
select sum(case id when null then 1 else 0 end) /count(*) as total_nulls
from {{ ref('my_first_dbt_model') }}
having sum(case id when null then 1 else 0 end) /count(*) > 0.1