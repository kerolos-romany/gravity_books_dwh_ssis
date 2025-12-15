

CREATE TABLE dim_customer (
    customer_sk INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    first_name varchar(200),
    last_name varchar(200),
    email varchar(350),
    street_num varchar(10),
    street_name varchar(200),
    city varchar(100),
    country_name varchar(200),
    start_date DATEtime,
    end_date DATEtime,
    iscurrent tinyint,
    source_system_code tinyint
);
