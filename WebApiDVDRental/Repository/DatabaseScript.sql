CREATE DATABASE [DVDRental]
GO

USE [DVDRental]
GO

CREATE TABLE actor (
	[actor_id] int identity(1,1) NOT NULL,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	last_update datetime NOT NULL DEFAULT GETDATE(),
	CONSTRAINT actor_pkey PRIMARY KEY (actor_id)
);
GO

CREATE TABLE category (
	category_id int identity(1,1) NOT NULL ,
	name varchar(25) NOT NULL,
	last_update datetime NOT NULL DEFAULT GETDATE(),
	CONSTRAINT category_pkey PRIMARY KEY (category_id)
);
GO

CREATE TABLE film (
	film_id int IDENTITY(1,1) NOT NULL ,
	title varchar(255) NOT NULL,
	description text,
	release_year int,
	language_id varchar(2) NOT NULL DEFAULT 1,
	rental_duration int NOT NULL DEFAULT 3,
	rental_rate numeric NOT NULL DEFAULT 4.99,
	length int,
	replacement_cost numeric NOT NULL DEFAULT 19.99,
	rating varchar(13) DEFAULT 'G',
	last_update datetime NOT NULL DEFAULT GETDATE(),
	special_features text,
	CONSTRAINT film_pkey PRIMARY KEY (film_id)	
);
GO


CREATE TABLE film_actor (
	actor_id int NOT NULL,
	film_id int NOT NULL,
	last_update datetime NOT NULL DEFAULT getdate(),
	CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id,film_id),
	CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ,
	CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id) 
);
GO

CREATE TABLE film_category (
	film_id int NOT NULL,
	category_id int NOT NULL,
	last_update datetime DEFAULT getdate(),
	CONSTRAINT film_category_pkey PRIMARY KEY (film_id,category_id),
	CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(category_id),
	CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES film(film_id)
);
GO

