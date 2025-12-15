SELECT 
    o.order_id,

    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'Order Received' THEN oh.status_date END), 'yyyyMMdd')) AS received_dateSK,
    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'Pending Delivery' THEN oh.status_date END), 'yyyyMMdd')) AS PendingDelivery_dateSK,
    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'Delivery In Progress' THEN oh.status_date END), 'yyyyMMdd')) AS DeliveryInProgress_dateSK,
    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'delivered' THEN oh.status_date END), 'yyyyMMdd')) AS delivered_dateSK,
    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'cancelled' THEN oh.status_date END), 'yyyyMMdd')) AS cancelled_dateSK,
    CONVERT(INT, FORMAT(MAX(CASE WHEN os.status_value = 'returned' THEN oh.status_date END), 'yyyyMMdd')) AS returned_dateSK,

    o.customer_id,
    o.shipping_method_id AS method_id,
    sm.cost,
    MAX(oh.status_id) AS status_id 

FROM cust_order o
LEFT JOIN order_history oh
    ON o.order_id = oh.order_id
LEFT JOIN order_status os
    ON oh.status_id = os.status_id
LEFT JOIN shipping_method sm
    ON o.shipping_method_id = sm.method_id
GROUP BY 
    o.order_id, o.customer_id, o.shipping_method_id, sm.cost