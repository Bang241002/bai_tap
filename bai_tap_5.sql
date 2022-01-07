-- DATABASE
create DATABASE Assignment05
go

USE Assignment05
go


-- Bảng DanhBa
Create Table DanhBa(
	MaDB int primary key,
	HoVaTen nvarchar(50),
	DiaChi nvarchar(100),
	NgaySinh Date ,
)



-- Bảng SDT
Create Table SDTs(
	MaSDT int primary key,
	SDT char(9),
	MaDB int foreign key references DanhBa(MaDB),
)
go


-- 3
-- INSERT Dữ Liệu
INSERT INTO DanhBa VALUES(1,N'Nguyễn Văn An',N'Hà Nội','1887/11/18'),
						 (2,N'Nguyễn Cẩm Xuyến',N'Nam Định','1990/11/16'),
						 (3,N'Nguyễn Thị Mến',N'TP.HCM','1995/09/08')
go


INSERT INTO SDTs VALUES(1,'987654321',1),
					   (2,'887654321',1),
					   (3,'787654321',1),
					   (4,'687654321',1),
					   (5,'587654321',2),
					   (6,'487654321',2),
					   (7,'387654321',3)
go


-- 4
-- Liệt kê danh sách những người trong danh bạ
Select * From DanhBa
go

-- Liệt kê danh sách số điện thoại có trong danh bạ
Select * From SDTs
go 


-- 5
-- Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
Select * From SDTs
Order By SDT
go


-- Liệt kê các số điện thoại của người có thên là Nguyễn Văn An.
Select HoVaTen, SDT
From DanhBa INNER JOIN SDTs
ON DanhBa.MaDB = SDTs.MaDB
Where HoVaTen = N'Nguyễn Văn An'
go


-- Liệt kê những người có ngày sinh là 1990/11/16
Select * From DanhBa
Where NgaySinh = '1990/11/16'
go


-- 6
-- Tìm số lượng số điện thoại của mỗi người trong danh bạ.
Select HoVaTen, SDTs.MaDB
From DanhBa INNER JOIN SDTs
ON DanhBa.MaDB = SDTs.MaDB
where SDTs.MaDB IN
(Select  COUNT(SDTs.MaDB)
From SDTs 
Group by SDTs.MaDB)
 go


-- Tìm tổng số người trong danh bạ sinh vào tháng 11.
Select * from DanhBa
Where DATEPART(m, NgaySinh) = 11
go


-- Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
Select *
From DanhBa INNER JOIN SDTs
ON DanhBa.MaDB = SDTs.MaDB
go


-- Hiển thị toàn bộ thông tin về người, của số điện thoại 587654321
Select *
From DanhBa left Outer JOIN SDTs
ON DanhBa.MaDB = SDTs.MaDB
Where SDT = '587654321'
Go


-- 7
-- Viết câu lệnh để thay đổi trường ngày sinh là trước ngày hiện tại.
Alter Table DanhBa
Add Check(NgaySinh < getdate())
go


-- Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
--
-- Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.
Alter Table DanhBa
ADD ngaybatdaulienlac date 
go