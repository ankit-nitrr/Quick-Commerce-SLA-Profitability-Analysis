CREATE TABLE quick_commerce_orders (
    feedback_id BIGINT,
    order_id BIGINT,
    customer_id BIGINT,
    rating INT,
    feedback_category VARCHAR(50),
    sentiment VARCHAR(20),
    feedback_date DATE,
    customer_id_1 BIGINT,
    area VARCHAR(50),
    pincode INT,
    registration_date DATE,
    customer_segment VARCHAR(20),
    total_orders INT,
    avg_order_value NUMERIC(10,2),
    order_id_1 BIGINT,
    product_id INT,
    quantity INT,
    unit_price NUMERIC(10,2),
    order_id_2 BIGINT,
    customer_id_2 BIGINT,
    order_date TIMESTAMP,
    promised_delivery_time TIMESTAMP,
    actual_delivery_time TIMESTAMP,
    delivery_status VARCHAR(30),
    order_total NUMERIC(10,2),
    payment_method VARCHAR(30),
    delivery_partner_id INT,
    store_id INT,
    campaign_id INT,
    campaign_name VARCHAR(50),
    target_audience VARCHAR(30),
    channel VARCHAR(30),
    impressions INT,
    clicks INT,
    conversions INT,
    spend NUMERIC(10,2),
    revenue_generated NUMERIC(10,2),
    roas NUMERIC(6,2),
    delay_minutes NUMERIC(6,2),
    sla_breach INT,
    profit NUMERIC(10,2),
    profit_margin NUMERIC(6,2),
    order_hour INT,
    day_name VARCHAR(15),
    peak_period VARCHAR(15)
);

SELECT * FROM quick_commerce_orders
limit 5 ;
--------------------------------------------------------------------------------------------------------------------
-- Operations / SLA
-- 1 Overall SLA breach rate, and by peak period
-- 2 Which store(s) have the worst breach rates
-- 3 Average delay by hour of day

-- Profitability
-- 4. Revenue, profit, and margin by peak period
-- 5. Top/bottom performing stores by profit
-- 6. Revenue and profit trend by day of week

-- Customer & Marketing
-- 7. Customer segment breakdown — orders, revenue, avg rating per segment
-- 8. Channel-wise marketing efficiency (spend, revenue_generated, ROAS)
-- 9. Rating/sentiment vs delivery status
--------------------------------------------------------------------------------------------------------------------
-- Query 1: Overall SLA Breach Rate + By Peak Period
SELECT 
    peak_period,
    COUNT(*) AS total_orders,
    SUM(sla_breach) AS total_breaches,
    ROUND(AVG(sla_breach) * 100, 2) AS breach_rate_pct
FROM quick_commerce_orders
GROUP BY peak_period
ORDER BY breach_rate_pct DESC;

--Query 2: Worst-Performing Stores by SLA Breach Rate
SELECT 
    store_id,
    COUNT(*) AS total_orders,
    SUM(sla_breach) AS total_breaches,
    ROUND(AVG(sla_breach) * 100, 2) AS breach_rate_pct
FROM quick_commerce_orders
GROUP BY store_id
HAVING COUNT(*) >= 50          -- exclude low-volume stores (unreliable %)
ORDER BY breach_rate_pct DESC
LIMIT 10;


--Query 3: Revenue, Profit, Margin by Peak Period
SELECT 
    peak_period,
    COUNT(*) AS total_orders,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin_pct
FROM quick_commerce_orders
GROUP BY peak_period
ORDER BY total_revenue DESC;

--Query 4: Top & Bottom Stores by Profit
SELECT 
    store_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin_pct
FROM quick_commerce_orders
GROUP BY store_id
HAVING COUNT(*) >= 50
ORDER BY total_profit DESC
LIMIT 5;

--Query 5: Bottom 5 Stores by Profit
SELECT 
    store_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit_margin), 2) AS avg_margin_pct
FROM quick_commerce_orders
GROUP BY store_id
HAVING COUNT(*) >= 50
ORDER BY total_profit ASC
LIMIT 5;

--Query 6: Customer Segment Breakdown
SELECT 
    customer_segment,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(order_total), 2) AS total_revenue,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(sla_breach) * 100, 2) AS breach_rate_pct
FROM quick_commerce_orders
GROUP BY customer_segment
ORDER BY total_revenue DESC;

--Query 7: Marketing Channel Efficiency
SELECT 
    channel,
    COUNT(*) AS orders,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue_generated), 2) AS total_revenue_generated,
    ROUND(AVG(roas), 2) AS avg_roas
FROM quick_commerce_orders
GROUP BY channel
ORDER BY avg_roas DESC;

--Query 8: Rating/Sentiment vs Delivery Status
SELECT 
    delivery_status,
    COUNT(*) AS orders,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(100.0 * SUM(CASE WHEN sentiment = 'Positive' THEN 1 ELSE 0 END) / COUNT(*), 2) AS positive_sentiment_pct
FROM quick_commerce_orders
GROUP BY delivery_status
ORDER BY avg_rating DESC;

--Query 9: Rank Orders by Value Within Each Customer Segment (Window Function)
SELECT 
    order_id, customer_id, order_date, order_total,
    RANK() OVER (PARTITION BY customer_segment ORDER BY order_total DESC) AS rank_in_segment
FROM quick_commerce_orders;

--Query 10: Stores That Are Both High-Profit and High-SLA-Breach (CTE)
WITH store_profit AS (
    SELECT store_id, SUM(profit) AS total_profit
    FROM quick_commerce_orders GROUP BY store_id HAVING COUNT(*) >= 50
),
store_sla AS (
    SELECT store_id, AVG(sla_breach)*100 AS breach_rate
    FROM quick_commerce_orders GROUP BY store_id HAVING COUNT(*) >= 50
)
SELECT p.store_id, p.total_profit, s.breach_rate
FROM store_profit p JOIN store_sla s ON p.store_id = s.store_id
ORDER BY p.total_profit DESC, s.breach_rate DESC
LIMIT 10;