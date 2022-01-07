-- DATABASE
Create DATABASE Assignment04
go

USE Assignment04
go

-- Bảng LoaiSP
Create Table LoaiSP(
	MaLoaiSP int primary key ,
	TenLoaiSP nvarchar(100),
)
go

-- Bảng SanPham
Create Table SanPham(
	MaSP int primary key,
	TenSP nvarchar(100),
	MaLoaiSP int Foreign key references LoaiSP(MaLoaiSP)
)
go

-- Bảng NhanVien
Create Table NhanVien(
	MaNV int primary key ,
	TenNV nvarchar(50),
	MaSP int Foreign key references SanPham(MaSP)
)
go

-- 3
-- Insert dữ liệu 
Insert Into LoaiSP Values(1,N'Máy tính'),
						 (2,N'Điện thoại')
						 (3,N'Máy in')
go

Insert Into SanPham Values(1,N'Máy tính sách tay Z37',1),
						  (2,N'Máy tính RTX37',1),
						  (3,N'Máy In Z37',3),
						  (4,N'Máy In Sony',3),
						  (5,N'Điện Thoại NOKIA 11',2),
						  (6,N'Iphone 13 pro max',2)
go

Insert Into NhanVien Values(1,N'Nguyễn Văn An',1),
						   (2,N'Nguyễn Đình Trung',3),
						   (3,N'Đặng Thị Mai',5)
go

-- 4
-- Liệt kê danh sách loại sản phẩm của công ty.
select  * from LoaiSP
go
-- Liệt kê danh sách sản phẩm của công ty.
select * from SanPham
go
-- Liệt kê danh sách người chịu trách nhiệm của công ty.
select * from NhanVien
go

-- 5 
-- Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
Select * From LoaiSP
Order by TenLoaiSP
go
-- Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
select * from NhanVien
order by TenNV
go
-- Liệt kê các sản phẩm của loại sản phẩm có mã số là 3
Select * from SanPham
where MaLoaiSP = 3
go
-- Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm đần của mã.
select  TenSP , TenNV 
from NhanVien inner join SanPham
ON NhanVien.MaSP = SanPham.MaSP
where TenNV LIKE '%Nguyễn Văn An%'
go

-- 6
-- Số sản phẩm của từng loại sản phẩm.
select TenLoaiSP 
from LoaiSP 
Where MaLoaiSP in 
(
Select Count(MaLoaiSP) 
from SanPham
)
go
-- Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm.
Select * 
from SanPham inner join LoaiSP
ON SanPham.MaLoaiSP = LoaiSP.MaLoaiSP
go
-- Hiển thị toàn bộ thông tin về người chịu trách nhiêm, loại sản phẩm và sản phẩm.
Select *
From NhanVien 
	INNER JOIN SanPham ON NhanVien.MaSP = NhanVien.MaSP
	INNER JOIN LoaiSP ON SanPham.MaLoaiSP = LoaiSP.MaLoaiSP
go

-- 7
-- Viết câu lệnh để thay đổi trường ngày sản xuất là trước hoặc bằng ngày hiện tại.
Alter Table SanPham 
ADD NgaySanXuat date check(NgaySanXuat >= Getdate())
go
-- Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
--
-- Viết câu lệnh để thêm trường phiên bản của sản phẩm.
Alter Table SanPham
Add PhienBan varchar(50)
go