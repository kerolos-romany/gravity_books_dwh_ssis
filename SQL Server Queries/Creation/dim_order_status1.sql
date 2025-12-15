


CREATE TABLE dim_order_status (
    order_status_sk INT IDENTITY(1,1) PRIMARY KEY,
    order_sk INT,
    status_id INT,
    status_name varchar(20),
    start_date DATEtime,
    end_date DATEtime,
    iscurrent tinyint,
    source_system_code tinyint
);
