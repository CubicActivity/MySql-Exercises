use Task9;
-- 9.1 give the total number of recordings in this table
select count (*) from Task9.dbo.[cran_logs_2015-01-01];

-- 9.2 the number of packages listed in this table?
select count(distinct package ) from Task9.dbo.[cran_logs_2015-01-01];

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(distinct package ) from Task9.dbo.[cran_logs_2015-01-01] where package='"Rcpp"';

-- 9.4 How many recordings are from China ("CN")?
select * from Task9.dbo.[cran_logs_2015-01-01] where Country = '"CN"';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package, count(package) from Task9.dbo.[cran_logs_2015-01-01] group by package;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package, count(package) from Task9.dbo.[cran_logs_2015-01-01] where (time like '"09%') or (time like '"11%') group by package ;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select package, count(package) from Task9.dbo.[cran_logs_2015-01-01] where (country like '"CN"') or (time like '"JP"') or (time like '"SG"') group by package ;

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select country, count(country) from Task9.dbo.[cran_logs_2015-01-01]group by country having count(country)>(select count(country) from Task9.dbo.[cran_logs_2015-01-01] where country='"CN"');

-- 9.9 Print the average length of the package name of all the UNIQUE packages
select distinct package, avg(LEN(package)) from Task9.dbo.[cran_logs_2015-01-01] group by package;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT MAX(count(package)) FROM Task9.dbo.[cran_logs_2015-01-01] WHERE count(package) NOT IN ( SELECT MAX(count(package)) FROM Task9.dbo.[cran_logs_2015-01-01]);

-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package, count(package) from Task9.dbo.[cran_logs_2015-01-01]group by package having count(package)>1000 ;

-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
	select r_os,count(r_os) from Task9.dbo.[cran_logs_2015-01-01] group by r_os;

	
	

	