SELECT 
    co.order_id,
    ol.book_id,
    co.customer_id,
    co.shipping_method_id,
    oh.status_id,         
    CAST(FORMAT(co.order_date, 'yyyyMMdd') AS INT) AS order_date,
    ol.price
FROM cust_order co
JOIN order_line ol 
    ON co.order_id = ol.order_id
OUTER APPLY (
    SELECT TOP 1 o.status_id
    FROM order_history o
    WHERE o.order_id = co.order_id
    ORDER BY o.status_date DESC
) oh;