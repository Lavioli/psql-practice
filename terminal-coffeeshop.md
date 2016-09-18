lavioli:~/workspace (master) $ psql -d coffeeshop < coffeeshop.sql
CREATE TABLE
CREATE TABLE

lavioli:~/workspace (master) $ psql coffeeshop 
psql (9.3.14)
Type "help" for help.
coffeeshop=# \d+

                             List of relations
 Schema |       Name        |   Type   | Owner  |    Size    | Description 
--------+-------------------+----------+--------+------------+-------------
 public | beverage          | table    | ubuntu | 8192 bytes | 
 public | beverage_id_seq   | sequence | ubuntu | 8192 bytes | 
 public | coffeeshop        | table    | ubuntu | 16 kB      | 
 public | coffeeshop_id_seq | sequence | ubuntu | 8192 bytes | 
 public | size              | table    | ubuntu | 8192 bytes | 
 public | size_id_seq       | sequence | ubuntu | 8192 bytes | 
(6 rows)

coffeeshop=# \q


coffeeshop=# INSERT INTO beverage
(name)
VALUES ('Espresso'), ('Macchiato'), ('Cortado'), ('Capuccino'), ('Americano'), ('Cafe Latte'), ('Cafe Mocha')
;
INSERT 0 7

coffeeshop=# SELECT * FROM beverage;
 id |    name    
----+------------
  1 | Espresso
  2 | Macchiato
  3 | Cortado
  4 | Capuccino
  5 | Americano
  6 | Cafe Latte
  7 | Cafe Mocha
(7 rows)

coffeeshop=# INSERT INTO size
coffeeshop-# (beverage_id, size, price)
coffeeshop-# VALUES (1, 'Single', 1.95), (1, 'Double', 2.50), (2, 'Single', 2.25), (2, 'Double', 2.75), (3, 'Single', 3.25), (3, 'Double', 4.25), (4, 'Single', 3.50), (4, 'Double', 4.50), (5, 'Small', 2.50), (5, 'Medium', 3.00), (5, 'Large', 3.50)                
coffeeshop-# ;
INSERT 0 11

coffeeshop=# SELECT * FROM size;
 id | beverage_id |  size  | price 
----+-------------+--------+-------
  1 |           1 | Single |     2
  2 |           1 | Double |     3
  3 |           2 | Single |     2
  4 |           2 | Double |     3
  5 |           3 | Single |     3
  6 |           3 | Double |     4
  7 |           4 | Single |     4
  8 |           4 | Double |     5
  9 |           5 | Small  |     3
 10 |           5 | Medium |     3
 11 |           5 | Large  |     4
(11 rows)

lavioli:~/workspace (master) $ psql -d coffeeshop < coffeeshop.sql 
NOTICE:  relation "beverage" already exists, skipping
CREATE TABLE
NOTICE:  relation "size" already exists, skipping
CREATE TABLE
CREATE TABLE
CREATE TABLE 

coffeeshop-# VALUES ('shot drinks'), ('classics');
INSERT 0 2
coffeeshop=# SELECT * FROM types                              
;
 id |  category   
----+-------------
  1 | shot drinks
  2 | classics
(2 rows)

coffeeshop=# INSERT INTO menu
coffeeshop-# (category_id, beverage_id, size_id, price_id)          
coffeeshop-# VALUES (1, 1, 1, 1), (1, 1, 2, 2), (1, 2, 3, 3), (1, 2, 4, 4), (1, 3, 5, 5), (1, 3, 6, 6), (1, 4, 7, 7), (1, 4, 8, 8), (2, 5, 9, 9), (2, 5, 10, 10), (2, 5, 11, 11);                           
INSERT 0 11
coffeeshop=# SELECT * FROM menu;
 category_id | beverage_id | size_id | price_id 
-------------+-------------+---------+----------
           1 |           1 |       1 |        1
           1 |           1 |       2 |        2
           1 |           2 |       3 |        3
           1 |           2 |       4 |        4
           1 |           3 |       5 |        5
           1 |           3 |       6 |        6
           1 |           4 |       7 |        7
           1 |           4 |       8 |        8
           2 |           5 |       9 |        9
           2 |           5 |      10 |       10
           2 |           5 |      11 |       11
(11 rows)

coffeeshop=# SELECT beverage.name, size.size
coffeeshop-# FROM beverage
coffeeshop-# JOIN size on size.beverage_id = beverage.id;
   name    |  size  
-----------+--------
 Espresso  | Single
 Espresso  | Double
 Macchiato | Single
 Macchiato | Double
 Cortado   | Single
 Cortado   | Double
 Capuccino | Single
 Capuccino | Double
 Americano | Small
 Americano | Medium
 Americano | Large
(11 rows)

coffeeshop=# SELECT beverage.name, size.size, size.price
FROM beverage
JOIN size on size.beverage_id = beverage.id;
   name    |  size  | price 
-----------+--------+-------
 Espresso  | Single |     2
 Espresso  | Double |     3
 Macchiato | Single |     2
 Macchiato | Double |     3
 Cortado   | Single |     3
 Cortado   | Double |     4
 Capuccino | Single |     4
 Capuccino | Double |     5
 Americano | Small  |     3
 Americano | Medium |     3
 Americano | Large  |     4
 
 
 coffeeshop=# SELECT beverage.name, size.size, size.price, types.category
FROM menu
JOIN beverage on beverage.id = menu.beverage_id
JOIN size on size.id = menu.size_id
JOIN types on types.id = menu.category_id;
   name    |  size  | price |  category   
-----------+--------+-------+-------------
 Espresso  | Single |     2 | shot drinks
 Espresso  | Double |     3 | shot drinks
 Macchiato | Single |     2 | shot drinks
 Macchiato | Double |     3 | shot drinks
 Cortado   | Single |     3 | shot drinks
 Cortado   | Double |     4 | shot drinks
 Capuccino | Single |     4 | shot drinks
 Capuccino | Double |     5 | shot drinks
 Americano | Small  |     3 | classics
 Americano | Medium |     3 | classics
 Americano | Large  |     4 | classics
(11 rows)