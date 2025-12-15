CREATE TABLE fact_orderHeaders (
	orderheders_sk INT IDENTITY(1,1) PRIMARY KEY, -- Surrogate Key
    order_id int  null,
	received int  null, 
	PendingDelivery int  null,
	DeliveryInProgress int NULL, 
    delivered int NULL,
    cancelled int NULL,
    returned int NULL,
    customer_id INT NOT NULL,
    method_id INT NOT NULL,
    cost DECIMAL(6,2) NULL,
    status_id INT NULL,
);

