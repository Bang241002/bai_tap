-- Tạo DATABASES
create database agiment_1
go
-- Sử dụng DATABASES
use agiment_1
go
-- 2
-- Tạo bảng Customer
create table Customer (
	CustomerID int primary key,
	Name nvarchar(40),
	Address varchar(100),
	Tel varchar(100)
)
go

go
-- Tạo bảng Product
create table Product(
	ProductID int primary key ,
	Name nvarchar(100),
	Description nvarchar(500),
	Unit nvarchar(50),
	price money,
	Quantily int ,
	Status nvarchar(100)
)
go
-- Tạo bảng Orders
Create table Orders(
	OrderID int primary key,
	CustomerID int foreign key references Customer(CustomerID),
	Da_te datetime,
	Status nvarchar(100)
)
go

-- Tạo bảng OrderDetail
Create table OrderDetail(
	OrderID int foreign key references Orders(OrderID),
	ProductID int foreign key references Product(ProductID),
	Price money ,
	Quantily int
)
go 
-- 3 
-- Thêm dữ liệu vào các bảng 
insert into Customer values(1, 'Nguyễn Văn An','111 Nguyen Trai,Thanh Xuan,Ha Noi','987654321'),
						   (2, 'Trần Đình Quang', '26 Dong Da , Ha Noi','09752566674')

insert into Product values(1,'Máy Tính T450','Máy nhập mới','Chiếc',1000,1,'Còn Hàng'),
						  (2,'Điện Thoại Nokia5670','Điện thoại đang hot','Chiếc',200,2,'Còn Hàng' )

insert into Orders values(1, 1, 'Đã Nhận'),
						 (2, 2, 'Đã Hủy')

insert into OrderDetail values(1, 1, 1000,1),
							  (2, 2, 200,1)
go
-- 4
-- Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng
Select * from Customer
go
--  Liệt kê danh sách sản phẩm của của hàng
Select * from Product
go
-- Liệt kê danh sách các đơn đặt hàng của cửa hàng
Select * from Orders
go
-- 5
-- Liệt kê danh sách khách hàng theo thứ thự alphabet
Select * From Customer
Order by Name 
go
-- Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần
Select * From Product
Order by Price DESC
go
-- Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua
Select * From Product

go

--6
-- Số khách hàng đã mua ở cửa hàng
Select CustomerID , COUNT(*) [Number]
From Customer
Group by CustomerID  
go
--Số mặt hàng mà cửa hàng bán.
Select ProductID , COUNT(*) [Number]
From Product
Group by ProductID  
go
-- Tổng tiền của từng đơn hàng.
Select Price From  OrderDetail

-- 7
-- Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
Alter table Product
ADD  price money check(price > 0)
go
-- Viết câu lệnh để thay đổi ngày đặt hàng của khách hàng phải nhỏ hơn ngày hiện tại.
Alter table Orders
ADD  Da_te datetime check(Da_te < getdate())
go
--Viết câu lệnh để thêm trường ngày xuất hiện trên thị trường của sản phẩm.
Alter table Product
ADD  Ngay datetime
go