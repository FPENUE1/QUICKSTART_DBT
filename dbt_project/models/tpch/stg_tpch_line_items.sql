select
  md5(
    -- Construimos una firma estable: texto + delimitador + manejo de NULL
    concat(
      coalesce(to_varchar(l_orderkey), '__NULL__'), '||',
      coalesce(to_varchar(l_linenumber), '__NULL__')
    )
  ) as order_item_key,
  l_orderkey       as order_key,
  l_partkey        as part_key,
  l_linenumber     as line_number,
  l_quantity       as quantity,
  l_extendedprice  as extended_price,
  l_discount       as discount_percentage,
  l_tax            as tax_rate
from {{ source('tpch', 'lineitem') }}
