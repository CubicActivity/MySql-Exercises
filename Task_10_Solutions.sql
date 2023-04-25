-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
	use tempdb;
	select max(people.id),people.name ,max(addresses.address), min(addresses.updatedate) from addresses inner join people on people.id = addresses.id  group by people.name;

-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
select max(people.id), people.name ,max(addresses.address), max(addresses.updatedate) from addresses inner join people on people.id = addresses.id  group by people.name;
