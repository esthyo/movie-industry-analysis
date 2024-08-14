-- ALTER TABLE movie_table
-- DROP COLUMN release_year;

-- ALTER TABLE movie_table
-- ADD COLUMN release_year integer;

-- ALTER TABLE movie_table
-- ALTER COLUMN rating DROP NOT NULL;

-- ALTER TABLE movie_table
-- ALTER COLUMN rating SET NOT NULL;

-- ALTER TABLE movie_table 
-- RENAME COLUMN "watch_time" 
-- TO watchTime_inMinutes;

-- DROP TABLE IF EXISTS movie_table CASCADE;
-- DROP TABLE IF EXISTS movie_genre_table CASCADE;
-- DROP TABLE IF EXISTS genre_table CASCADE;
-- DROP TABLE IF EXISTS director_table CASCADE;
-- DROP TABLE IF EXISTS countries_table CASCADE;
-- DROP TABLE IF EXISTS language_table CASCADE;

-- The CASCADE option will automatically drop any dependent objects like foreign key constraints.

CREATE TABLE "movie_table" (
    "movie_id" varchar(15) NOT NULL,
    "title" varchar(150) NOT NULL,
    "release_year" int NOT NULL,
    "rating" varchar(20) NOT NULL,
    "watch_time" int NOT NULL,
    "number_of_views" int NOT NULL,
    "imbd_rating" numeric(6,2) NOT NULL,
    "awards_won" int NOT NULL,
    "budget" int NOT NULL,
    "box_office_revenue" int NOT NULL,
    "genre_id" varchar(15) NOT NULL,
    "director_id" varchar(150) NOT NULL,
    "country_id" varchar(150) NOT NULL,
    "language_id" varchar(150) NOT NULL,
    CONSTRAINT "pk_movie_table" PRIMARY KEY ("movie_id")
);
--  after running this table(movie_table), run the copy the csv file


CREATE TABLE "genre_table" (
    "genre_id" varchar(15) NOT NULL,
    "genre_name" varchar(150) NOT NULL,
    CONSTRAINT "pk_genre_table" PRIMARY KEY ("genre_id")
);
--  after running this table(genre_table), run the copy the csv file

CREATE TABLE "director_table" (
    "director_id" varchar(150) NOT NULL,
    "director_name" varchar(150) NOT NULL,
    CONSTRAINT "pk_director_table" PRIMARY KEY ("director_id")
);

CREATE TABLE "countries_table" (
    "country_id" varchar(150) NOT NULL,
    "country_name" varchar(150) NOT NULL,
    CONSTRAINT "pk_countries_table" PRIMARY KEY ("country_id")
);

CREATE TABLE "language_table" (
    "language_id" varchar(150) NOT NULL,
    "language_name" varchar(150) NOT NULL,
    CONSTRAINT "pk_language_table" PRIMARY KEY ("language_id")
);

CREATE TABLE "movie_genre_table" (
    "movie_id" varchar(15) NOT NULL,
    "genre_id" varchar(15) NOT NULL,
    CONSTRAINT "pk_movie_genre_table" PRIMARY KEY ("movie_id", "genre_id")
);

-- Alter is the last thing to run after running the copy csv file
ALTER TABLE "movie_table" ADD CONSTRAINT "fk_movie_table_genre_id" FOREIGN KEY ("genre_id")
REFERENCES "genre_table" ("genre_id");

ALTER TABLE "movie_table" ADD CONSTRAINT "fk_movie_table_director_id" FOREIGN KEY ("director_id")
REFERENCES "director_table" ("director_id");

ALTER TABLE "movie_table" ADD CONSTRAINT "fk_movie_table_country_id" FOREIGN KEY ("country_id")
REFERENCES "countries_table" ("country_id");

ALTER TABLE "movie_table" ADD CONSTRAINT "fk_movie_table_language_id" FOREIGN KEY ("language_id")
REFERENCES "language_table" ("language_id");


COPY contries_table
FROM 'C:\Users\USER\Desktop\movie datasets\country.csv'
DELIMITER ',' 
CSV HEADER;

--Basic Overview
-- How many movies are in the dataset?
SELECT Count(title) AS "Number of movies"
FROM movie_table;

--What is the distribution of movies by genre?
SELECT DISTINCT(g.genre_name), count(m.movie_id) AS "Number of movies"
FROM movie_table m
JOIN genre_table g 
ON m.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY "Number of movies" DESC;

--Which movies have the highest and lowest ratings?
SELECT title, imbd_rating AS "Highest rating"
FROM movie_table
ORDER BY imbd_rating DESC
LIMIT 10;

SELECT title, imbd_rating As "lowest rating"
FROM movie_table
ORDER BY imbd_rating ASC
LIMIT 10;


--Advanced Analysis:
--Which directors have the most movies in the dataset?
SELECT DISTINCT(d.director_name), COUNT(DISTINCT(m.movie_id)) AS "Number of director movies", sum(box_office_revenue) AS total_revenue
FROM movie_table m
JOIN director_table d
ON m.director_id = d.director_id
GROUP BY d.director_name 
ORDER BY "Number of director movies" DESC;

--What is the average box office revenue by genre?
SELECT DISTINCT(g.genre_name), ROUND(AVG(m.box_office_revenue)) AS "Average Revenue by genre"
FROM movie_table m
JOIN genre_table g 
ON m.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY "Average Revenue by genre" DESC;

--Which countries produce the highest-rated movies?
SELECT DISTINCT(c.country), COUNT(m.movie_id) AS "Countries with highest-rated movies"
FROM movie_table m
JOIN contries_table c
ON m.country_id = c.country_id
GROUP BY c.country
ORDER BY "Countries with highest-rated movies" DESC;


-- Time-based Analysis:
-- How has the average movie rating changed over the years?
SELECT DISTINCT(release_year), ROUND(AVG(imbd_rating),2) AS avg_rating
FROM movie_table
GROUP BY release_year
ORDER BY release_year;

--What trends can be observed in box office revenue over time?
SELECT release_year,
ROUND(AVG(box_office_revenue),2) AS avg_revenue, 
SUM(box_office_revenue) AS sum_revenue,
COUNT(box_office_revenue) AS count_movie
FROM movie_table
GROUP BY release_year
ORDER BY sum_revenue DESC;

--Top Genres by Box Office Revenue
SELECT DISTINCT(g.genre_name), SUM(m.box_office_revenue)
FROM movie_table m
JOIN genre_table g
ON m.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY g.genre_name DESC;



