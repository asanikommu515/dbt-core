with sales as (
    select sales_id,
           customer_sk,
           product_sk,
           store_sk,
           quantity,
           unit_price
    from {{ ref('b_sales') }}
),
customers as (
    select customer_sk,
           first_name,
           last_name,
           gender
    from {{ ref('b_customers') }}
),
stores as (
    select store_sk,
           store_name
    from {{ ref('b_stores') }}
),
products as (
    select product_sk,
           product_name
    from {{ ref('b_products') }}
),
enriched_sales as (
    select s.sales_id,
           {{ full_name('c.first_name', 'c.last_name') }} as customer_name,
           c.gender,
           p.product_name,
           st.store_name,
           s.quantity,
           s.unit_price,
           {{ multiply('s.quantity', 's.unit_price') }} as total_price     
    from sales s
    left join customers c on s.customer_sk = c.customer_sk
    left join stores st on s.store_sk = st.store_sk
    left join products p on s.product_sk = p.product_sk
)
select *
from enriched_sales