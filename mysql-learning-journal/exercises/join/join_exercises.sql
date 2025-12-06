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