create database salestrends;
use salestrends;
CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(20)
);
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
('O001', '2024-01-05', 120.50, 'P001'),
('O002', '2024-01-12', 300.00, 'P002'),
('O003', '2024-02-03', 150.75, 'P003'),
('O004', '2024-02-10', 200.00, 'P001'),
('O005', '2024-03-15', 90.25,  'P004'),
('O006', '2024-03-18', 500.00, 'P002'),
('O007', '2024-03-20', 250.00, 'P003');
select * from orders;
select extract(month from order_date) from orders;
select sum(amount) as revenue from orders;
select product_id,min(order_id) from orders group by product_id;
select order_id from orders where product_id="P001";
select count(distinct order_id) from orders;
select amount from orders order by amount; # ascending
select amount from orders order by amount desc; # descending
select product_id from orders where order_date between '2024-01-01' and '2024-12-12';
select sum(amount) from orders group by month(order_date);
SELECT
    YEAR(order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31' 
GROUP BY YEAR(order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;
