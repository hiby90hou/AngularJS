-- dish (name, imageurl, location, user)
-- CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	image_url VARCHAR(1024)

);

INSERT INTO dishes (
	name.image_url) VALUES (
	'pudding','https://dbjdsnch130xu.cloudfront.net/uploads/recipe/cover/205881/large_053f03d9b0b35829.jpg');