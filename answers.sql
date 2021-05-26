-- 1. Select all the records from the "Customers" table.
SELECT * FROM customers;

-- 2. Get distinct countries from the Customers table.
SELECT DISTINCT country FROM customers;

-- 3. Get all the records from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM customers 
    WHERE customer_id LIKE 'BL%';

-- 4. Get the first 100 records of the orders table.
SELECT * FROM customers LIMIT 100;

-- 5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM customers 
    WHERE postal_code IN ('1010', '3012', '12209', '05023');

-- 6. Get all orders where the ShipRegion is not equal to NULL.
-- NULL IS A KEYWORD, KEEP IT UPPERCASE
SELECT * FROM orders 
    WHERE ship_region IS NOT NULL;

-- 7. Get all customers ordered by the country, then by the city.
SELECT * FROM orders 
    ORDER BY ship_country, ship_city;

-- 8. Add a new customer to the customers table. You can use whatever values
INSERT INTO customers (customer_id, company_name, contact_name, contact_title, 
    address, city, region, postal_code, country, phone, fax)
    VALUES (69, 'Dunder Mifflin', 'Kevin Malone', 'Accountant', '1725 Slough Avenue', 'Scranton', 
	'Middle Atlantic', 18503, 'United States', 1-800-984-3672, 1-800-984-3672  );

-- 9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
UPDATE orders
	SET ship_region='EuroZone'
	WHERE ship_country='France';

-- 10. Delete all orders from `order_details` that have a quantity of 1. 
DELETE FROM order_details
	WHERE quantity=1;

-- 11. Calculate the average, max, and min of the quantity at the `order details` table.
-- COMMON PRACTICE TO INCLUDE WHAT YOU'RE GROUPING BY (ORDER_ID IN THIS CASE)
SELECT AVG(quantity) AS average, MAX(quantity) AS max, MIN(quantity) AS min, order_id
    FROM order_details;

-- 12. Calculate the average, max, and min of the quantity at the `order details` table, grouped by the orderid. 
SELECT AVG(quantity) AS average, MAX(quantity) AS max, MIN(quantity) AS min 
    FROM order_details 
    GROUP BY order_id;

-- 13. Find the CustomerID that placed order 10290 (orders table)
SELECT customer_id FROM orders WHERE order_id = 10290;

-- 14. Do an inner join, left join, right join on orders and customers tables.  (These are three separate queries, one for each type of join.)
SELECT orders.customer_id, customers.contact_name,  orders.order_id FROM orders
JOIN customers ON  orders.customer_id = customers.customer_id;

SELECT * FROM orders
RIGHT JOIN customers 
ON orders.customer_id = customers.customer_id;

SELECT employee_id, contact_title, contact_name FROM orders
LEFT JOIN customers 
ON orders.customer_id = customers.customer_id;

-- 15. Use a join to get the ship city and ship country of all the 
-- orders which are associated with an employee who is in London.
SELECT orders.ship_city, orders.ship_country FROM orders
LEFT JOIN employees
ON employees.city = 'London';

-- 16. Use a join to get the ship name of all orders that include a 
-- discontinued product. (See orders, order_details, and products. 
-- 1 means discontinued.)
SELECT orders.ship_name FROM orders
JOIN order_details
ON order_details.order_id = orders.order_id
JOIN products
ON products.product_id = order_details.product_id
WHERE products.discontinued=1;

-- 17. Get first names of all employees who report to no one.
SELECT first_name FROM employees WHERE reports_to IS null;

-- 18. Get first names of all employees who report to Andrew.
SELECT first_name FROM employees 
WHERE reports_to = 2;

