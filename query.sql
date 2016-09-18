--CREATE TABLE

CREATE TABLE if not exists coffeeshop (
	--name of the field: id, type of data: serial, primary key are unique key only for this table
	id serial primary key,
	beverage text not null,
	description text not null
);


--EXPLORE ONE TO FEW RELATIONSHIPS: a single row in the table can have multiple relationship with another table row
CREATE TABLE if not exists size-price (
	id serial primary key,
	size_id integer references coffeeshop,
	size text not null,
	price integer not null
);

