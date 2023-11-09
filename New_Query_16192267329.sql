-- Active: 16192267329@@127.0.0.1@3306@reallife
-- TASK ONE
SELECT 
    c.id, 
    c.name AS name, 
    c.email, 
    c.location, 
    COUNT(o.id) AS total_orders
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.id = o.cust_id
GROUP BY 
    c.id, c.name, c.email, c.location
ORDER BY 
    total_orders DESC;


-- TASK TWO
SELECT 
    o.id,
    p.name AS name,
    oi.quantity,
    (oi.quantity * oi.unit_price) AS total_amount
FROM 
    Order_Items oi
JOIN 
    Orders o ON oi.id = o.id
JOIN 
    Products p ON oi.product_ID = p.id
ORDER BY 
    o.id ASC;


-- TASK THREE
SELECT 
    c.name AS category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM 
    Categories c
JOIN 
    Products p ON c.id = p.cat_id
JOIN 
    Order_Items oi ON p.id = oi.product_ID
GROUP BY 
    c.name
ORDER BY 
    total_revenue DESC;


-- TASK FOUR
SELECT 
    c.name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_purchase_amount
FROM 
    Customers c
JOIN 
    Orders o ON c.id = o.cust_id
JOIN 
    Order_Items oi ON o.id = oi.Order_id
GROUP BY 
    c.name
ORDER BY 
    total_purchase_amount DESC
LIMIT 5;
