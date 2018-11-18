CREATE DATABASE QuanLyNhaHang;
GO
USE QuanLyNhaHang;
GO

-- Food 
-- Drink
-- Combo
-- Account
-- Member
-- Bill
-- BillInfo

CREATE TABLE Food
(
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100)
        DEFAULT N'Chưa đặt tên' NOT NULL,
    price FLOAT
        DEFAULT 0 NOT NULL,
	cetagory NVARCHAR(1000)	NOT NULL,
    status NVARCHAR(100) NOT NULL -- còn món || hết món
);
GO


CREATE TABLE Member
(
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100)
        DEFAULT N'Chưa đặt tên' NOT NULL,
    birth DATE NOT NULL,
    phone INT,
    email NVARCHAR(100),
    point INT NOT NULL
        DEFAULT 0
);
GO

CREATE TABLE Combo
(
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100)
        DEFAULT N'Chưa đặt tên' NOT NULL,
    price FLOAT
        DEFAULT 0 NOT NULL,
	cetagory NVARCHAR(1000)	NOT NULL,
    status NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Drink
(
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100)
        DEFAULT N'Chưa đặt tên' NOT NULL,
    price FLOAT
        DEFAULT 0 NOT NULL,
	cetagory NVARCHAR(1000)	NOT NULL,
    status NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Account
(
    UserName NVARCHAR(100) PRIMARY KEY,
    PassWord NVARCHAR(1000) NOT NULL,
    Type INT NOT NULL
	Phone INT NOT NULL,
	Birht DATE NOT NULL,
        DEFAULT 0 -- 0 is staff || 1 is manage
);
GO

CREATE TABLE Bill
(
    id INT IDENTITY PRIMARY KEY,
    DateCheckIn DATE NOT NULL,
    DataCheckOut DATE,
    TotalValue FLOAT NOT NULL,
    status INT
        DEFAULT 0 NOT NULL, -- 1 la da thanh toan || 0 la chua thanh toan
);
GO

CREATE TABLE BillInfo
(
    id INT IDENTITY PRIMARY KEY,
    idBill INT NOT NULL,
    idFood INT,
    idCombo INT,
    idDrink INT,
    count INT NOT NULL
        DEFAULT 0
        FOREIGN KEY (idBill) REFERENCES dbo.Bill (id),
    FOREIGN KEY (idFood) REFERENCES dbo.Food (id),
    FOREIGN KEY (idCombo) REFERENCES dbo.Combo (id),
    FOREIGN KEY (idDrink) REFERENCES dbo.Drink (id)
);
GO

INSERT INTO
