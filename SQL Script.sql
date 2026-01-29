use project_movie_database;
-- Can you get all data about movies?
select * from movies;
-- How do you get all data about directors?
select* from directors;
-- Check how many movies are present in IMDB.
select count(original_title) from movies;
-- Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name in ('James Cameron' , 'Luc Besson' , 'John Woo');
-- Find all directors with name starting with S.
select * from directors where name like 'S%';
-- Count female directors.
select count(*) as Female_Directors from directors where gender = 1 ;
-- Find the name of the 10th first women directors?
select name as Female_Director from directors where gender = 1 order by name limit 1 offset 9;
-- What are the 3 most popular movies?
 select original_title as movie_name, popularity from movies order by popularity desc limit 3;
 -- What are the 3 most bankable movies?
 select original_title as movie_name, (revenue - budget) as Bankable from movies order by Bankable desc limit 3;
 -- What is the most awarded average vote since the January 1st, 2000?
 select title, vote_average from movies where release_date >= 2000-01-01 order by vote_average desc;
 -- Which movie(s) were directed by Brenda Chapman?
 select * from movies where director_id = '4801';
 select m.title, d.name as director from movies as m left join directors as d on m.director_id=d.id where d.name = 'Brenda Chapman';
 -- Which director made the most movies
 select d.name as director_name , count(m.id) as total_movies from directors as d join movies as m on d.id = m.director_id group by d.name order by total_movies desc limit 1;
 -- Which director is the most bankable?
 select d.name as director_name, sum(m.revenue) as total_revenue from directors d join movies m on d.id=m.director_id group by d.name order by total_revenue desc limit 1;