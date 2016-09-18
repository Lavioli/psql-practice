--CREATE TABLE

CREATE TABLE if not exists coffeeshop (
	--name of the field: id, type of data: serial, primary key are unique key only for this table
	id serial primary key,
	beverage text not null,
	description text not null
);

