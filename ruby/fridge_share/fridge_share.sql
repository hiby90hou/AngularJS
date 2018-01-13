-- goods_store_table (item_id, user_id, fridge_id, goods_id, goods_expire_date, goods_quantity)
-- user_table (user_id, username, email, password)
-- fridge_table (fridge_id,fridge_models)
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
	password VARCHAR(1024)
);

CREATE TABLE fridge_table (
	fridge_id SERIAL PRIMARY KEY,
	fridge_models VARCHAR(255)
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
-- (username, email, password)
-- VALUES('hiby', 'hiby.90hou@gmail.com', '123456');

-- make a new fridge
-- INSERT INTO fridge_table
-- (fridge_models)
-- VALUES('sony models 1');
