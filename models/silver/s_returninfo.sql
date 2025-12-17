with returns as (
    select sales_id,
    store_sk,
    product_sk,
    returned_qty,
    return_reason,
    refund_amount
    from {{ ref('b_returns') }}
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
enriched_returns as (
    select r.sales_id,
           st.store_name,
           p.product_name,
           r.returned_qty,
           r.return_reason,
           r.refund_amount
    from returns r
    left join stores st on r.store_sk = st.store_sk
    left join products p on r.product_sk = p.product_sk
)
select *
from enriched_returns