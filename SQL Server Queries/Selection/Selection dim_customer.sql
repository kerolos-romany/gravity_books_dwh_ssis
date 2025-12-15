SELECT 
    c.customer_id,c.first_name,c.last_name,c.email,
    a.address_id,a.street_number,a.street_name,a.city,
    co.country_name,s.address_status AS address_status
FROM customer c
JOIN customer_address ca 
    ON c.customer_id = ca.customer_id
JOIN address a 
    ON ca.address_id = a.address_id
JOIN address_status s 
    ON ca.status_id = s.status_id
join country co on a.country_id = co.country_id;
