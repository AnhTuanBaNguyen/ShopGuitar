create database ShopGuitar;
--use GamingSharing1;
create table [User] (
	id int not null identity(1,1) primary key,
	email varchar(255) not null,
	[password] varchar(150) not null,
	full_name nvarchar(150) not null,
	gender bit not null,
	phone varchar(150) not null,
);

create table Category (
	id int not null identity(1,1) primary key,
	[name] nvarchar(150) not null,
);

create table Product (
	id int not null identity(1,1) primary key,
	category_id int not null,
	[name] nvarchar(150) not null,
	[description] nvarchar(max),
	price int not null default 0,
	image varchar(150),
	CONSTRAINT FK_Product_Category FOREIGN KEY (category_id)
        REFERENCES Category (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);