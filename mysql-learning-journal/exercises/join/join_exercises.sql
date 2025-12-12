-- MULTI JOIN EXAMPLE
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName,
	p.Product,
	o.Sales,
	p.Price,
	e.FirstName

FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
on o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
on o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
on o.SalesPersonID = e.EmployeeID


/*Find the names of customers who have placed more than two orders.*/
SELECT c.first_name, c.last_name, COUNT(o.id) as order_count
            FROM customers c
            JOIN orders o ON c.id = o.customer_id
            GROUP BY c.id, c.first_name, c.last_name
            HAVING COUNT(o.id) > 2
            ORDER BY order_count DESC;

/*For order ID 1, list the names of the products ordered and their quantities.*/
SELECT p.name, oi.quantity
            FROM order_items oi
            JOIN products p ON oi.product_id = p.id
            WHERE oi.order_id = 1;

/*Find all customers who have not yet placed an order.*/            
SELECT c.first_name, c.last_name
            FROM customers c
            LEFT JOIN orders o ON c.id = o.customer_id
            WHERE o.id IS NULL;
            
/*Find customers who purchased product 2.*/
SELECT DISTINCT c.first_name, c.last_name FROM customers c JOIN orders o ON c.id = o.customer_id JOIN order_items oi ON o.id = oi.order_id WHERE oi.product_id = 2;

/*Find customers with at least 2 orders.*/
SELECT
c.first_name,
c.last_name,
COUNT(o.id) as order_count
FROM customers as C
JOIN orders as O
ON c.id = o.customer_id
GROUP BY 
c.first_name,
c.last_name
HAVING 
COUNT(o.id) >= 2

/*Compute the average value of all orders.*/
SELECT
AVG(order_total) AS avg_order_value
FROM (

SELECT SUM(oi.quantity*oi.price_per_unit) as order_total 
FROM orders AS o
JOIN order_items as oi
ON o.id = oi.order_id
GROUP BY o.id
) AS order_totals


/*Retrieve the first order date for every customer.*/
SELECT c.first_name,
c.last_name,
o.first_order
FROM customers AS c
JOIN (
SELECT customer_id, MIN(order_date) AS first_order FROM orders GROUP BY customer_id
) AS o
on c.id = o.customer_id

/*Count how many orders were placed each month in 2023.*/
SELECT
    MONTH(order_date) AS month,
    COUNT(*) AS orders_in_month
FROM orders
WHERE YEAR(order_date) = 2023
GROUP BY MONTH(order_date)
ORDER BY month;

/*List customers who have ordered products in the Electronics category.*/
SELECT DISTINCT c.first_name, c.last_name 
FROM customers c
JOIN orders o
on c.id = o.customer_id
JOIN order_items oi
on o.id = oi.order_id
JOIN products p
on oi.product_id = p.id
WHERE p.category = "Electronics"

/*Find orders that include more than three items in total.*/
SELECT
order_id,
SUM(quantity) total_items
FROM order_items
WHERE quantity > 3
GROUP BY order_id

/*Calculate how much customer 5 has spent across all orders.*/
SELECT SUM(oi.quantity*oi.price_per_unit) total_spent
FROM customers c
JOIN orders o
ON c.id = o.customer_id
JOIN order_items oi
ON o.id = oi.order_id
WHERE c.id = 5
GROUP BY c.id