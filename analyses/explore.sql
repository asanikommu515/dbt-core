-- select *
-- from {{ ref('country_codes') }}

select current_account() as account,
       current_region() as region,
       current_warehouse() as warehouse,
       current_database() as database,
       current_schema() as schema