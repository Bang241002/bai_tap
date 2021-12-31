-- DATABASE
Create database Assignment02
go

Use Assignment02
go

-- bảng hãng
Create Table Hang(
	MaHang int primary key,
	TenHang Varchar(50),
	DiaChi varchar(50),
	SDT char(6) check(SDT Like'[0-9][0-9][0-9][0-9][0-9][0-9]'),
)
go
-- Bảng sản phẩm
Create Table SanPham(	
	MaSP int Primary key,
	TenSP nvarchar(50),
	MoTa nvarchar(100),
	DonVi nvarchar(50),
	Gia Money check(Gia > 0),
	SoLuong int ,
	MaHang int foreign key References Hang(MaHang)
)
go
-- bảng loại sản phẩm theo hãng 
Create Table LoaiSP (
	MaLoaiSP int primary key,
	TenLoaiSP nvarchar(50),
	MaSP int foreign key References SanPham(MaSP)
)
Go

--3
-- Insert dữ liệu
Insert Into Hang Values(1,'Asus','USA','983232')
						
GO

Insert Into SanPham Values(1,N'Máy Tính T450',N'Máy nhập cũ',N'Chiếc',1000,100,1),
						  (2,N'Điện Thoại Nokia1280',N'Điện thoại đang hot',N'Chiếc',2000,200,1),
						  (3,N'điện thoại Samsung 450',N'máy in loại cũ',N'Chiếc',1000,100,1)
go

Insert Into LoaiSP Values(1,N'Máy Tính',1),
						 (2,N'Điện Thoại',2),
						 (3,N'Máy In',3)
go

-- 4
-- Hiển thị tất cả các hãng sản xuất.
Select * from Hang
go

--Hiển thị tất cả các sản phẩm.
Select * from SanPham
go


-- 5 
-- Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên.
Select TenHang from Hang
Order by TenHang DESC
go

-- Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
Select TenSp, Gia from SanPham
Order by Gia DESC
go

-- Hiển thị thông tin của hãng Asus.
Select * From Hang
Where TenHang LIKE '%Asus%'
go

-- Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
Select TenSP , SoLuong From SanPham
where SoLuong < 11
go

-- Liệt kê danh sách sản phẩm của hãng Asus
Select TenHang, TenSP
From Hang INNER Join SanPham 
On Hang.MaHang = SanPham.MaHang
where TenHang Like'%Asus%'
go



-- 6 
-- Số hãng sản phẩm mà cửa hàng có.
Select TenHang from Hang
go

-- Số mặt hàng mà cửa hàng bán.
Select TenLoaiSP From LoaiSP
go 

-- Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
select TenLoaiSP, COUNT(*)[Tong so loai Sp]
From LoaiSP
Group By TenLoaiSP  With Cube 
go

-- Tổng số đầu sản phẩm của toàn cửa hàng
select TenLoaiSP, COUNT(*)[Tong so loai Sp]
From LoaiSP
Group By TenLoaiSP
go


-- 7 
--  Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
Alter table SanPham
add check(Gia > 0)
go

-- Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.
Alter Table Hang
add Check(SDT Like '0%')
go
