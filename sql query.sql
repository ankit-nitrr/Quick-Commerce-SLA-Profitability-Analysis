-- SECTION 1 Overall SLA Breach Rate
--Q.What percentage of orders breached SLA?
SELECT
ROUND(
100.0 * SUM(sla_breach::int) / COUNT(*),
2
) AS sla_breach_rate
FROM ecommerce_data;

--AVERAGE DELIVERY DELAY
--Q.How many minutes on average are orders delayed?
SELECT
    ROUND(
        AVG(delay_minutes),
        2
    ) AS avg_delay_minutes
FROM ecommerce_data;

--SLA Breach by Peak Period
--Q.Which time period has the highest SLA failures?
SELECT
    peak_period,
    COUNT(*) AS total_orders,
    SUM(sla_breach::INT) AS breached_orders,
    ROUND(
        100.0 * SUM(sla_breach::INT) / COUNT(*),
        2
    ) AS breach_rate
FROM ecommerce_data
GROUP BY peak_period
ORDER BY breach_rate DESC;

--Top 10 Stores with Highest Delays
--Identify poorly performing stores
SELECT
    store_id,
    COUNT(*) AS total_orders,
    ROUND(
        AVG(delay_minutes),
        2
    ) AS avg_delay
FROM ecommerce_data
GROUP BY store_id
ORDER BY avg_delay DESC
LIMIT 10;

--Customer Segment vs SLA Breach
--Q.Which customer segment is most affected?
SELECT
    customer_segment,
    COUNT(*) AS total_orders,
    SUM(sla_breach::INT) AS breached_orders,
    ROUND(
        100.0 * SUM(sla_breach::INT) / COUNT(*),
        2
    ) AS breach_rate
FROM ecommerce_data
GROUP BY customer_segment
ORDER BY breach_rate DESC;


------------------------------------------------------
--SECTION 2 – PROFITABILITY ANALYSIS
--Total Profit Generated
--Q How much total profit has the business generated?
SELECT
ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_data;

--Top Profit Generating Campaigns
--Q
SELECT
campaign_name,
ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_data
GROUP BY campaign_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
campaign_name,
ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_data
GROUP BY campaign_name
ORDER BY total_profit ASC
LIMIT 10;

SELECT
channel,
ROUND(SUM(profit),2) AS total_profit
FROM ecommerce_data
GROUP BY channel
ORDER BY total_profit DESC;

SELECT
campaign_name,
ROUND(AVG(roas),2) AS avg_roas
FROM ecommerce_data
GROUP BY campaign_name
ORDER BY avg_roas DESC;