SET IDENTITY_INSERT film ON
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
1,'Academy Dinosaur','A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies',2006,1,6,0.99,86,20.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
2,'Ace Goldfinger','A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China',2006,1,3,4.99,48,12.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
3,'Adaptation Holes','A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory',2006,1,7,2.99,50,18.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
4,'Affair Prejudice','A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank',2006,1,5,2.99,117,26.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
5,'African Egg','A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico',2006,1,6,2.99,130,22.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
6,'Agent Truman','A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China',2006,1,3,2.99,169,17.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
7,'Airplane Sierra','A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat',2006,1,6,4.99,62,28.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
8,'Airport Pollock','A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India',2006,1,6,4.99,54,15.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
9,'Alabama Devil','A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat',2006,1,3,2.99,114,21.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
10,'Aladdin Calendar','A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China',2006,1,6,4.99,63,24.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
11,'Alamo Videotape','A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention',2006,1,6,0.99,126,16.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
12,'Alaska Phantom','A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia',2006,1,6,0.99,136,22.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
213,'Date Speed','A Touching Saga of a Composer And a Moose who must Discover a Dentist in A MySQL Convention',2006,1,4,0.99,104,19.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
13,'Ali Forever','A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies',2006,1,4,4.99,150,21.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
14,'Alice Fantasia','A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia',2006,1,6,0.99,94,23.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
15,'Alien Center','A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention',2006,1,5,2.99,46,10.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
16,'Alley Evolution','A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans',2006,1,6,2.99,180,23.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
17,'Alone Trip','A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House',2006,1,3,0.99,82,14.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
18,'Alter Victory','A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies',2006,1,6,0.99,57,27.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
19,'Amadeus Holy','A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon',2006,1,6,0.99,113,20.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
20,'Amelie Hellfighters','A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon',2006,1,4,4.99,79,23.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
21,'American Circus','A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank',2006,1,3,4.99,129,17.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
22,'Amistad Midsummer','A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California',2006,1,6,2.99,85,10.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
23,'Anaconda Confessions','A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia',2006,1,3,0.99,92,9.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
24,'Analyze Hoosiers','A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert',2006,1,6,2.99,181,19.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
25,'Angels Life','A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin',2006,1,3,2.99,74,15.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
26,'Annie Identity','A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park',2006,1,3,0.99,86,15.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
27,'Anonymous Human','A Amazing Reflection of a Database Administrator And a Astronaut who must Outrace a Database Administrator in A Shark Tank',2006,1,7,0.99,179,12.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
28,'Anthem Luke','A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park',2006,1,5,4.99,91,16.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
29,'Antitrust Tomatoes','A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India',2006,1,5,2.99,168,11.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
30,'Anything Savannah','A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House',2006,1,4,2.99,82,27.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
31,'Apache Divine','A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat',2006,1,5,4.99,92,16.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
32,'Apocalypse Flamingos','A Astounding Story of a Dog And a Squirrel who must Defeat a Woman in An Abandoned Amusement Park',2006,1,6,4.99,119,11.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
33,'Apollo Teen','A Action-Packed Reflection of a Crocodile And a Explorer who must Find a Sumo Wrestler in An Abandoned Mine Shaft',2006,1,5,2.99,153,15.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
34,'Arabia Dogma','A Touching Epistle of a Madman And a Mad Cow who must Defeat a Student in Nigeria',2006,1,6,0.99,62,29.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
35,'Arachnophobia Rollercoaster','A Action-Packed Reflection of a Pastry Chef And a Composer who must Discover a Mad Scientist in The First Manned Space Station',2006,1,4,2.99,147,24.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
36,'Argonauts Town','A Emotional Epistle of a Forensic Psychologist And a Butler who must Challenge a Waitress in An Abandoned Mine Shaft',2006,1,7,0.99,127,12.99,'PG-13','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
37,'Arizona Bang','A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery',2006,1,3,2.99,121,28.99,'PG','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
38,'Ark Ridgemont','A Beautiful Yarn of a Pioneer And a Monkey who must Pursue a Explorer in The Sahara Desert',2006,1,6,0.99,68,25.99,'NC-17','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
39,'Armageddon Lost','A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft',2006,1,5,0.99,99,10.99,'G','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
40,'Army Flintstones','A Boring Saga of a Database Administrator And a Womanizer who must Battle a Waitress in Nigeria',2006,1,4,0.99,148,22.99,'R','2013-05-26 14:50:58');
INSERT INTO film (film_id,title,description,release_year,language_id,rental_duration,rental_rate,length,replacement_cost,rating,last_update) VALUES (
41,'Arsenic Independence','A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin',2006,1,4,0.99,137,17.99,'PG','2013-05-26 14:50:58');
SET IDENTITY_INSERT film OFF
GO

