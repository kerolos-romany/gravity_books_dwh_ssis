-- dim_book
SELECT [book_sk]
      ,[book_id]
  FROM [gravity_books_DWH].[dbo].[dim_book]


-- dim_customer
SELECT [customer_sk]
      ,[customer_id]
  FROM [gravity_books_DWH].[dbo].[dim_customer]


-- dim_order_status
SELECT [order_status_sk]
      ,[status_id]
  FROM [gravity_books_DWH].[dbo].[dim_order_status]


  -- dim_shipping
  SELECT TOP (1000) [shipping_sk]
      ,[method_id]
  FROM [gravity_books_DWH].[dbo].[dim_shipping]


  -- dim_date
  SELECT TOP (1000) [DateSK]
      ,[Date]
  FROM [gravity_books_DWH].[dbo].[DimDate]