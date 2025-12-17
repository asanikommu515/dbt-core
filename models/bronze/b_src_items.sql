with items as
(
select *,row_number() over(partition by item_id order by updtdate desc) as latest_item
from {{source('source', 'src_items')}}
)
select item_id,item_name,item_status,updtdate
from items
where latest_item = 1