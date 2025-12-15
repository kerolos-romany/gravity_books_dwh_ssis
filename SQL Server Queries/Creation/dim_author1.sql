

CREATE TABLE dim_author (
    author_sk INT IDENTITY(1,1) PRIMARY KEY,
    author_id INT,
    author_name varchar(400),
    start_date DATEtime,
    end_date DATEtime,
    iscurrent tinyint,
    source_system_code tinyint
);
