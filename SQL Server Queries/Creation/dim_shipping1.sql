

CREATE TABLE dim_shipping (
    shipping_sk INT IDENTITY(1,1) PRIMARY KEY,
    method_id INT,
    method_name varchar(100),
    start_date DATEtime,
    end_date DATEtime,
    iscurrent tinyint,
    source_system_code tinyint
);
