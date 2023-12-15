create table faculty(ssno int primary key,name varchar(20),quali varchar(20),exp varchar(20),salary int,sub varchar(20),dep_no int); to create table
alter table faculty add gender varchar(20);
desc faculty;
-- +--------+-------------+------+-----+---------+-------+
-- | Field  | Type        | Null | Key | Default | Extra |
-- +--------+-------------+------+-----+---------+-------+
-- | ssno   | int         | NO   | PRI | NULL    |       |
-- | name   | varchar(20) | YES  |     | NULL    |       |
-- | quali  | varchar(20) | YES  |     | NULL    |       |
-- | exp    | varchar(20) | YES  |     | NULL    |       |
-- | salary | int         | YES  |     | NULL    |       |
-- | sub    | varchar(20) | YES  |     | NULL    |       |
-- | dep_no | int         | YES  |     | NULL    |       |
-- | gender | varchar(20) | YES  |     | NULL    |       |
-- +--------+-------------+------+-----+---------+-------+

insert into faculty values(100,'nandu','plustwo','one year',100000,'malayalam',2,'F'),(101,'leshmi','sslc','Two year',20000,'Enlgish',2,'F').(104,'sani','plustwo','3 year',500000,'Marati',5,'F'),(103,'Ramu','Btech','Two year',30000,'HIndi',4,'F');
 select * from faculty;
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- | ssno | name   | quali   | exp      | salary | sub       | dep_no | gender |
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- |  100 | jiji   | plustwo | one year | 100000 | malayalam |      2 | F      |
-- |  101 | leshmi | sslc    | Two year |  20000 | Enlgish   |      2 | F      |
-- |  103 | Ramu   | Btech   | Two year |  30000 | HIndi     |      4 | F      |
-- |  104 | sani   | plustwo | 3 year   | 500000 | Marati    |      5 | F      |
-- +------+--------+---------+----------+--------+-----------+--------+--------+

 select name from faculty where ssno=101;
-- +--------+
-- | name   |
-- +--------+
-- | leshmi |
-- +--------+

 select name from faculty where name like 'j%';
-- +------+
-- | name |
-- +------+
-- | jiji |
-- +------+

 create view deptview as
 select * from faculty where dep_no = 2;
 select * from deptview;
-- +------+--------+-------+----------+--------+---------+--------+--------+
-- | ssno | name   | quali | exp      | salary | sub     | dep_no | gender |
-- +------+--------+-------+----------+--------+---------+--------+--------+
-- |  101 | leshmi | sslc  | Two year |  20000 | Enlgish |      2 | F      |
-- +------+--------+-------+----------+--------+---------+--------+--------+

 select avg(salary) from faculty where dep_no = 2;
-- +-------------+
-- | avg(salary) |
-- +-------------+
-- |  60000.0000 |
-- +-------------+

select name from faculty where dep_no = 2 and salary = (select min(salary) from faculty where dep_no=2);
-- +--------+
-- | name   |
-- +--------+
-- | leshmi |
-- +--------+

select dep_no,count(dep_no) from faculty group by dep_no;
-- +--------+---------------+
-- | dep_no | count(dep_no) |
-- +--------+---------------+
-- |      2 |             2 |
-- |      4 |             1 |
-- |      5 |             1 |
-- +--------+---------------+

 select count(dep_no) from faculty;
-- +---------------+
-- | count(dep_no) |
-- +---------------+
-- |             4 |
-- +---------------+

create table dept(dept_no int primary key,dept_name varchar(20),fac_name varchar(20),experience varchar(20));

insert into dept values(5,'Science','Shaji','two year');

select * from dept;
-- +---------+-----------+----------+------------+
-- | dept_no | dept_name | fac_name | experience |
-- +---------+-----------+----------+------------+
-- |       5 | Science   | Shaji    | two year   |
-- +---------+-----------+----------+------------+

select * from dept right join faculty on faculty.dep_no = dept.dept_no;
-- +---------+-----------+----------+------------+------+--------+---------+----------+--------+-----------+--------+--------+
-- | dept_no | dept_name | fac_name | experience | ssno | name   | quali   | exp      | salary | sub       | dep_no | gender |
-- +---------+-----------+----------+------------+------+--------+---------+----------+--------+-----------+--------+--------+
-- |    NULL | NULL      | NULL     | NULL       |  100 | jiji   | plustwo | one year | 100000 | malayalam |      2 | F      |
-- |    NULL | NULL      | NULL     | NULL       |  101 | leshmi | sslc    | Two year |  20000 | Enlgish   |      2 | F      |
-- |    NULL | NULL      | NULL     | NULL       |  103 | Ramu   | Btech   | Two year |  30000 | HIndi     |      4 | F      |
-- |       5 | Science   | Shaji    | two year   |  104 | sani   | plustwo | 3 year   | 500000 | Marati    |      5 | F      |
-- +---------+-----------+----------+------------+------+--------+---------+----------+--------+-----------+--------+--------+

select * from faculty right join dept on faculty.dep_no = dept.dept_no;
+------+------+---------+--------+--------+--------+--------+--------+---------+-----------+----------+------------+
-- | ssno | name | quali   | exp    | salary | sub    | dep_no | gender | dept_no | dept_name | fac_name | experience |
-- +------+------+---------+--------+--------+--------+--------+--------+---------+-----------+----------+------------+
-- |  104 | sani | plustwo | 3 year | 500000 | Marati |      5 | F      |       5 | Science   | Shaji    | two year   |
-- +------+------+---------+--------+--------+--------+--------+--------+---------+-----------+----------+------------+

