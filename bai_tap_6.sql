-- DATABASE
Create DATABASE Assignment06
go

USE Assignment06
go


-- Bảng NhaXuatBan
Create Table NhaXuatBan (
	NhaXuatBanID int primary key,
	TenNhaXuatBan nvarchar(50),
	DiaChi nvarchar(50),
)



-- Bảng LoaiSach
Create Table LoaiSach(
	LoaiSachID int primary key,
	TenLoaiSach nvarchar(50),
)
go


-- Bảng Sach
Create Table Sach(
	SachID int primary key,
	TenSach nvarchar(100),
	TacGia nvarchar(50),
	NoiDung nvarchar(200),
	NamXuatBan char(4),
	LanXuatBan int,
	Gia int,
	SoLuong int ,	
	LoaiSachID int foreign key References LoaiSach(LoaiSachID),
	NhaXuatBanID int foreign key References NhaXuatBan(NhaXuatBanID)
)
go


-- 2 Viết lệnh SQL chèn vào các bảng của CSDL các dữ liệu mẫu
Insert Into NhaXuatBan Values(1,N'Tri Thức',N'Hà Nội'),
							 (2,N'Kim Đồng',N'TP.HCM')
go


Insert Into LoaiSach Values(1,N'Khoa học xã hội'),
						   (2,N'Toán học'),
						   (3,N'Tin học')
go


Insert Into Sach Values(1,N'Trí tuệ Do Thái',N'Eran Katz',N'Người Do Thái',2010,1,79000,100,1,1),
					   (2,N'Giải Toán',N'Katz',N'Toán Cao Cấp',2010,1,60000,100,1,2),
					   (3,N'Lập Trình Với C',N'Kran Vesson',N'Lập trình',2010,1,80000,100,3,2)
go


-- Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
Select * from Sach
Where NamXuatBan = 2010
go


-- Liệt kê 10 cuốn sách có giá bán cao nhất
Select TOP(10) * From Sach
Where Gia = Max(Gia)
go


-- Tìm những cuốn sách có tiêu đề chứa từ “tin học”
Select * from Sach
Where TenSach Like N'%tin học%'
go


-- Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần
Select * from Sach 
Where TenSach Like N'T%'
Order By Gia DESC
go


-- Liệt kê các cuốn sách của nhà xuất bản Tri thức
Select TenSach , TenNhaXuatBan
From Sach INNER JOIN NhaXuatBan
ON Sach.NhaXuatBanID = NhaXuatBan.NhaXuatBanID
Where TenNhaXuatBan = N'Tri thức'
go


-- Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”
Select * from NhaXuatBan
Where NhaXuatBanID = 1
go


-- Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản, Loại sách
select * from Sach
go


--  Tìm cuốn sách có giá bán đắt nhất
Select * from Sach
Where Gia = Max(Gia)
go


-- Tìm cuốn sách có số lượng lớn nhất trong kho
Select * from Sach
Where SoLuong = Max(SoLuong)
go


-- Tìm các cuốn sách của tác giả “Eran Katz”
Select * from Sach
Where TacGia = 'Eran Katz'
go


-- Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước


-- Thống kê số đầu sách của mỗi loại sách
Select TenNhaXuatBan, NhaXuatBanID
From NhaXuatBan
where NhaXuatBanID IN
(Select Count(NhaXuatBanID)
From Sach 
)
Group by NhaXuatBanID