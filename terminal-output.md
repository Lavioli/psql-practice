lavioli:~/workspace (master) $ sudo service postgresql start
 * Starting PostgreSQL 9.3 database server
   ...done.

lavioli:~/workspace (master) $ psql
psql (9.3.14)
Type "help" for help.

ubuntu=# \password
Enter new password: 
Enter it again: 
ubuntu=# \q

lavioli:~/workspace (master) $ createdb coffeeshop
lavioli:~/workspace (master) $ psql -d coffeeshop < query.sql
NOTICE:  relation "coffeeshop" already exists, skipping
CREATE TABLE
 
lavioli:~/workspace (master) $ psql coffeeshop
psql (9.3.14)
Type "help" for help.

coffeeshop=# \d+ coffeeshop

                                                Table "public.coffeeshop"
   Column    |  Type   |                        Modifiers                        | Storage  | Stats target | Description 
-------------+---------+---------------------------------------------------------+----------+--------------+-------------
 id          | integer | not null default nextval('coffeeshop_id_seq'::regclass) | plain    |              | 
 name        | text    | not null                                                | extended |              | 
 description | text    | not null                                                | extended |              | 
Indexes:
    "coffeeshop_pkey" PRIMARY KEY, btree (id)
Has OIDs: no

\q

lavioli:~/workspace (master) $ psql coffeeshop 
psql (9.3.14)
Type "help" for help.

coffeeshop=# ALTER TABLE coffeeshop
coffeeshop-# RENAME name to beverage;
ALTER TABLE
coffeeshop=# ALTER TABLE coffeeshop
coffeeshop-# RENAME description to price;
ALTER TABLE


                                              Table "public.coffeeshop"
  Column  |  Type   |                        Modifiers                        | Storage  | Stats target | Description 
----------+---------+---------------------------------------------------------+----------+--------------+-------------
 id       | integer | not null default nextval('coffeeshop_id_seq'::regclass) | plain    |              | 
 beverage | text    | not null                                                | extended |              | 
 price    | text    | not null                                                | extended |              | 
Indexes:
    "coffeeshop_pkey" PRIMARY KEY, btree (id)
Has OIDs: no

coffeeshop=# INSERT INTO coffeeshop (beverage, price)
coffeeshop-# VALUES ('Espresso', 1.95);
INSERT 0 1

coffeeshop=# INSERT INTO coffeeshop (beverage, price)
VALUES ('Macchiato', 2.25), ('Cappucino', 3.50);             
INSERT 0 2

coffeeshop=# SELECT * FROM coffeeshop
coffeeshop-# ;
 id | beverage  | price 
----+-----------+-------
  1 | Espresso  | 1.95
  2 | Macchiato | 2.25
  3 | Cappucino | 3.50
(3 rows)

coffeeshop=# SELECT * FROM coffeeshop
WHERE price='2.25';
 id | beverage  | price 
----+-----------+-------
  2 | Macchiato | 2.25
(1 row)

coffeeshop=# SELECT * FROM coffeeshop
WHERE beverage='Espresso';
 id | beverage | price 
----+----------+-------
  1 | Espresso | 1.95
(1 row)

coffeeshop=# SELECT beverage FROM coffeeshop;
 beverage  
-----------
 Espresso
 Macchiato
 Cappucino
(3 rows)

coffeeshop=# SELECT beverage FROM coffeeshop
coffeeshop-# WHERE price='3.50';
 beverage  
-----------
 Cappucino
(1 row)

coffeeshop=# DELETE FROM coffeeshop 
coffeeshop-# WHERE id=2;
DELETE 1
coffeeshop=# SELECT * FROM coffeeshop;
 id | beverage  | price 
----+-----------+-------
  3 | Cappucino | 3.50
  1 | Espresso  | 1.95
(2 rows)



