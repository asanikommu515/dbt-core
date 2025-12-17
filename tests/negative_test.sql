select *
from {{ ref('b_sales') }}
where gross_amount = 0 and discount_amount = 0