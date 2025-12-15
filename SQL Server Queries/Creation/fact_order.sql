
CREATE TABLE fact_order (
    order_sk INT IDENTITY(1,1) PRIMARY KEY,
    book_sk INT,
    customer_sk INT,
    shipping_sk INT,
    order_status_sk INT,
    date_sk INT,
    price DECIMAL(10,2),

);
