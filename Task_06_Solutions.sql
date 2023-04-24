-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
		select Scientists.Name,Projects.Name,Projects.Hours from scientists inner join AssignedTo on Scientists.SSN= AssignedTo.Scientist inner join Projects on Projects.Code = AssignedTo.Project order by Projects.Name,Scientists.Name;

-- 6.2 Select the project names which are not assigned yet
select * from projects where Code not in (select Project from AssignedTo);

