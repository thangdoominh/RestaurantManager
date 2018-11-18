CREATE DATABASE QuanLyNhaHang
GO

USE	QuanLyNhaHang
GO

-- Food 
-- FoodCategory
-- Drink
-- Combo
-- Account
-- Member
-- Bill
-- BillInfo
-- Rervenue

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) default N'Chưa đặt tên' NOT NULL,
	price float default 0 NOT NULL,
	status NVARCHAR(100) NOT NULL -- còn món || hết món
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) default N'Chưa đặt tên' NOT NULL,
)
GO

CREATE TABLE Member
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) default N'Chưa đặt tên' NOT NULL,
	birth date NOT NULL,
	phone int,
	email nvarchar(100),
	point int NOT NULL default 0
)
GO

CREATE TABLE Combo
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) default N'Chưa đặt tên' NOT NULL,
	price float default 0 NOT NULL,
	status nvarchar(100) not null
)
go

CREATE TABLE Drink
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100)  default N'Chưa đặt tên' NOT NULL,
	price float default 0 not null,
	status NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,
	PassWord NVARCHAR(1000) NOT NULL,
	Type INT NOT NULL default 0 -- 0 is staff || 1 is manage
)
GO

create table Bill
(
	id INT IDENTITY PRIMARY KEY, 
	DateCheckIn date not null,
	DataCheckOut date,
	TotalValue float not null,
	status int	default 0 not null, -- 1 la da thanh toan || 0 la chua thanh toan
)	
go
	
create table BillInfo
(
	id INT IDENTITY PRIMARY KEY, 
	idBill INT not null,
	idFood int,
	idCombo int,
	idDrink int,
	count int not null default 0

		foreign key (idBill) References dbo.Bill(id),
		foreign key (idFood) References dbo.Food(id),
		foreign key (idCombo) References dbo.Combo(id),
		foreign key (idDrink) References dbo.Drink(id)
)
go

create table Revenue
(
	id INT IDENTITY PRIMARY KEY, 
	idBill INT,
	idFood int,
	idDrink int,
	idCombo int,
	count int not null default 0
)
go