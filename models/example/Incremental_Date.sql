{{ config( materialized='incremental',unique_key='d_date' ) }}

select * from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
where d_date <= current_date

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  and d_date > (select max(d_date) from {{ this }})   --this-table created by dbt in snowflake(Incremental_Date)

{% endif %}
