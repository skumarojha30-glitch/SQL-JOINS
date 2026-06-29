CREATE DATABASE SQLJOINSASSIGNMENT
USE SQLJOINSASSIGNMENT

CREATE TABLE CUSTOMERS
(CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(50));
    
CREATE TABLE ORDERS
( OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount INT);
    
CREATE TABLE PAYMENTS
(PaymentID VARCHAR(10) PRIMARY KEY,
CustomerID INT,
PaymentDate DATE,
Amount INT);

CREATE TABLE Employees
( EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
ManagerID INT);

INSERT INTO Customers VALUES
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Robert White','Houston'),
(5,'Nancy Miller','Miami');

INSERT INTO Orders VALUES
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,6,'2024-10-10',450),
(105,3,'2024-10-12',400);

INSERT INTO Payments VALUES
('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200);

INSERT INTO Employees VALUES
(1,'Alex Green',NULL),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);

-Question1-. Retrieve all customers who have placed at least one order.

SELECT DISTINCT c.* from customers as c left join orders as o on c.CustomerID = o.CustomerID;

-Question2-. Retrieve all customers and their orders, including customers who have not placed any orders.

select * from customers as c left join orders as o on c.CustomerID = o.CustomerID;

-Question3-. Retrieve all orders and their corresponding customers, including orders placed by unknown 
customers.

Select * from customers as c right join orders as o on c.CustomerID = o.CustomerID;

-Question-4. Display all customers and orders, whether matched or not.

select * from customers as c left join orders as o on c.CustomerID = o.CustomerID
UNION
select * from customers as c right join orders as o on c.CustomerID = o.CustomerID;

-Question-5. Find customers who have not placed any orders.

select * from customers as c left join orders as o on c.CustomerID = o.CustomerID
where o.OrderID IS NULL

-Question-6. Retrieve customers who made payments but did not place any orders.

SELECT c.* from customers as c inner join payments as p on c.CustomerID = p.CustomerID
left join orders as o on c.CustomerID = o.CustomerID
where o.OrderID is NULL;

-Question-7. Generate a list of all possible combinations between Customers and Orders.

SELECT * FROM customers cross join orders

Question-8. Show all customers along with order and payment amounts in one table.

select
c.CustomerName,
o.Amount ,
p.Amount 
 from customers as c left join orders as o on c.CustomerID = o.CustomerID
left join payments as p on c.CustomerID = p.CustomerID;

-Question 9. Retrieve all customers who have both placed orders and made payments.

SELECT DISTINCT C.*
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN Payments P
ON C.CustomerID = P.CustomerID;










