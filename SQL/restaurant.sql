-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

##createtable
create table menu (
  menuid int, 
  name int,
  price real,
  PRIMARY KEY (menuid),
    FOREIGN KEY (menuid) REFERENCES orders(menuid)
      )  ;

insert into menu values
(1,'Porkchop steak',250),
(2,'Caesar Salad',180),
(3, 'Mushroom Soup',100),
(4,'Chicken steak',230),
(5,'Fish and chip',230);

create table restaurants (
  branchid int ,
  branchname text,
  PRIMARY Key(branchid),
  FOREIGN KEY (branchid) REFERENCES orders(branchid),
  FOREIGN KEY (branchid) REFERENCES memberships(branchid)
)  ;

insert into restaurants values
(1,'Northstreet'),
(2,'Southisland'),
(3,'Midtown')
  ;


create table orders (
    orderid int,
    customerid int,
    menuid int,
    paymentid int,
    branchid int,
    dates text,
  PRIMARY Key(orderid),
  FOREIGN KEY (paymentid) REFERENCES payment(paymentid),
  FOREIGN KEY (branchid) REFERENCES restaurants(branchid)
);

insert into orders values
  
(1,2,5,1,1,'01-01-2022'),
(2,1,1,2,1,'01-01-2022'),
(3,3,2,2,1,'01-01-2022'),
(4,4,4,1,2,'01-01-2022'),
(5,5,1,3,1,'01-02-2022'),
(6,6,5,1,2,'01-02-2022'),
(7,8,4,3,2,'01-02-2022'),
(8,7,2,2,3,'01-02-2022'),
(9,9,2,1,2,'01-03-2022'),
(10,10,5,2,2,'01-03-2022'),
(11,11,3,3,3,'01-03-2022'),
(12,15,2,1,1,'01-03-2022'),
(13,14,5,3,1,'01-04-2022'),
(14,13,1,3,2,'01-04-2022'),
(15,12,1,3,1,'01-04-2022'),
(16,18,4,3,3,'01-03-2022'),
(17,19,2,1,1,'01-03-2022'),
(18,20,4,3,2,'01-01-2022'),
(19,16,3,2,3,'01-02-2022'),
(20,17,4,1,2,'01-04-2022');

create table memberships (
  memberid int,
  name int,
  age int,
  gender int,
  branchid int 
);

insert into memberships values
(1,'Beer',25,'Male',1),
(2,'Bow',38,'Female',1),
(3,'Min',41,'Female',3),
(4,'Sarah',40,'Female',2),
(5,'Jazz',36,'Male',2),
(6,'Som',32,'Female',3),
(7,'Love',25,'Male',1),
(8,'Rom',38,'Female',1),
(9,'May',27,'Female',3),
(10,'Pink',30,'Female',1),
(11,'June',26,'Male',2),
(12,'Sam',43,'Female',3),
(13,'Tom',38,'Male',1),
(14,'Mall',21,'Female',3),
(15,'Brown',40,'Female',2),
(16,'Aing',22,'Male',1),
(17,'Sammy',28,'Female',3),
(18,'June',32,'Male',2),
(19,'See',19,'Male',3),
(20,'Song',18,'Female',3);

create table payment (
  paymentid int,
  type text,
  PRIMARY KEY (paymentid),
    FOREIGN KEY (paymentid) REFERENCES orders(paymentid)
);

  insert into payment values
  (1,'cash'),
  (2,'E-wallet'),
  (3,'Card');





.mode  markdown
.header on 

.print
.print what is the avarage age and number of customer per branch
  
 
  With customers AS
  (select 
  name,
  age,
  gender,
  branchname
  from memberships 
  Join restaurants 
  on memberships.branchid = restaurants.branchid
 )
  select 
  branchname,
  round(avg(age),2) AS Avg_age,
  count (name) as total_members
    from customers 
 group by 1;


.print
.print whet are the top 3 of sales
select 
  name,
  sum(price) as sale    
  from orders
  Join menu on menu.menuid = orders.menuid
  group by name
  order by sale desc
  limit 3 ;

.print
.print what is the favorite payment method ?

  select 
  type,
  sum(price) as sale ,
  count(type) as Favorite
   
  from orders
  Join payment on payment.paymentid = orders.paymentid
  Join menu on menu.menuid = orders.menuid
 
   group by type
  order by 3 desc
;

.print
.print How many sales of each branch

select 
  branchname,
  sum(price) as sale ,
  count(name) as no_orders
   
  from orders
  Join restaurants on restaurants.branchid = orders.branchid
  Join menu on menu.menuid = orders.menuid
group by branchname 
  order by sale desc;


.print
.print Daliy sales

  With sales AS
  (select 
  dates,
  orderid,
  name,
  price as sales,
  branchname
     from orders 
Join restaurants on restaurants.branchid = orders.branchid
Join menu on menu.menuid = orders.menuid)  
  
  select 
  dates,
  sum(sales) Sum,
 Round(Avg(sales),2) Avg,
  Max(sales) Max,
  Min(sales) Min,
  count(orderid) no_orders
 
  from sales  
  group by dates
 
  
  

 




 
