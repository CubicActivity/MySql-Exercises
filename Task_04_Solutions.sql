
-- 4.1 Select the title of all movies.
 Select Title from Movies;

-- 4.2 Show all the distinct ratings in the database.
 Select Distinct Rating from Movies;

-- 4.3  Show all unrated movies.
Select * from Movies where Rating is NULL;

-- 4.4 Select all movie theaters that are not currently showing a movie.
  Select * from MovieTheaters where Movie is NULL;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
	select * from MovieTheaters join Movies on MovieTheaters.Movie = Movies.Code;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
	 	select * from Movies left join MovieTheaters on Movies.Code = MovieTheaters.Movie;

-- 4.7 Show the titles of movies not currently being shown in any theaters.
	select Title from Movies inner join MovieTheaters on MovieTheaters.Movie = Movies.Code;

-- 4.8 Add the unrated movie "One, Two, Three".
insert into Movies values(9, 'One, Two, Three', NULL);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating = 'G' where Rating is Null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from MovieTheaters where Movie in (select Code from Movies where Rating='NC-17');
