-- pedidos que no han sido atendidos por
-- los empleados 1, 2, 3, 4 y 5
SELECT * FROM Northwind..ORDERS
WHERE EmployeeID != ALL( SELECT EmployeeID
FROM Northwind..Employees
WHERE EmployeeID <= 5);
GO