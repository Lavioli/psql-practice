1. To start Postgres server

    $sudo service postgresql start

2. To enter psql command prompt
    $ psql

3. Manage password

    ubuntu => \password
        -Enter new password
        -Enter it one more time

4. To quit paql command prompt
    ubuntu => \q 

5. $ createdb namedatabasehere

6. create a schema.sql file in bash
7. To run schema.sql to create table
    $ psql -d coffeeshop < QUERY.sql

8. To see information of the table
9.  coffeeshop => \d+ recipes

    Table "public.coffeeshop"
       Column    |  Type   |                        Modifiers                        | Storage  | Stats target | Description 
    -------------+---------+---------------------------------------------------------+----------+--------------+-------------
     id          | integer | not null default nextval('coffeeshop_id_seq'::regclass) | plain    |              | 
     name        | text    | not null                                                | extended |              | 
     description | text    | not null                                                | extended |              | 
    Indexes:
        "coffeeshop_pkey" PRIMARY KEY, btree (id)
    Has OIDs: no


10. Change column name in a table
    coffeeshop=# ALTER TABLE coffeeshop
    coffeeshop-# RENAME name to beverage;
    ALTER TABLE
    
11. Create rows for table
    coffeeshop=# INSERT INTO coffeeshop (beverage, price)
    coffeeshop-# VALUES ('Espresso', 1.95);
    INSERT 0 1
    
    coffeeshop=# INSERT INTO coffeeshop (beverage, price)
    VALUES ('Macchiato', 2.25), ('Cappucino', 3.50);             
    INSERT 0 2

12. Querying for rows
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

13. Updating rows
    coffeeshop=# UPDATE coffeeshop 
    coffeeshop-# SET beverage='Machiato'
    coffeeshop-# WHERE beverage='Espresso';
    UPDATE 1

    coffeeshop=# SELECT * FROM coffeeshop;
     id | beverage  | price 
    ----+-----------+-------
      2 | Macchiato | 2.25
      3 | Cappucino | 3.50
      1 | Machiato  | 1.95
    (3 rows)
    
    coffeeshop=# UPDATE coffeeshop 
    SET beverage='Espresso'
    WHERE price='1.95';
    UPDATE 1
    
    coffeeshop=# SELECT * FROM coffeeshop;
     id | beverage  | price 
    ----+-----------+-------
      2 | Macchiato | 2.25
      3 | Cappucino | 3.50
      1 | Espresso  | 1.95
    (3 rows)
    
14. Deleting rows
    coffeeshop=# DELETE FROM coffeeshop 
    coffeeshop-# WHERE id=2;
    DELETE 1
    coffeeshop=# SELECT * FROM coffeeshop;
     id | beverage  | price 
    ----+-----------+-------
      3 | Cappucino | 3.50
      1 | Espresso  | 1.95
    (2 rows)
