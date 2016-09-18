--CREATE TABLE

CREATE TABLE if not exists beverage (
	--name of the field: id, type of data: serial, primary key are unique key only for this table
	id serial primary key,
	name text not null
);


--EXPLORE ONE TO MANY RELATIONSHIPS: a single row in the table can have multiple relationship with another table row
CREATE TABLE if not exists size (
	id serial primary key,
	beverage_id integer references beverage,
	size text not null,
	price integer not null
);

--EXPLORE MANY TO MANY RELATIONSHIPS: linking multiple rows from one table with multiple rows from another table
CREATE TABLE if not exists types (
    id serial primary key,
    
    category text not null
);

CREATE TABLE if not exists menu (
	category_id integer references types,
	beverage_id integer references beverage,
	size_id integer references size,
	price_id integer references size,
	primary key(category_id, beverage_id, size_id, price_id)
);



