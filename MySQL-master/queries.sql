mysql -u root -p

-- CRUD oper

-- 1.show database
show databases;
SHOW DATABASES;

............................

-- cretae db
CREATE DATABASE dbname
CREATE DATABASE prodapt

.............
-- show tables/list tables
SHOW TABLES;

................
-- CREATE TABLE
CREATE TABLE TABLENAME(FIELDS DATATYPE)
CREATE TABLE course_list(
    c_id INT NOT NULL AUTO_INCREMENT,
    c_name VARCHAR(20) NOT NULL,
    c_author VARCHAR(30) NOT NULL,
    c_date DATE,
    PRIMARY KEY(c_id)
);

CREATE TABLE employee(
    e_id INT NOT NULL AUTO_INCREMENT,
    e_name VARCHAR(30) NOT nULL,
    e_dept VARCHAR(50) NOT nULL,
    e_date DATE,
    PRIMARY KEY(e_id)
);

...................
-- DROP TABLE
DROP TABLE TABLENAME
DROP TABLE employee;

...........................
-- INSERT ONE DATA IN TABLE
INSERT INTO TABLENAME
INSERT INTO course_list(c_name,c_author,c_date) VALUES("JAVA","JAY",NOW());

-- INSERT MULTIPLE DATA
INSERT INTO employee(e_name,e_dept,e_date) 
VALUES("JAY","JAVA",NOW()),
("AVI","SQL",NOW()),
("MANISHA","ANGULAR",NOW());

.................................
-- SELECT DATA FORM TABLE
SELECT * FROM TABLENAME;
SELECT * FROM employee;

SELECT e_dept FROM employee;
SELECT CONCAT('JAY','','ALIAS') AS FULLNAME;

..................................
-- UPDATING RECORDS
UPDATE TABLENAME SET FIELDS="";
UPDATE employee SET e_dept="HTML";
UPDATE employee SET e_dept="HTML" WHERE e_id=3;

............................
-- DELETING RECORDS
DELETE FROM TABLENAME WHERE CONDITION;
DELETE FROM course_list WHERE c_id=2;

............................
-- RENAME
RENAME TABLE employee TO employee_details;

...............................
-- ALTER

ALTER TABLE TABLENAME
ADD  new_col_name col_definition;

ALTER TABLE employee_details
ADD e_loc VARCHAR(100) NOT NULL;

ALTER TABLE employee_details
ADD e_loc VARCHAR(100) NOT NULL,
ADD e_loc VARCHAR(100) Not NULL;

.....................................
-- DESCRIBE table
DESCRIBE employee_details;

.....................................
-- MODIFY COL type
ALTER TABLE employee
MODIFY e_dept VARCHAR(100) NOT NULL;

-- MODIFY/RENAME COL NAME
ALTER TABLE TABLENAME CHANGE COLUMN COLNAME1 COLNAME2 DATATYPE
ALTER TABLE employee CHANGE COLUMN e_date e_doj INT NOT NULL;
..................................
-- DELETE COL
ALTER TABLE employee DROP COLUMN col_name;

.......................................
-- relationships


CREATE TABLE Orders(
    Orderid INT NOT NULL,
    Orderno INT NOT NULL,
    Personid INT,
    PRIMARY KEY(Orderid)
    FOREIGN kEY(Personid) REFERENCES Persons(Personid)
)

CREATE TABLE Project(
    Projectid INT NOT NULL,
    Projectname VARCHAR NOT NULL,
    e_id INT,
    PRIMARY KEY(Projectid),
    FOREIGN KEY(e_id) REFERENCES employee(e_id)
)

.................................
-- ALTER FOREIGN KEY
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY(Personid)
REFERENCES Persons(Personid)

...................
-- ḌROP FOREIGN KEY
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder;

..........................
-- source path/mysql filename
......................


-- SELECT fieldname FROM TABLENAME
SELECT lastName FROM employee;
SELECT firstName,lastName FROM employee;
SELECT * FROM employee;
SELECT expression AS col_alias;

................................
SELECT(2)
    fieldname
FROM(1)
    TABLENAME
ORDER By(3)
    COL1[ASC/DESC],
    COL2[ASC/DESC];

