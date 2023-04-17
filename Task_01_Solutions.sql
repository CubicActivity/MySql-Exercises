
-- 1.1 Select the names of all the products in the store.
SELECT Name FROM Products;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT Name,Price FROM Products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT Name FROM Products WHERE Price<=200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT Name FROM Products WHERE Price>=60 AND Price<=120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name,Price*100 AS Cents FROM Products;

-- 1.6 Compute the average price of all the products.
SELECT AVG(Price) AS AveragePrice FROM Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) AS AveragePrice FROM Products WHERE Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(Code) AS ExpensiveProducts from Products WHERE Price>=180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name,Price from Products WHERE Price>=180 ORDER BY Price DESC, Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
Select * from Products INNER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
Select Products.Name, Products.Price, Manufacturers.Name from Products INNER JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code. 
SELECT Manufacturer as Code, AVG(Price) as AvgProdPrice FROM Products GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT Manufacturers.Name, AVG(Price) as AvgProdPrice FROM Products,Manufacturers GROUP BY Manufacturers.Name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT Manufacturer as Code, AVG(Price) as AvgProdPrice FROM Products GROUP BY Manufacturer HAVING AVG(Price) >=150;


-- 1.15 Select the name and price of the cheapest product.
SELECT Name,Price from Products where Price = (SELECT Min(Price) from Products);


-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name
from 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     as max_price_mapping
   left join
     (select products.*, manufacturers.name manu_name
      from products join manufacturers
      on (products.manufacturer = manufacturers.code))
      as products_with_manu_name
 on
   (max_price_mapping.name = products_with_manu_name.manu_name
    and
    max_price_mapping.price = products_with_manu_name.price); 

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
Insert into Products Values(11,'Loudspeakers', 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE Products set Name= 'product 8' where Code=8;

-- 1.19 Apply a 10% discount to all products.
UPDATE Products set Price=Price*0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products set Price=Price*0.9 Where Price>=120;