SET IDENTITY_INSERT actor ON
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
1,'Penelope','Guiness','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
2,'Nick','Wahlberg','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
3,'Ed','Chase','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
4,'Jennifer','Davis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
5,'Johnny','Lollobrigida','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
6,'Bette','Nicholson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
7,'Grace','Mostel','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
8,'Matthew','Johansson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
9,'Joe','Swank','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
10,'Christian','Gable','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
11,'Zero','Cage','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
12,'Karl','Berry','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
13,'Uma','Wood','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
14,'Vivien','Bergen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
15,'Cuba','Olivier','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
16,'Fred','Costner','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
17,'Helen','Voight','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
18,'Dan','Torn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
19,'Bob','Fawcett','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
20,'Lucille','Tracy','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
21,'Kirsten','Paltrow','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
22,'Elvis','Marx','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
23,'Sandra','Kilmer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
24,'Cameron','Streep','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
25,'Kevin','Bloom','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
26,'Rip','Crawford','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
27,'Julia','Mcqueen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
28,'Woody','Hoffman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
29,'Alec','Wayne','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
30,'Sandra','Peck','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
31,'Sissy','Sobieski','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
32,'Tim','Hackman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
33,'Milla','Peck','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
34,'Audrey','Olivier','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
35,'Judy','Dean','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
36,'Burt','Dukakis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
37,'Val','Bolger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
38,'Tom','Mckellen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
39,'Goldie','Brody','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
40,'Johnny','Cage','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
41,'Jodie','Degeneres','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
42,'Tom','Miranda','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
43,'Kirk','Jovovich','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
44,'Nick','Stallone','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
45,'Reese','Kilmer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
46,'Parker','Goldberg','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
47,'Julia','Barrymore','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
48,'Frances','Day-Lewis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
49,'Anne','Cronyn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
50,'Natalie','Hopkins','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
51,'Gary','Phoenix','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
52,'Carmen','Hunt','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
53,'Mena','Temple','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
54,'Penelope','Pinkett','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
55,'Fay','Kilmer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
56,'Dan','Harris','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
57,'Jude','Cruise','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
58,'Christian','Akroyd','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
59,'Dustin','Tautou','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
60,'Henry','Berry','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
61,'Christian','Neeson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
62,'Jayne','Neeson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
63,'Cameron','Wray','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
64,'Ray','Johansson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
65,'Angela','Hudson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
66,'Mary','Tandy','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
67,'Jessica','Bailey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
68,'Rip','Winslet','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
69,'Kenneth','Paltrow','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
70,'Michelle','Mcconaughey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
71,'Adam','Grant','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
72,'Sean','Williams','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
73,'Gary','Penn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
74,'Milla','Keitel','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
75,'Burt','Posey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
76,'Angelina','Astaire','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
77,'Cary','Mcconaughey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
78,'Groucho','Sinatra','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
79,'Mae','Hoffman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
80,'Ralph','Cruz','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
81,'Scarlett','Damon','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
82,'Woody','Jolie','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
83,'Ben','Willis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
84,'James','Pitt','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
85,'Minnie','Zellweger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
143,'River','Dean','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
86,'Greg','Chaplin','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
87,'Spencer','Peck','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
88,'Kenneth','Pesci','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
89,'Charlize','Dench','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
90,'Sean','Guiness','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
91,'Christopher','Berry','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
92,'Kirsten','Akroyd','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
93,'Ellen','Presley','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
94,'Kenneth','Torn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
95,'Daryl','Wahlberg','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
96,'Gene','Willis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
97,'Meg','Hawke','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
98,'Chris','Bridges','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
99,'Jim','Mostel','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
100,'Spencer','Depp','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
101,'Susan','Davis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
102,'Walter','Torn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
103,'Matthew','Leigh','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
104,'Penelope','Cronyn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
105,'Sidney','Crowe','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
106,'Groucho','Dunst','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
107,'Gina','Degeneres','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
108,'Warren','Nolte','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
109,'Sylvester','Dern','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
110,'Susan','Davis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
111,'Cameron','Zellweger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
112,'Russell','Bacall','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
113,'Morgan','Hopkins','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
114,'Morgan','Mcdormand','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
115,'Harrison','Bale','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
116,'Dan','Streep','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
117,'Renee','Tracy','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
118,'Cuba','Allen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
119,'Warren','Jackman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
120,'Penelope','Monroe','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
121,'Liza','Bergman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
122,'Salma','Nolte','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
123,'Julianne','Dench','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
124,'Scarlett','Bening','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
125,'Albert','Nolte','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
126,'Frances','Tomei','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
127,'Kevin','Garland','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
128,'Cate','Mcqueen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
129,'Daryl','Crawford','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
130,'Greta','Keitel','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
131,'Jane','Jackman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
132,'Adam','Hopper','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
133,'Richard','Penn','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
134,'Gene','Hopkins','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
135,'Rita','Reynolds','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
136,'Ed','Mansfield','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
137,'Morgan','Williams','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
138,'Lucille','Dee','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
139,'Ewan','Gooding','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
140,'Whoopi','Hurt','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
141,'Cate','Harris','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
142,'Jada','Ryder','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
144,'Angela','Witherspoon','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
145,'Kim','Allen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
146,'Albert','Johansson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
147,'Fay','Winslet','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
148,'Emily','Dee','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
149,'Russell','Temple','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
150,'Jayne','Nolte','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
151,'Geoffrey','Heston','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
152,'Ben','Harris','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
153,'Minnie','Kilmer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
154,'Meryl','Gibson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
155,'Ian','Tandy','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
156,'Fay','Wood','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
157,'Greta','Malden','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
158,'Vivien','Basinger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
159,'Laura','Brody','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
160,'Chris','Depp','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
161,'Harvey','Hope','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
162,'Oprah','Kilmer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
163,'Christopher','West','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
164,'Humphrey','Willis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
165,'Al','Garland','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
166,'Nick','Degeneres','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
167,'Laurence','Bullock','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
168,'Will','Wilson','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
169,'Kenneth','Hoffman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
170,'Mena','Hopper','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
171,'Olympia','Pfeiffer','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
172,'Groucho','Williams','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
173,'Alan','Dreyfuss','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
174,'Michael','Bening','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
175,'William','Hackman','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
176,'Jon','Chase','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
177,'Gene','Mckellen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
178,'Lisa','Monroe','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
179,'Ed','Guiness','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
180,'Jeff','Silverstone','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
181,'Matthew','Carrey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
182,'Debbie','Akroyd','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
183,'Russell','Close','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
184,'Humphrey','Garland','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
185,'Michael','Bolger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
186,'Julia','Zellweger','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
187,'Renee','Ball','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
188,'Rock','Dukakis','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
189,'Cuba','Birch','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
190,'Audrey','Bailey','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
191,'Gregory','Gooding','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
192,'John','Suvari','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
193,'Burt','Temple','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
194,'Meryl','Allen','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
195,'Jayne','Silverstone','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
196,'Bela','Walken','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
197,'Reese','West','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
198,'Mary','Keitel','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
199,'Julia','Fawcett','2013-05-26 14:47:57');
INSERT INTO actor (actor_id,first_name,last_name,last_update) VALUES (
200,'Thora','Temple','2013-05-26 14:47:57');
SET IDENTITY_INSERT actor OFF
GO

