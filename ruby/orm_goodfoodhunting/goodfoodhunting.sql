-- dish (name, imageurl, location, user)
-- CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	image_url VARCHAR(1024),
	dish_type_id INTEGER NOT NULL,
	FOREIGN KEY (dish_type_id) REFERENCES dish_type(id) ON DELETE RESTRICT

);

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	body VARCHAR(500) NOT NULL,
	dish_id INTEGER NOT NULL,
	FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE RESTRICT
);

CREATE TABLE dish_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(1024) NOT NULL
);

INSERT INTO dishes (
	name,image_url) VALUES (
	'pudding','https://dbjdsnch130xu.cloudfront.net/uploads/recipe/cover/205881/large_053f03d9b0b35829.jpg');

INSERT INTO dish_type (name)
	VALUES ('dessert');	


INSERT INTO dish_type (name)
	VALUES ('lunch');


INSERT INTO dish_type (name)
	VALUES ('breakfast');

