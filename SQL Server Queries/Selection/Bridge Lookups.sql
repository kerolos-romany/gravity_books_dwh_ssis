-- lookup dim_book
SELECT TOP (1000) [book_sk]
      ,[book_id]
  FROM [gravity_books_DWH].[dbo].[dim_book]


-- lookup dim_author
SELECT TOP (1000) [author_sk]
      ,[author_id]
  FROM [gravity_books_DWH].[dbo].[dim_author]