-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head
	select * from client inner join Package on Package.Recipient = Client.AccountNumber where Weight=1.5; 

-- 7.2 What is the total weight of all the packages that he sent?
select sum(Weight) from client inner join Package on Package.Recipient = Client.AccountNumber; 
