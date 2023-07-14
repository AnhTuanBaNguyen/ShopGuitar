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

create table Cart (
	id int not null identity(1,1) primary key,
	[user_id] int not null,
	CONSTRAINT FK_Cart_User FOREIGN KEY (user_id)
        REFERENCES [User] (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table CartDetail (
	id int not null identity(1,1) primary key,
	cart_id int not null,
	product_id int not null,
	quantity int not null,
	CONSTRAINT FK_CartDetail_Product FOREIGN KEY (product_id)
        REFERENCES Product (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_CartDetail_Cart FOREIGN KEY (cart_id)
        REFERENCES Cart (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
);