SET IDENTITY_INSERT category ON
INSERT INTO category (category_id,name,last_update) VALUES (
1,'Action','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
2,'Animation','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
3,'Children','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
4,'Classics','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
5,'Comedy','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
6,'Documentary','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
7,'Drama','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
8,'Family','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
9,'Foreign','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
10,'Games','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
11,'Horror','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
12,'Music','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
13,'New','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
14,'Sci-Fi','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
15,'Sports','2006-02-15 09:46:27');
INSERT INTO category (category_id,name,last_update) VALUES (
16,'Travel','2006-02-15 09:46:27');
SET IDENTITY_INSERT category OFF
GO

INSERT INTO film_actor (actor_id,film_id) VALUES (1,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (1,23);
INSERT INTO film_actor (actor_id,film_id) VALUES (1,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (2,3);
INSERT INTO film_actor (actor_id,film_id) VALUES (2,31);
INSERT INTO film_actor (actor_id,film_id) VALUES (3,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (4,23);
INSERT INTO film_actor (actor_id,film_id) VALUES (4,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (5,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (6,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (7,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (7,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (7,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (9,30);
INSERT INTO film_actor (actor_id,film_id) VALUES (10,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (10,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (12,16);
INSERT INTO film_actor (actor_id,film_id) VALUES (12,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (12,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (12,37);
INSERT INTO film_actor (actor_id,film_id) VALUES (13,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (13,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (15,31);
INSERT INTO film_actor (actor_id,film_id) VALUES (19,2);
INSERT INTO film_actor (actor_id,film_id) VALUES (19,3);
INSERT INTO film_actor (actor_id,film_id) VALUES (20,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (21,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (22,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (22,23);
INSERT INTO film_actor (actor_id,film_id) VALUES (23,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (24,3);
INSERT INTO film_actor (actor_id,film_id) VALUES (25,21);
INSERT INTO film_actor (actor_id,film_id) VALUES (26,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (26,21);
INSERT INTO film_actor (actor_id,film_id) VALUES (26,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (27,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (27,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (28,14);
INSERT INTO film_actor (actor_id,film_id) VALUES (29,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (30,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (35,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (35,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (36,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (37,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (37,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (37,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (38,24);
INSERT INTO film_actor (actor_id,film_id) VALUES (40,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (40,11);
INSERT INTO film_actor (actor_id,film_id) VALUES (40,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (41,4);
INSERT INTO film_actor (actor_id,film_id) VALUES (42,24);
INSERT INTO film_actor (actor_id,film_id) VALUES (43,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (45,18);
INSERT INTO film_actor (actor_id,film_id) VALUES (46,38);
INSERT INTO film_actor (actor_id,film_id) VALUES (47,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (47,36);
INSERT INTO film_actor (actor_id,film_id) VALUES (49,31);
INSERT INTO film_actor (actor_id,film_id) VALUES (51,5);
INSERT INTO film_actor (actor_id,film_id) VALUES (52,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (53,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (53,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (55,8);
INSERT INTO film_actor (actor_id,film_id) VALUES (55,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (57,16);
INSERT INTO film_actor (actor_id,film_id) VALUES (57,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (59,5);
INSERT INTO film_actor (actor_id,film_id) VALUES (60,31);
INSERT INTO film_actor (actor_id,film_id) VALUES (62,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (64,3);
INSERT INTO film_actor (actor_id,film_id) VALUES (64,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (64,37);
INSERT INTO film_actor (actor_id,film_id) VALUES (65,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (67,24);
INSERT INTO film_actor (actor_id,film_id) VALUES (68,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (69,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (71,26);
INSERT INTO film_actor (actor_id,film_id) VALUES (72,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (73,36);
INSERT INTO film_actor (actor_id,film_id) VALUES (74,28);
INSERT INTO film_actor (actor_id,film_id) VALUES (75,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (75,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (77,13);
INSERT INTO film_actor (actor_id,film_id) VALUES (77,22);
INSERT INTO film_actor (actor_id,film_id) VALUES (79,32);
INSERT INTO film_actor (actor_id,film_id) VALUES (79,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (81,4);
INSERT INTO film_actor (actor_id,film_id) VALUES (81,11);
INSERT INTO film_actor (actor_id,film_id) VALUES (82,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (82,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (84,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (84,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (85,2);
INSERT INTO film_actor (actor_id,film_id) VALUES (85,14);
INSERT INTO film_actor (actor_id,film_id) VALUES (88,4);
INSERT INTO film_actor (actor_id,film_id) VALUES (90,2);
INSERT INTO film_actor (actor_id,film_id) VALUES (90,11);
INSERT INTO film_actor (actor_id,film_id) VALUES (91,13);
INSERT INTO film_actor (actor_id,film_id) VALUES (91,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (94,13);
INSERT INTO film_actor (actor_id,film_id) VALUES (95,22);
INSERT INTO film_actor (actor_id,film_id) VALUES (95,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (96,8);
INSERT INTO film_actor (actor_id,film_id) VALUES (96,36);
INSERT INTO film_actor (actor_id,film_id) VALUES (99,7);
INSERT INTO film_actor (actor_id,film_id) VALUES (99,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (100,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (102,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (102,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (103,5);
INSERT INTO film_actor (actor_id,film_id) VALUES (104,19);
INSERT INTO film_actor (actor_id,film_id) VALUES (104,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (105,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (105,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (105,21);
INSERT INTO film_actor (actor_id,film_id) VALUES (105,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (108,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (108,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (108,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (109,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (110,8);
INSERT INTO film_actor (actor_id,film_id) VALUES (110,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (112,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (112,37);
INSERT INTO film_actor (actor_id,film_id) VALUES (113,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (114,13);
INSERT INTO film_actor (actor_id,film_id) VALUES (116,36);
INSERT INTO film_actor (actor_id,film_id) VALUES (117,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (117,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (118,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (118,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (119,21);
INSERT INTO film_actor (actor_id,film_id) VALUES (122,22);
INSERT INTO film_actor (actor_id,film_id) VALUES (122,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (123,3);
INSERT INTO film_actor (actor_id,film_id) VALUES (124,22);
INSERT INTO film_actor (actor_id,film_id) VALUES (126,21);
INSERT INTO film_actor (actor_id,film_id) VALUES (126,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (127,36);
INSERT INTO film_actor (actor_id,film_id) VALUES (128,26);
INSERT INTO film_actor (actor_id,film_id) VALUES (130,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (130,26);
INSERT INTO film_actor (actor_id,film_id) VALUES (130,37);
INSERT INTO film_actor (actor_id,film_id) VALUES (133,7);
INSERT INTO film_actor (actor_id,film_id) VALUES (135,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (136,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (136,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (136,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (137,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (137,14);
INSERT INTO film_actor (actor_id,film_id) VALUES (138,8);
INSERT INTO film_actor (actor_id,film_id) VALUES (139,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (139,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (140,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (142,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (142,18);
INSERT INTO film_actor (actor_id,film_id) VALUES (144,18);
INSERT INTO film_actor (actor_id,film_id) VALUES (145,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (146,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (146,16);
INSERT INTO film_actor (actor_id,film_id) VALUES (146,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (147,4);
INSERT INTO film_actor (actor_id,film_id) VALUES (148,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (150,23);
INSERT INTO film_actor (actor_id,film_id) VALUES (154,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (155,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (157,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (157,24);
INSERT INTO film_actor (actor_id,film_id) VALUES (157,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (158,32);
INSERT INTO film_actor (actor_id,film_id) VALUES (159,20);
INSERT INTO film_actor (actor_id,film_id) VALUES (160,2);
INSERT INTO film_actor (actor_id,film_id) VALUES (160,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,4);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,7);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,18);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,28);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,32);
INSERT INTO film_actor (actor_id,film_id) VALUES (162,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (163,30);
INSERT INTO film_actor (actor_id,film_id) VALUES (164,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (164,23);
INSERT INTO film_actor (actor_id,film_id) VALUES (166,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (166,38);
INSERT INTO film_actor (actor_id,film_id) VALUES (167,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (167,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (168,32);
INSERT INTO film_actor (actor_id,film_id) VALUES (169,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (170,7);
INSERT INTO film_actor (actor_id,film_id) VALUES (170,15);
INSERT INTO film_actor (actor_id,film_id) VALUES (170,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (170,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (174,11);
INSERT INTO film_actor (actor_id,film_id) VALUES (175,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (175,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (176,13);
INSERT INTO film_actor (actor_id,film_id) VALUES (177,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (177,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (178,30);
INSERT INTO film_actor (actor_id,film_id) VALUES (178,34);
INSERT INTO film_actor (actor_id,film_id) VALUES (179,24);
INSERT INTO film_actor (actor_id,film_id) VALUES (179,27);
INSERT INTO film_actor (actor_id,film_id) VALUES (180,12);
INSERT INTO film_actor (actor_id,film_id) VALUES (180,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (181,5);
INSERT INTO film_actor (actor_id,film_id) VALUES (182,33);
INSERT INTO film_actor (actor_id,film_id) VALUES (183,32);
INSERT INTO film_actor (actor_id,film_id) VALUES (184,35);
INSERT INTO film_actor (actor_id,film_id) VALUES (185,7);
INSERT INTO film_actor (actor_id,film_id) VALUES (187,17);
INSERT INTO film_actor (actor_id,film_id) VALUES (187,25);
INSERT INTO film_actor (actor_id,film_id) VALUES (187,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (188,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (188,10);
INSERT INTO film_actor (actor_id,film_id) VALUES (188,14);
INSERT INTO film_actor (actor_id,film_id) VALUES (190,38);
INSERT INTO film_actor (actor_id,film_id) VALUES (191,16);
INSERT INTO film_actor (actor_id,film_id) VALUES (191,39);
INSERT INTO film_actor (actor_id,film_id) VALUES (192,16);
INSERT INTO film_actor (actor_id,film_id) VALUES (194,9);
INSERT INTO film_actor (actor_id,film_id) VALUES (197,6);
INSERT INTO film_actor (actor_id,film_id) VALUES (197,29);
INSERT INTO film_actor (actor_id,film_id) VALUES (198,1);
INSERT INTO film_actor (actor_id,film_id) VALUES (200,5);
GO

INSERT INTO film_category (film_id,category_id,last_update) VALUES (
1,6,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
2,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
3,6,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
4,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
5,8,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
6,9,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
7,5,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
8,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
9,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
10,15,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
11,9,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
12,12,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
13,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
14,4,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
15,9,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
16,9,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
17,12,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
18,2,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
19,1,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
20,12,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
21,1,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
22,13,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
23,2,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
24,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
25,13,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
26,14,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
27,15,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
28,5,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
29,1,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
30,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
31,8,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
32,13,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
33,7,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
34,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
35,11,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
36,2,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
37,4,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
38,1,'2006-02-15 10:07:09');
INSERT INTO film_category (film_id,category_id,last_update) VALUES (
39,14,'2006-02-15 10:07:09');
GO