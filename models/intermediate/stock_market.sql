select 
    cast(_c0 as date) as `date`,
    cast(_c1 as double) as `open`,
    cast(_c2 as double) as high,
    cast(_c3 as double) as low,
    cast(_c4 as double) as `close`,
    cast(_c5 as long) as volume,
    cast(_c6 as string) as symbol
from {{ source("datalake", "stock_data") }}
