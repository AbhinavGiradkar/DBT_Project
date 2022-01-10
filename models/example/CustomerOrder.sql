{{ config( materialized='table' ) }}

select c.c_custkey,c.c_name, sum(o.o_totalprice) as Total_order_price from SNOWFLAKE_SAMPLE_DATA.TPCH_SF100.Customer c
inner join SNOWFLAKE_SAMPLE_DATA.TPCH_SF100.Orders o
on c.c_custkey=o.o_custkey
group by c.c_custkey,c.c_name