...................
-- USER CUSTOMER TABLE TO PRACTICE SORT
-- ORDERBY LASTNAME

SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName;



SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName DESC;


SELECT
    contactLastName,
    contactFirstName
FROM    
    customers
ORDERBY
    contactLastName DESC,
    contactFirstName ASC;

.....................................
SELECT
    jobTitle
FROM
    customers
ORDERBY
    jobTitle;

...................................
-- ORDERDETAILS TABLE
SELECT
    orderLineNumber,orderNumber,quantityOrdered
    * priceEach AS subtotal
FROM
    orderdetails
ORDER BY
    subtotal DESC;

-- SELECT * FROM orderdetails limit 3;

........................................
-- status
--     In Progress
--     on hold
--     Cancelled
--     Resolved
--     Disputed
--     Shipped

SELECT
    orderNumber,status
FROM
    orders
ORDER BY FIELD(status,
    "In Process",
    " on hold",
    " Cancelled",
    "Resolved",
     "Disputed",
     "Shipped" );


SELECT
    firstName,
    lastName,
    reportsTo
FROM
    orders
ORDER BY reportsTo DESC;

...................................
-- filtering data
WHERE
SELECT DISTINCT
And
NOT IN
BETWEEN
Limit
IS NULL

-- FROM-WHERE-SELECT-ORDER BY

SELECT
    firstName,
    lastName,
    jobTitle,officeCode
FROM
    employees
WHERE
    jobTitle="Sales Rep" AND
    officeCode=1;



SELECT
    firstName,
    lastName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle="Sales Rep" OR
    officeCode=1
ORDER BY
    officeCode,
    jobTitle;



SELECT
    firstName,
    lastName,
    officeCode

FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3

ORDER BY officeCode;
....................................
-- LIKE CLAUSE

SELECT
    firstName,
    lastName
FROM
    employees
WHERE 
    lastName like '%son'
ORDER BY firstName;

SELECT
    firstName,
    lastName
FROM
    employees
WHERE 
    lastName like 'Tho%'
ORDER BY firstName;

......................................
-- in operator
SELECT
    firstName,
    lastName,
    officeCode
FROM 
    employees
WHERE
    officeCode IN(1,2,3)
ORDER BY
    firstName;


--Limits
SELECT
    fieldname
FROM
    TABLENAME
LIMIT ;

SELECT
    customerNumber,
    CustomerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit ASC
LIMIT 6;

SELECT
    customerNumber,
    CustomerName,
    creditLimit
FROM
    customers
ORDER BY CustomerName ASC
LIMIT 10,10;
-- starting from 11 and giving 10 rows 
-- first number is the staring from where we have to start and second is the number of data we want to show.

-- distinct

SELECT DISTINCT
    `state`
FROM
    `customers`
WHERE
    `state` IS NOT NULL
LIMIT 5;

SELECT
    CONCAT_WS(',',lastName,firstName) AS 'FULL NAME'
FROM
    employees;

SELECT
    orderLineNumber,orderNumber,
    SUM(quantityOrdered*priceEach) AS total
FROM    
    orderdetails
Group BY
      orderNumber
      having
      total>60000;

--SELECT column_name(s)
--FROM table1
--INNER JOIN table2
--ON table1.column_name = table2.column_name;

Select products.productName,orderdetails.priceEach
from products
inner join orderdetails ON products.productCode = orderdetails.productCode
limit 5;

--SELECT column_name(s)
--FROM table1
--left JOIN table2
--ON table1.column_name = table2.column_name;
Select products.productName,orderdetails.priceEach
from products
left join orderdetails ON products.productCode = orderdetails.productCode
limit 5;

--SELECT column_name(s)
--FROM table1
--right JOIN table2
--ON table1.column_name = table2.column_name;

Select products.productName,orderdetails.priceEach
from products
right join orderdetails ON products.productCode = orderdetails.productCode
limit 5;

--SELECT column_name(s)
--FROM table1
--cross JOIN table2
--ON table1.column_name = table2.column_name;

Select products.productName,orderdetails.priceEach
from products
cross join orderdetails ON products.productCode = orderdetails.productCode
limit 5;

--self join

--to get the whole organization structure,
--you can join employees table to itself using
--the employeeNumber and reportsTo columns.
--The table employees has two roles: one is the manager and the other is Direct Reports.

