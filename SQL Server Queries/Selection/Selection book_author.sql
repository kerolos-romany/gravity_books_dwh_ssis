SELECT b.book_id, b.title, b.isbn13, b.num_pages, b.publication_date,
       p.publisher_id, l.language_id
FROM book b
JOIN Publisher p ON b.publisher_id = p.publisher_id
JOIN Book_Language l ON b.language_id = l.language_id;