Delimiter //
 create procedure Getalldata()
  begin
  select * from dept;
  select * from faculty;
  end//

Delimiter ;

call Getalldata();
-- +---------+-----------+----------+------------+
-- | dept_no | dept_name | fac_name | experience |
-- +---------+-----------+----------+------------+
-- |       5 | Science   | Shaji    | two year   |
-- +---------+-----------+----------+------------+
-- 1 row in set (0.02 sec)

-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- | ssno | name   | quali   | exp      | salary | sub       | dep_no | gender |
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- |  100 | jiji   | plustwo | one year | 100000 | malayalam |      2 | F      |
-- |  101 | leshmi | sslc    | Two year |  20000 | Enlgish   |      2 | F      |
-- |  103 | Ramu   | Btech   | Two year |  30000 | HIndi     |      4 | F      |
-- |  104 | sani   | plustwo | 3 year   | 500000 | Marati    |      5 | F      |
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- 4 rows in set (0.03 sec)

 delimiter //
create procedure ChangeSalry(IN id int,IN new_salary int)
    begin
    update faculty
    set salary = new_salary
    where ssno = id;
    end//
 Delimiter ;

 call ChangeSalry(103,800000);

 select * from faculty;
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- | ssno | name   | quali   | exp      | salary | sub       | dep_no | gender |
-- +------+--------+---------+----------+--------+-----------+--------+--------+
-- |  100 | jiji   | plustwo | one year | 100000 | malayalam |      2 | F      |
-- |  101 | leshmi | sslc    | Two year |  20000 | Enlgish   |      2 | F      |
-- |  103 | Ramu   | Btech   | Two year | 800000 | HIndi     |      4 | F      |
-- |  104 | sani   | plustwo | 3 year   | 500000 | Marati    |      5 | F      |
-- +------+--------+---------+----------+--------+-----------+--------+--------+

 delimiter //
create procedure InsertValues(in dep_no int,in dep_name varchar(20),in facul_name varchar(20),in exer_name varchar(20))
begin
insert into dept(dept_no,dept_name,fac_name,experience)
values(dep_no,dep_name,facul_name,exer_name);
end//
 delimiter ;
 call InsertValues(6,'Maths','Fari','1 year');
 select * from dept;
-- +---------+-----------+----------+------------+
-- | dept_no | dept_name | fac_name | experience |
-- +---------+-----------+----------+------------+
-- |       5 | Science   | Shaji    | two year   |
-- |       6 | Maths     | Fari     | 1 year     |
-- +---------+-----------+----------+------------+

create index ind_name on faculty(dep_no);
 show indexes from faculty;
-- +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | faculty |          0 | PRIMARY  |            1 | ssno        | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | faculty |          1 | ind_name |            1 | dep_no      | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
-- +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

 desc just;
-- +-------+-------------+------+-----+---------+-------+
-- | Field | Type        | Null | Key | Default | Extra |
-- +-------+-------------+------+-----+---------+-------+
-- | ab    | int         | YES  |     | NULL    |       |
-- | bc    | varchar(30) | YES  |     | NULL    |       |
-- +-------+-------------+------+-----+---------+-------+

alter table just modify column ab float;
--  desc just;
-- +-------+-------------+------+-----+---------+-------+
-- | Field | Type        | Null | Key | Default | Extra |
-- +-------+-------------+------+-----+---------+-------+
-- | ab    | float       | YES  |     | NULL    |       |
-- | bc    | varchar(30) | YES  |     | NULL    |       |
-- +-------+-------------+------+-----+---------+-------+

 update faculty set salary = salary * 3
 +------+--------+---------+----------+---------+-----------+--------+--------+
| ssno | name   | quali   | exp      | salary  | sub       | dep_no | gender |
+------+--------+---------+----------+---------+-----------+--------+--------+
|  100 | jiji   | plustwo | one year |  300000 | malayalam |      2 | F      |
|  101 | leshmi | sslc    | Two year |   60000 | Enlgish   |      2 | F      |
|  103 | Ramu   | Btech   | Two year | 2400000 | HIndi     |      4 | F      |
|  104 | sani   | plustwo | 3 year   | 1500000 | Marati    |      5 | F      |
+------+--------+---------+----------+---------+-----------+--------+--------+


 CREATE TABLE customers (
    ->     customer_id INT PRIMARY KEY,
    ->     customer_name VARCHAR(50)
    -> );
 CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     order_date DATE,
    ->     customer_id INT,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    -> );
  show create table orders;
+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table

                                              |
+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| orders | CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

alter table orders
    -> drop constraint orders_ibfk_1;
-- foreign key removed

 alter table orders
    -> add foreign key (customer_id) references customers(customer_id);
-- foreign key added

 CREATE TABLE employees (
    ->     employee_id INT PRIMARY KEY,
    ->     employee_name VARCHAR(50) CHECK (employee_name LIKE 'L%'));
 insert into employees values(102,'Liya');
Query OK, 1 row affected (0.01 sec)

 insert into employees values(102,'Hena');
ERROR 3819 (HY000): Check constraint 'employees_chk_1' is violated.