
CREATE TABLE dim_book (
    book_sk INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT ,
    title varchar(400),
    isbn varchar(13),
    num_pages INT,
    publication_date DATE,
    language_name varchar(50),
    publisher_name varchar(400),
    start_date DATEtime,
    end_date DATEtime,
    iscurrent TINYINT,
    source_system_code TINYINT
);
