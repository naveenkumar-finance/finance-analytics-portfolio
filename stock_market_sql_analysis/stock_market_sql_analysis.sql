create database stock_analysis;
use stock_analysis;
select * from png;
select * from png limit 10;
select date, close from png order by close desc limit 1;
select date, close from png order by close asc limit 1;
select avg(close) from png;
select year(date), avg(close) from png group by year(date);
select date, volume from png order by volume desc limit 1;
select avg(volume) from png;
select year(date), sum(volume) from png group by year(date);
select date, high -low as volatility from png;
select date, high, low, (high - low) as daily_volatility 
from png order by daily_volatility desc limit 10;
select year(date) as year, avg(high - low) as avg_volatility 
from png group by year(date) order by year;
select date, close, lag(close) over (order by date) as previous_close from png;
select date, close, lag(close) over (order by date) as prev_close,
((close - lag(close) over (order by date)) / lag(close) over (order by date)) * 100 as daily_return_pct from png;
select date, close, avg(close) over(order by date rows between 49 preceding and current row) as moving_avg_50 from png;
select date,close, avg(close) over (order by date rows between 199 preceding and current row) as moving_avg_200 from png;
select date,open, close from png where close > open;
select date, close from png where close >(select avg(close) from png);
select date,close, rank() over (order by close desc) as price_rank from png;
