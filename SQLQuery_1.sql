
<-- All suppliers in country
Select * 
from dbo.Supplier 
where Country = 'UK';

Select CONCAT(FirstName, ' , ', LastName) as FullName, City from dbo.Customer;

Select * 
from dbo.Customer 
where Country = 'Sweden';

SELECT * 
FROM dbo.Supplier
ORDER BY CompanyName ASC;

Select *
FROM dbo.Supplier as sup
JOIN dbo.Product as pro on sup.Id = pro.SupplierId;

Select * 
FROM dbo.[Order]
as ord
JOIN dbo.Customer 
as cus on ord.CustomerId = cus.Id;

Select ord.Id, oi.ProductId, pro.ProductName,pro.UnitPrice,oi.Quantity
From dbo.[Order] as ord
JOIN dbo.OrderItem as oi 
on ord.id = oi.OrderId
Join dbo.Product as pro 
on oi.ProductId  = pro.Id
ORDER BY ord.OrderNumber;

SELECT 
Product.ProductName,
CASE
WHEN Product.IsDiscontinued = 0 THEN 'Not Available'
ELSE 'Available'
END AS Availability
FROM Product;

-- SELECT Distinct Supplier.Country
-- From Supplier;

SELECT Supplier.CompanyName, Supplier.Country,
CASE
        WHEN Supplier.Country IN ('Australia', 'New Zealand', 'Canada', 'UK', 'USA', 'Singapore') THEN 'English'
        WHEN Supplier.Country = 'Brazil' THEN 'Portuguese'
        WHEN Supplier.Country = 'Denmark' THEN 'Danish'
        WHEN Supplier.Country = 'Finland' THEN 'Finnish'
        WHEN Supplier.Country = 'France' THEN 'French'
        WHEN Country = 'Germany' THEN 'German'
        WHEN Country = 'Italy' THEN 'Italian'
        WHEN Country = 'Japan' THEN 'Japanese'
        WHEN Country = 'Netherlands' THEN 'Dutch'
        WHEN Country = 'Norway' THEN 'Norwegian'
        WHEN Country = 'Spain' THEN 'Spanish'
        WHEN Country = 'Sweden' THEN 'Swedish'
        ELSE 'Unknown'
    END AS LANGUAGE
FROM
Supplier;


SELECT Product.ProductName, Product.Package
From Product
where Product.Package like '%jars%';

SELECT Product.ProductName, Product.UnitPrice, Product.Package
FROM Product
WHERE Product.ProductName LIKE 'CA%';

SELECT 
    Supplier.Id,
    Supplier.CompanyName,
    COUNT(Product.Id) AS NumberOfProducts
FROM 
    Supplier
JOIN 
    Product ON Supplier.Id = Product.SupplierId
GROUP BY 
    Supplier.Id, Supplier.CompanyName
ORDER BY 
    NumberOfProducts DESC;

SELECT
Customer.Country,
COUNT(Customer.Id) NumberOfCustomers

FROM Customer

GROUP BY Customer.Country;


SELECT
Customer.Country,
COUNT(Customer.Id) AS NumberOfCustomers

FROM Customer

GROUP BY Customer.Country

ORDER BY
    NumberOfCustomers DESC;

-- Total order for each customer from high to low
Select 
Customer.Id, 
CONCAT(Customer.FirstName, ' ', Customer.LastName)  AS FullName, 
COUNT([Order].Id) as TotalOrder
FROM [Customer]
JOIN 
    [Order] ON Customer.Id = [Order].CustomerId
GROUP BY
    Customer.Id, CONCAT(Customer.FirstName, ' ', Customer.LastName)
ORDER BY
    TotalOrder DESC;


SELECT Supplier.Country,
COUNT(Supplier.Id) as NumberOfSupply
FROM Supplier
GROUP By 
Country
HAVING
COUNT(Supplier.Id) > 2;


SELECT
Customer.Country,
COUNT(Customer.Id) NumberOfCustomers
FROM Customer
GROUP BY Customer.Country
HAVING 
COUNT(Customer.Id) > 10;


SELECT
Customer.Country,
COUNT(Customer.Id) NumberOfCustomers
FROM Customer
WHERE Customer.Country !='USA'
GROUP BY Customer.Country
HAVING 
COUNT(Customer.Id) > 8;

SELECT
    Customer.Id,
    Customer.FirstName,
    Customer.LastName,
    AVG([Order].TotalAmount) AS AverageOrderAmount
FROM
    Customer
JOIN
    [Order] ON Customer.Id = [Order].CustomerId
GROUP BY
    Customer.Id, Customer.FirstName, Customer.LastName
HAVING
    AVG([Order].TotalAmount) BETWEEN 1000 AND 1200;
