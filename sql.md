* Query and aggregate from UTC to EDT
  ```
  SELECT 
    deal_id,
    DATE_TRUNC('day', DATE_ADD(mm_date, INTERVAL -4 HOUR )) AS date, 
    COUNT(*) AS impression_cnt,
    (SUM(clear_price_cpm) / 1000) AS sum_clear_spend
  from logs.impressions i 
  where exchange_id = 44
  and mm_date >= '2024-07-08'
  GROUP BY 
    deal_id, date
  order by date ASC 
  ```
