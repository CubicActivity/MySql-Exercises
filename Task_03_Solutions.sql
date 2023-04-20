-- The Warehouse

--3.1 Select all warehouses.
 select * from Warehouses;

--3.2 Select all boxes with a value larger than $150.
 select * from Boxes where Value >=150;

--3.3 Select all distinct contents in all the boxes.
select distinct Contents from Boxes;

--3.4 Select the average value of all the boxes.
select AVG(Value) as AverageVal from Boxes;

--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse, avg(value) from boxes group by warehouse;

--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse, avg(value) from boxes group by warehouse having avg(value)>=150;

--3.7 Select the code of each box, along with the name of the city the box is located in.
select Boxes.Code, Warehouses.Location from Boxes inner join Warehouses on Boxes.Warehouse=Warehouses.Code;

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
	select Warehouse, count(*) from Boxes group by Warehouse;

--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select Code from Warehouses where Capacity< (select count(*) from Boxes where Warehouse = Warehouses.Code);


--3.10 Select the codes of all the boxes located in Chicago.
select * from Boxes inner join Warehouses on Boxes.Warehouse = Warehouses.Code where Warehouses.Location = 'Chicago';


--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into Warehouses values(6,'New York', 3);

--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into Boxes values('H5RT', 'Papers', 200,2);

--3.13 Reduce the value of all boxes by 15%.
update Boxes set Value = Value*0.85;

--3.14 Remove all boxes with a value lower than $100.
 delete Boxes Where Value<100;

-- 3.15 Remove all boxes from saturated warehouses.
Delete from Boxes where Warehouse in (Select Code from Warehouses where Capacity<(Select Count(*) from Boxes where Warehouse=Warehouses.Code));

-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
	create index index_1 on Boxes (Warehouse);

-- 3.17 Print all the existing indexes
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
	SELECT 
     TableName = t.name,
     IndexName = ind.name,
     IndexId = ind.index_id,
     ColumnId = ic.index_column_id,
     ColumnName = col.name,
     ind.*,
     ic.*,
     col.* 
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN 
     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
WHERE 
     ind.is_primary_key = 0 
     AND ind.is_unique = 0 
     AND ind.is_unique_constraint = 0 
     AND t.is_ms_shipped = 0 
ORDER BY 
     t.name, ind.name, ind.index_id, ic.is_included_column, ic.key_ordinal;

-- 3.18 Remove (drop) the index you added just
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
	drop index index_1 on Boxes;
