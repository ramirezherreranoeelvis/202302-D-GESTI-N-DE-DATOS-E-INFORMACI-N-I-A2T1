SELECT
    SUM(OD.UnitPrice * OD.Quantity) AS 'TOTAL',
    O.ShipCountry
FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE DATEPART(YEAR, O.OrderDate) = '1997'
GROUP BY O.ShipCountry

SELECT
    SUM(OD.UnitPrice * OD.Quantity) AS 'TOTAL'
FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE DATEPART(YEAR, O.OrderDate) = '1997'
