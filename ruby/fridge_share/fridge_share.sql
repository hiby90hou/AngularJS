-- goods_store_table (item_id, user_id, fridge_id, goods_id, goods_expire_date, goods_quantity)
-- user_table (user_id, username, email, password)
-- fridge_table (fridge_id,fridge_models)
-- fridge_user_relationship (id,fridge_id,user_id,relationship(own=0/share=1))
-- goods_info (goods_id, goods_name, goods_barcode, recommend_expire_period, category, brand, description, images_url, features, attributes, reviews)

-- CREATE DATABASE fridge_db;

CREATE TABLE goods_store_table (
	item_id SERIAL PRIMARY KEY,
	user_id VARCHAR(255),
	fridge_id VARCHAR(255),
	goods_id VARCHAR(255),
	goods_expire_date VARCHAR(255),
	goods_quantity INT
);

CREATE TABLE user_table (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(255),
	email VARCHAR(1024),
	password VARCHAR(1024),
	fridge_quantity INT
);

CREATE TABLE fridge_table (
	fridge_id SERIAL PRIMARY KEY,
	fridge_models VARCHAR(255),
	fridge_owner_id VARCHAR(255)
);

CREATE TABLE fridge_user_relationship (
	id SERIAL PRIMARY KEY,
	fridge_id VARCHAR(255),
	user_id VARCHAR(255),
	relationship INT
);

CREATE TABLE goods_info (
	goods_id SERIAL PRIMARY KEY,
	goods_name VARCHAR(255),
	goods_barcode VARCHAR(255),
	recommend_expire_period INT,
	category VARCHAR(1024),
	brand VARCHAR(255),
	description VARCHAR(65536),
	image_url VARCHAR(1024),
	features VARCHAR(1024),
	attributes VARCHAR(65536),
	reviews VARCHAR(65536)
);

-- make a new user
-- INSERT INTO user_table
-- (username, email, password,fridge_quantity)
-- VALUES('hiby', 'hiby.90hou@gmail.com', '123456','0');

-- make a new fridge
-- INSERT INTO fridge_table
-- (fridge_models,fridge_owner_id)
-- VALUES('LG','1');

-- store a new item in fridge
-- INSERT INTO goods_store_table
-- (user_id,fridge_id,goods_id,goods_expire_date,goods_quantity)
-- VALUES('1','1','1','2018/02/01','2');

-- record a relationship between fridge and user
-- INSERT INTO fridge_user_relationship
-- (fridge_id,user_id,relationship)
-- VALUES('1','3','0');

-- create a new goods infer
-- INSERT INTO goods_info
-- (goods_name, goods_barcode, recommend_expire_period, category, brand, description,image_url,
-- features,attributes,reviews)
-- VALUES('Sunrice Brown Med 90 Sec Rice','EAN 9310140001913',
-- 	'365','quick-food','Sunrice','Sunrice Brown Med 90 Sec Rice very good to eat',
-- 	'https://images-na.ssl-images-amazon.com/images/I/41HAZ-byqjL.jpg','some features',
-- 	'{Weight => 110 lbs}','{1 => "good product",2 => "do not like it"}');

-- check a user details
-- SELECT * FROM user_table WHERE username = 'hiby';

-- check user's owned fridge
-- SELECT * FROM fridge_table WHERE fridge_owner_id = '1';
