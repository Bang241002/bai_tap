-- DTABASE
Create DATABASE Assignment03
go

USE Assignment03
go

-- Bảng LoaiTB 
Create Table LoaiTB(
	MaLoaiTB int primary key,
	TenLoaiTB nvarchar(50),
)
-- Bảng ThueBao
Create Table ThueBao(
	MaTB int primary key,
    SoTB char(9),	
	NgayDangKy Date,
	MaLoaiTB int foreign key references LoaiTB(MaLoaiTB)
)
go
-- Bảng KhachHang
Create Table KhachHang(
	MaKH int primary key ,
	TenKH nvarchar(50),
	SoCMND char(9),
	DiaChi nvarchar(100),
	MaTB int Foreign key references ThueBao(MaTB)
)
go

-- 3
-- Insert dữ liệu
Insert Into LoaiTB Values(1,N'Trả Trước'),
						 (2,N'Trả Sau')
go

Insert Into ThueBao Values(1,'123456789','12/12/02',1),
						  (2,'223456789','12/05/07',1),
						  (3,'323456789','12/10/16',2),
						  (4,'423456789','12/08/24',2)
go

Insert Into KhachHang Values(1,N'Nguyễn Nguyệt Hoa','123456789',N'Hà Nội',1),
							(2,N'Nguyễn Văn Huy','223456789',N'Bắc Ninh',2),
							(3,N'Hoàng Thái Bảo','323456789',N'Đà Nẵng',3),
							(4,N'Đỗ Hùng Tài','423456789',N'Hà Nội',4)
go

--4
-- Hiển thị toàn bộ thông tin của các khách hàng của công ty.
Select * from KhachHang
go
-- Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
Select * from ThueBao
go

-- 5
-- Hiển thị toàn bộ thông tin của thuê bao có số: 123456789
select * from ThueBao
where SoTB Like '%123456789%'
go
-- Hiển thị thông tin về khách hàng có số CMTND: 123456789
Select * from KhachHang
where SoCMND Like '%123456789%'
go
-- Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
Select TenKH, SoTB  
from   KhachHang inner join ThueBao
On KhachHang.MaTB = ThueBao.MaTB
where SoCMND Like '%123456789%'
go
-- Liệt kê các thuê bao đăng ký vào ngày 12/12/09
select * from ThueBao
where NgayDangKy = '12/12/09'
go
-- Liệt kê các thuê bao có địa chỉ tại Hà Nội
Select SoTB, DiaChi 
from   KhachHang inner join ThueBao
On KhachHang.MaTB = ThueBao.MaTB
where DiaChi = N'Hà Nội'
go

-- 6
-- Tổng số khách hàng của công ty.
Select COUNT(*)[Tong So KH]
From KhachHang
go
-- Tổng số thuê bao của công ty.
Select count(*) [Tong So TB]
From ThueBao
go
-- Tổng số thuê bào đăng ký ngày 12/12/09.
Select count(*) [Tong So TB]
From ThueBao
where NgayDangKy = '12/12/09'
go
-- Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
Select *
From KhachHang Inner Join ThueBao
ON KhachHang.MaTB = ThueBao.MaTB
go

-- 7
-- Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
alter Table ThueBao
Add  Check(NgayDangKy IS Not null)
go
-- Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.
alter Table ThueBao
Add  Check(NgayDangKy >= Getdate())
go
-- Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
Alter Table ThueBao
Add check(SoTB Like'09%')
go
-- Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.
Alter Table ThueBao
Add DiemThuong int 
go

