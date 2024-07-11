USE bestbuy;

/* 1 joins: select all the computers from the products table:*/
SELECT products.Name, categories.Name FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.Name IN ('Computers');

/* 2 joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, Price, reviews.Rating FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE Rating = 5;

/* 3 joins: find the employee with the most total quantity sold.  use the sum() function and group by*/
SELECT employees.EmployeeID,FirstName,LastName, SUM(Quanitity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
HAVING SUM(Quantity) = (
	-- Sub Query Select to get the 37 or  or w/e values
    SELECT SUM(Quantity)
    FROM employees
    INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
    GROUP BY employees.EmployeeID
    ORDER BY SUM(Quantity) DESC
    LIMIT 1
    
);


/* 4 joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS DepartmentName, categories.Name AS CategoryName
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name LIKE 'Appliances' OR categories.Name LIKE 'Games';

/* 5 joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, SUM(Quantity), SUM(PricePerUnit *  Quantity)
 FROM products
 INNER JOIN sales ON products.ProductID = sales.ProductID
 WHERE products.NAME like '%Hotel California%'
 GROUP BY products.Name;
 
 /* 6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, Rating, Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE '%Visio TV%'
ORDER BY Rating
LIMIT 1;
SELECT * FROM employees;
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, FirstName, LastName, products.Name, Quantity
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID;