SELECT 
CONCAT(m.lastName,',',m.firstName) AS Manager,
CONCAT(e.lastName,',',e.firstName) AS 'Direct report'
FROM 
employees e
INNER JOIN employees m on
m.employeeNumber=e.reportsTo
ORDER BY
Manager;

--view

create view cust AS
     select customerName,customerNumber
     from customers
     where customerName LIKE '%e';

-- empdb

create table merits(
     performance INT(11) NOT NULL,
     percentage float not null,
     primary key(performance));

create table employees(
     emp_id int(11) not null auto_increment,
     emp_name varchar(255) not null,
     performance int(11) default null,
     salary float default null,
     primary key (emp_id),
     constraint fk_performance foreign key(performance)
     references merits(performance));

 insert into merits(performance,percentage)
    -> values(1,0),(2,0.01),(3,0.03),(4,0.04),(5,0.08);

insert into employees(emp_name,performance,salary)
    -> values('mary doe',1,50000),
    -> ('cindy smith',2,4000),
    -> ('yogita sharma',3,50000),
    -> ('tinku',4,60000),
    -> ('rohan',5,54000);

update employees
    -> inner join
    -> merits on employees.performance=merits.performance
    -> set
    -> salary=salary+salary*percentage;

--new hire
 insert into employees(emp_name,performance,salary)
    -> values('jyoti',null,43000),
    -> ('rishu',null,52000);

-- increase salary for new hire by 1.5%

    update employees
    -> left join
    -> merits on employees.performance=merits.performance
    -> set
    -> salary=salary+salary*0.015
    -> where
    -> merits.percentage IS NULL;

create table t1(id int primary key auto_increment);
create table t2(id varchar(20) primary key,ref int not null);
 insert into t1 values(1),(2),(3);
 insert into t2(id,ref) values('A',1),('B',2),('C',3);
 delete t1,t2 from t1
    -> inner join
    -> t2 on t2.ref=t1.id
    -> where
    -> t1.id=1;
-- subqueries

    select customerNumber,checkNumber,amount
     from payments
     where amount=(select max(amount) from payments);

    select customerNumber,checkNumber,amount
     from payments
     where amount>(select AVG(amount) from payments);

     --not in

     select customerName
    -> from customers
    -> where customerNumber not in(select distinct customerNumber from orders);
-- correlated subquery

     select productname,buyprice
    -> from products p1
    -> where
    -> buyprice>(select avg(buyprice)
    -> from products
    -> where productline=p1.productline);
-- customers who placed at least one sales order with the total value
--greater than 60k by using the EXISTS operator:
select customerNumber,customerName
    -> from customers
    -> where exists(select orderNumber,sum(priceEach * quantityOrdered)
    -> from orderdetails inner join orders using(orderNumber)
    -> where customerNumber=customers.customerNumber
    -> group by orderNumber
    -> having sum(priceEach * quantityOrdered)>60000);

--index

     create index ci on employees(email);

     explain select customerNumber,customerName
     from customers
     where exists(select orderNumber,sum(priceEach * quantityOrdered)
     from orderdetails inner join orders using(orderNumber)
     where customerNumber=customers.customerNumber
     group by orderNumber
     having sum(priceEach * quantityOrdered)>60000);
-- drop index:
      drop index ci on employees;

create table leads(lead_id int auto_increment,first_name varchar(100) not null,last_name varchar(100) not null,email varchar(255) not null,information_source varchar(255),index name(first_name,last_name),unique email(email),primary key(lead_id));
 delimiter $$
 create procedure getCustomers()
     begin
     select customerName,
     city,state,postalCode,country
     from customers
     order by customerName;
     end$$
    delimiter;
   
    delimiter $$
    create procedure getofficebycountry(in countryName varchar(255))
     begin select * from offices
     where country = countryName;
     end
     delimiter;

    delimiter $$
    create procedure getsorderscountbystatus(
        in orderStatus varchar(25),
        out total int
    )
    begin select count(orderNumber)
    into total
    from orders
    where status=orderStatus;
    end$$
    delimiter;

 call getsorderscountbystatus('Shipped',@total);
 select @total;