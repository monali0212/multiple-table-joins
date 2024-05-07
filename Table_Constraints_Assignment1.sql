-- Create database
create database assigment1;

-- Use the database
use assigment1;

-- Create table Customers consisting of CustomerID, FirstName, LastName, Email 
-- set table constarints as Primary key, Not null, unique as required
create table customer(CutomerID int primary key,
FirstName varchar(30) not null, LastName varchar(30) not null, Email varchar(30) not Null unique
);
-- Describe Customers table
describe customer;

-- Insert values into Customers table
insert into customer values(1,"Mona","Mohite","monali.mohite1997@gmail.com");

-- View Customers table
select *from customer;

-- Try to add a duplicate email in Customers
insert into customer values(2,"saee","Mohite","saee@gmail.com");
insert into customer values(3,"Mayuri","Ahire","mayu@gmail.com");
-- View Customers table
select *from customer;

-- Create table Orders with columns OrderID,CustomerID,OrderDate,TotalAmount  
--  -- set table constarints as Primary key, Not null, unique as required
create table Orders(orderId int primary key,
cutomerID int not null,
OrderDate date default "2024-01-06",
foreign key(cutomerID) references customer(cutomerID),
TotalAmount decimal(10,2) check (TotalAmount>0)
);

-- Describe Orders table
-- DESCRIBE Orders;
describe Orders;
-- View Orders table

select *from orders;
-- Insert values into Orders table
insert into Orders values(1,1,Orderdate,25000);

-- View Orders table
select *from orders;

-- Try to add an order with a non-existent customer

insert into Orders values(2,3,Orderdate,25000);
-- View Orders table
select *from Orders;

-- Correct entry for order 104
insert into Orders values(104,2,Orderdate,50000);

-- View Orders table
select *from Orders;
