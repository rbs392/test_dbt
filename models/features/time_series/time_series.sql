with history as (
    select 
        symbol,
        high,
        low,
        `open`,
        `close`,
        volume,
        collect_list(`date`) over(partition by symbol order by `date`) as date_history,
        collect_list(high) over(partition by symbol order by `date`) as high_history,
        collect_list(low) over(partition by symbol order by `date`) as low_history,
        collect_list(`open`) over(partition by symbol order by `date`) as open_history,
        collect_list(`close`) over(partition by symbol order by `date`) as close_history,
        collect_list(volume) over(partition by symbol order by `date`) as volume_history,
        current_date() as dt
    from {{ ref("stock_market") }}
)
select 
    symbol,
    mean(high) as avg_high,
    mean(low) as avg_low,
    mean(`open`) as avg_open,
    mean(`close`) as avg_close,
    mean(volume) as avg_volume,
    first(date_history) as date_history,
    first(high_history) as high_history,
    first(low_history) as low_history,
    first(open_history) as open_history,
    first(close_history) as close_history,
    first(volume_history) as volume_history
from history
group by symbol
