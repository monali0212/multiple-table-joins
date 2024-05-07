create database sqlproject;
use sqlproject;
show tables;
describe artist;
describe work;
describe museum;
describe product_size;
describe canvas_size;
-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.
SELECT 
    a.full_name AS artist_name,
    w.name AS work_name,
    m.name AS museum_name
FROM 
    artist a
JOIN 
    work w ON a.artist_id = w.artist_id
JOIN 
    museum m ON w.museum_id = m.museum_id;

#along with the count of their works, ordered by the count in descending order.
SELECT 
    a.full_name AS artist_name,
    COUNT(w.work_id) AS work_count,
    m.name AS museum_name
FROM 
    artist a
JOIN 
    work w ON a.artist_id = w.artist_id
JOIN 
    museum m ON w.museum_id = m.museum_id
GROUP BY 
    a.artist_id, a.full_name, m.name
ORDER BY 
    work_count DESC;



-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

SELECT 
    m.name AS museum_name,
    COUNT(w.work_id) AS work_count
FROM 
    museum m
JOIN 
    work w ON m.museum_id = w.museum_id
GROUP BY 
    m.museum_id, m.name
ORDER BY 
    work_count DESC
LIMIT 5;



-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.

SELECT 
    w.name AS work_name,
    w.style AS work_style,
    m.name AS museum_name
FROM 
    work w
JOIN 
    museum m ON w.museum_id = m.museum_id
ORDER BY 
    m.name ASC
LIMIT 10;



-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

SELECT 
    a.full_name AS artist_name,
    SUM(ps.sale_price) AS total_sale_price
FROM 
    artist a
JOIN 
    work w ON a.artist_id = w.artist_id
JOIN 
    product_size ps ON w.work_id = ps.work_id
GROUP BY 
    a.artist_id, a.full_name
ORDER BY 
    total_sale_price DESC;




-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.

SELECT 
    a.artist_id,
    a.full_name AS artist_name,
    COUNT(w.work_id) AS work_count
FROM 
    artist a
JOIN 
    work w ON a.artist_id = w.artist_id
GROUP BY 
    a.artist_id, a.full_name
HAVING 
    COUNT(w.work_id) > 3;



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
SELECT 
    w.name AS work_name,
    a.full_name AS artist_name
FROM 
    work w
JOIN 
    artist a ON w.artist_id = a.artist_id
JOIN 
    product_size ps ON w.work_id = ps.work_id
WHERE 
    ps.sale_price < ps.regular_price
ORDER BY 
    w.name;




-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width
  SELECT 
    AVG(cs.width) AS average_width,
    AVG(cs.height) AS average_height
FROM 
    work w
JOIN 
    product_size ps ON w.work_id = ps.work_id
JOIN 
    canvas_size cs ON ps.size_id = cs.size_id;



-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

SELECT 
    m.name AS museum_name,
    MAX(ps.sale_price) AS max_sale_price
FROM 
    museum m
JOIN 
    work w ON m.museum_id = w.museum_id
JOIN 
    product_size ps ON w.work_id = ps.work_id
GROUP BY 
    m.museum_id, m.name;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name, ', ', a.nationality) AS artist_info,
    COUNT(w.work_id) AS work_count
FROM 
    artist a
JOIN 
    work w ON a.artist_id = w.artist_id
GROUP BY 
    a.artist_id, a.first_name, a.last_name, a.nationality
ORDER BY 
    work_count DESC;




