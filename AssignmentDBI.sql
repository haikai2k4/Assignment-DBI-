CREATE DATABASE QLHoSoBenhAn
USE QLHoSoBenhAn



CREATE TABLE HoSoBenhAn(
	IDHoSo CHAR(9) NOT NULL,
	HoVaTenBN NVARCHAR(50) ,
	DCHI NVARCHAR(50) ,
	NSINH DATETIME ,
	PHONE varchar(20) ,
	NgayLapHoSo DATETIME,
	NgayHetHanHoSo DATETIME 
)


CREATE TABLE PhieuDangKyKhamBenh
(
	IDDK CHAR(9) NOT NULL,
	IDHoSo CHAR(9)
)


CREATE TABLE LePhi
(
	IDHoaDon CHAR(9) NOT NULL,
	NgDONG DATETIME ,
	SoTienLePhi DECIMAL (10, 3),
	IDHoSo CHAR(9)
)

--SELECT * FROM PHI
CREATE TABLE PhieuNhapXuatVien
(
	IDPHIEU CHAR(9) NOT NULL,
	NGAYNHAP DATETIME ,
	NGAYXUAT DATETIME,
	IDHoSo CHAR(9)
)

--SELECT * FROM PHIEUNHANHXUATVIEN

CREATE TABLE VienPhi
(
	IDVP CHAR(9) NOT NULL,
	NDONGVP DATETIME ,
	TTOANVP DECIMAL (10, 3) ,
	IDHoSo CHAR(9)
)

--SELECT * FROM VIENPHI
CREATE TABLE BacSi
(
	IDBacSi CHAR(9) NOT NULL,
	HoVaTenBS  NVARCHAR(50) ,
	DiaChiBS NVARCHAR(50) ,
	PHONEBS varchar(20),
	IDKHoa CHAR(9)
)

--SELECT * FROM BSI
CREATE TABLE PhieuKhamBenh
(
	IDPKB CHAR(9) NOT NULL,
	NgayGioKham DATETIME ,
	IDHoSo CHAR(9)
)

--SELECT * FROM PHIEUKHAMBENH
CREATE TABLE PhieuXetNghiem
(
	IDXN CHAR(9) NOT NULL,
	TenXetNghiem NVARCHAR(50) ,
	NgayXetNghiem DATETIME ,
	KQUA	NVARCHAR(50) ,
	IDHoSo CHAR(9)
)


--SELECT * FROM PHIEUXN
CREATE TABLE ChiTietPhieuKhamBenh
(
	IDPKB CHAR(9) NOT NULL,
	TrieuChung NVARCHAR(50),
	IDBENH CHAR(9),
	IDBacSi CHAR(9)
)

--SELECT * FROM TTPHIEUKHAM
CREATE TABLE ToaThuoc
(
	IDToaThuoc CHAR(9) NOT NULL,
	NgayLapToaThuoc DateTime ,
	IDPKB CHAR(9),
	IDBENH CHAR(9),
	IDDonThuoc CHAR(9)
)

CREATE TABLE Thuoc 
(
	IDThuoc CHAR (9) NOT NULL,
	TenThuoc nvarchar (50) ,
	HuongDanSuDung nvarchar (150) , 
)

--SELECT * FROM TOATHUOC
CREATE TABLE KHOA
(
	IDKHoa CHAR(9) NOT NULL,
	TenKhoa NVARCHAR(50) ,
)

--SELECT * FROM KHOA
CREATE TABLE BENH
(
	IDBENH CHAR(9) NOT NULL,
	TenBenh NVARCHAR(50) ,
)

--SELECT * FROM BENH

CREATE TABLE ChiTietDonThuoc
(
	IDDonThuoc CHAR(9) NOT NULL,
	SoLuongThuoc INT,
	IDThuoc CHAR (9)
)

--SELECT * FROM CHITIETTOATHUOC
--Khóa Chính của các bảng: 
ALTER TABLE HoSoBenhAn ADD CONSTRAINT PK_IDHoSo PRIMARY KEY (IDHoSo)
ALTER TABLE PhieuDangKyKhamBenh ADD CONSTRAINT PK_IDDK PRIMARY KEY (IDDK)
ALTER TABLE LePhi ADD CONSTRAINT PK_IDHoaDon PRIMARY KEY (IDHoaDon)
ALTER TABLE PhieuNhapXuatVien ADD CONSTRAINT PK_IDPHIEU PRIMARY KEY (IDPHIEU)
ALTER TABLE VienPhi ADD CONSTRAINT PK_IDVP PRIMARY KEY (IDVP)
ALTER TABLE BacSi ADD CONSTRAINT PK_IDBacSi PRIMARY KEY (IDBacSi)
ALTER TABLE PhieuKhamBenh ADD CONSTRAINT PK_IDPKB PRIMARY KEY (IDPKB)
ALTER TABLE PhieuXetNghiem ADD CONSTRAINT PK_IDXN PRIMARY KEY (IDXN)
ALTER TABLE ChiTietPhieuKhamBenh ADD CONSTRAINT PK_IDPKBENH PRIMARY KEY (IDPKB)
ALTER TABLE ToaThuoc ADD CONSTRAINT PK_IDToaThuoc PRIMARY KEY (IDToaThuoc)
ALTER TABLE Thuoc  ADD CONSTRAINT PK_IDThuoc PRIMARY KEY (IDThuoc)
ALTER TABLE KHOA  ADD CONSTRAINT PK_IDKHoa PRIMARY KEY (IDKHoa)
ALTER TABLE BENH ADD CONSTRAINT PK_IDBENH  PRIMARY KEY (IDBENH )
ALTER TABLE ChiTietDonThuoc ADD CONSTRAINT PK_IDDonThuoc  PRIMARY KEY (IDDonThuoc)

--Khóa ngoại của các  bảng: 
ALTER TABLE PhieuDangKyKhamBenh ADD CONSTRAINT FK_HoSoBenhAn_PhieuDKiKham FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE LePhi ADD CONSTRAINT FK_HoSoBenhAn_LePhi FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE PhieuNhapXuatVien ADD CONSTRAINT FK_HoSoBenhAn_PhieuXuatVien FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE VienPhi ADD CONSTRAINT FK_HoSoBenhAn_VienPhi FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE PhieuKhamBenh ADD CONSTRAINT FK_HoSoBenhAn_PhieuKham FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE PhieuXetNghiem ADD CONSTRAINT FK_HoSoBenhAn_PhieuXetNghiem FOREIGN KEY (IDHoSo) REFERENCES HoSoBenhAn(IDHoSo)
ALTER TABLE BacSi ADD CONSTRAINT FK_KHOA_BacSi FOREIGN KEY (IDKHoa) REFERENCES KHOA(IDKHoa)
ALTER TABLE ChiTietPhieuKhamBenh ADD CONSTRAINT FK_BacSi_ChiTietBenh FOREIGN KEY (IDBacSi) REFERENCES BacSi(IDBacSi)
ALTER TABLE ChiTietPhieuKhamBenh ADD CONSTRAINT FK_PhieuKham_ChiTietBenh FOREIGN KEY (IDPKB) REFERENCES PhieuKhamBenh(IDPKB)
ALTER TABLE  ToaThuoc ADD CONSTRAINT FK_ChiTietBenh_ToaThuoc FOREIGN KEY (IDPKB) REFERENCES ChiTietPhieuKhamBenh(IDPKB)
ALTER TABLE ChiTietPhieuKhamBenh ADD CONSTRAINT FK_BENH_ChiTietBenh FOREIGN KEY (IDBENH) REFERENCES BENH(IDBENH)
ALTER TABLE ToaThuoc ADD CONSTRAINT FK_ChiTietDonThuoc_ToaThuoc FOREIGN KEY (IDDonThuoc) REFERENCES ChiTietDonThuoc(IDDonThuoc)
ALTER TABLE ChiTietDonThuoc ADD CONSTRAINT FK_Thuoc_ChiTietDonThuoc FOREIGN KEY (IDThuoc) REFERENCES Thuoc(IDThuoc)

GO
INSERT [dbo].[BacSi] ([IDBacSi], [HoVaTenBS], [DiaChiBS], [PHONEBS], [IDKHoa]) VALUES (N'BS1      ', N'Phạm Đăng Bảo', N'Quận 9', N'0981264555', N'K1       ')
INSERT [dbo].[BacSi] ([IDBacSi], [HoVaTenBS], [DiaChiBS], [PHONEBS], [IDKHoa]) VALUES (N'BS2      ', N'Hà Huy Hoàng', N'Quận 10', N'0982345666', N'K1       ')
INSERT [dbo].[BacSi] ([IDBacSi], [HoVaTenBS], [DiaChiBS], [PHONEBS], [IDKHoa]) VALUES (N'BS3      ', N'Vũ Ngọc Quang', N'Quận 12', N'0983456777', N'K2       ')
INSERT [dbo].[BacSi] ([IDBacSi], [HoVaTenBS], [DiaChiBS], [PHONEBS], [IDKHoa]) VALUES (N'BS4      ', N'Trần Phát Đạt', N'Quận 7', N'0984567888', N'K2       ')
INSERT [dbo].[BacSi] ([IDBacSi], [HoVaTenBS], [DiaChiBS], [PHONEBS], [IDKHoa]) VALUES (N'BS5      ', N'Lương Hồ Tuấn Hậu', N'Quận 1', N'0985678999', N'K3       ')
GO
INSERT [dbo].[BENH] ([IDBENH], [TenBenh]) VALUES (N'B1       ', N'Tăng Huyết Áp')
INSERT [dbo].[BENH] ([IDBENH], [TenBenh]) VALUES (N'B2       ', N'Suy Tim')
INSERT [dbo].[BENH] ([IDBENH], [TenBenh]) VALUES (N'B3       ', N'Viêm Ruột Thừa')
INSERT [dbo].[BENH] ([IDBENH], [TenBenh]) VALUES (N'B4       ', N'Gãy Xương')
INSERT [dbo].[BENH] ([IDBENH], [TenBenh]) VALUES (N'B5       ', N'U Nang Buồng Trứng')
GO
INSERT [dbo].[ChiTietDonThuoc] ([IDDonThuoc], [SoLuongThuoc], [IDThuoc]) VALUES (N'DT1      ', 30, N'T1       ')
INSERT [dbo].[ChiTietDonThuoc] ([IDDonThuoc], [SoLuongThuoc], [IDThuoc]) VALUES (N'DT2      ', 30, N'T2       ')
INSERT [dbo].[ChiTietDonThuoc] ([IDDonThuoc], [SoLuongThuoc], [IDThuoc]) VALUES (N'DT3      ', 10, N'T3       ')
INSERT [dbo].[ChiTietDonThuoc] ([IDDonThuoc], [SoLuongThuoc], [IDThuoc]) VALUES (N'DT4      ', 20, N'T4       ')
INSERT [dbo].[ChiTietDonThuoc] ([IDDonThuoc], [SoLuongThuoc], [IDThuoc]) VALUES (N'DT5      ', 12, N'T5       ')
GO
INSERT [dbo].[ChiTietPhieuKhamBenh] ([IDPKB], [TrieuChung], [IDBENH], [IDBacSi]) VALUES (N'PKB1     ', N'Đau Đầu, Chóng Mặt, Buồn Nôn', N'B1       ', N'BS1      ')
INSERT [dbo].[ChiTietPhieuKhamBenh] ([IDPKB], [TrieuChung], [IDBENH], [IDBacSi]) VALUES (N'PKB2     ', N'Khó Thở, Ho Dai', N'B2       ', N'BS2      ')
INSERT [dbo].[ChiTietPhieuKhamBenh] ([IDPKB], [TrieuChung], [IDBENH], [IDBacSi]) VALUES (N'PKB3     ', N'Đau Bụng Ở Vùng Rốn, Chán Ăn', N'B3       ', N'BS3      ')
INSERT [dbo].[ChiTietPhieuKhamBenh] ([IDPKB], [TrieuChung], [IDBENH], [IDBacSi]) VALUES (N'PKB4     ', N'Sưng, Bầm Tím', N'B4       ', N'BS4      ')
INSERT [dbo].[ChiTietPhieuKhamBenh] ([IDPKB], [TrieuChung], [IDBENH], [IDBacSi]) VALUES (N'PKB5     ', N'Chướng Bụng, Đầy Hơi', N'B5       ', N'BS5      ')
GO
INSERT [dbo].[HoSoBenhAn] ([IDHoSo], [HoVaTenBN], [DCHI], [NSINH], [PHONE], [NgayLapHoSo], [NgayHetHanHoSo]) VALUES (N'HS1      ', N'Trần Văn An ', N'Quận 6', CAST(N'2004-02-28T00:00:00.000' AS DateTime), N'0981783235', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HoSoBenhAn] ([IDHoSo], [HoVaTenBN], [DCHI], [NSINH], [PHONE], [NgayLapHoSo], [NgayHetHanHoSo]) VALUES (N'HS2      ', N'Nguyễn Viết Cường', N'Quận 3', CAST(N'2000-11-22T00:00:00.000' AS DateTime), N'0985823677', CAST(N'2024-09-20T00:00:00.000' AS DateTime), CAST(N'2024-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[HoSoBenhAn] ([IDHoSo], [HoVaTenBN], [DCHI], [NSINH], [PHONE], [NgayLapHoSo], [NgayHetHanHoSo]) VALUES (N'HS3      ', N'Hoàng Mạnh Đức', N'Quận 4', CAST(N'2001-05-06T00:00:00.000' AS DateTime), N'0984365478', CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[HoSoBenhAn] ([IDHoSo], [HoVaTenBN], [DCHI], [NSINH], [PHONE], [NgayLapHoSo], [NgayHetHanHoSo]) VALUES (N'HS4      ', N'Trương Quang Lâm', N'Quận Phú Nhuận', CAST(N'2003-12-01T00:00:00.000' AS DateTime), N'0987615788', CAST(N'2024-09-27T00:00:00.000' AS DateTime), CAST(N'2024-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[HoSoBenhAn] ([IDHoSo], [HoVaTenBN], [DCHI], [NSINH], [PHONE], [NgayLapHoSo], [NgayHetHanHoSo]) VALUES (N'HS5      ', N'Nguyễn Thị Xuân', N'Quận Tân Bình', CAST(N'2004-03-04T00:00:00.000' AS DateTime), N'0983608965', CAST(N'2024-09-27T00:00:00.000' AS DateTime), CAST(N'2024-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHOA] ([IDKHoa], [TenKhoa]) VALUES (N'K1       ', N'Khoa Nội')
INSERT [dbo].[KHOA] ([IDKHoa], [TenKhoa]) VALUES (N'K2       ', N'Khoa Ngoại')
INSERT [dbo].[KHOA] ([IDKHoa], [TenKhoa]) VALUES (N'K3       ', N'Khoa Sản')
GO
INSERT [dbo].[LePhi] ([IDHoaDon], [NgDONG], [SoTienLePhi], [IDHoSo]) VALUES (N'HDLP1    ', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(200.000 AS Decimal(10, 3)), N'HS1      ')
INSERT [dbo].[LePhi] ([IDHoaDon], [NgDONG], [SoTienLePhi], [IDHoSo]) VALUES (N'HDLP2    ', CAST(N'2024-09-20T00:00:00.000' AS DateTime), CAST(200.000 AS Decimal(10, 3)), N'HS2      ')
INSERT [dbo].[LePhi] ([IDHoaDon], [NgDONG], [SoTienLePhi], [IDHoSo]) VALUES (N'HDLP3    ', CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(150.000 AS Decimal(10, 3)), N'HS3      ')
INSERT [dbo].[LePhi] ([IDHoaDon], [NgDONG], [SoTienLePhi], [IDHoSo]) VALUES (N'HDLP4    ', CAST(N'2024-09-26T00:00:00.000' AS DateTime), CAST(100.000 AS Decimal(10, 3)), N'HS4      ')
INSERT [dbo].[LePhi] ([IDHoaDon], [NgDONG], [SoTienLePhi], [IDHoSo]) VALUES (N'HDLP5    ', CAST(N'2024-09-27T00:00:00.000' AS DateTime), CAST(50.000 AS Decimal(10, 3)), N'HS5      ')
GO
INSERT [dbo].[PhieuDangKyKhamBenh] ([IDDK], [IDHoSo]) VALUES (N'PDK1     ', N'HS1      ')
INSERT [dbo].[PhieuDangKyKhamBenh] ([IDDK], [IDHoSo]) VALUES (N'PDK2     ', N'HS2      ')
INSERT [dbo].[PhieuDangKyKhamBenh] ([IDDK], [IDHoSo]) VALUES (N'PDK3     ', N'HS3      ')
INSERT [dbo].[PhieuDangKyKhamBenh] ([IDDK], [IDHoSo]) VALUES (N'PDK4     ', N'HS4      ')
INSERT [dbo].[PhieuDangKyKhamBenh] ([IDDK], [IDHoSo]) VALUES (N'PDK5     ', N'HS5      ')
GO
INSERT [dbo].[PhieuKhamBenh] ([IDPKB], [NgayGioKham], [IDHoSo]) VALUES (N'PKB1     ', CAST(N'2024-09-16T08:00:00.000' AS DateTime), N'HS1      ')
INSERT [dbo].[PhieuKhamBenh] ([IDPKB], [NgayGioKham], [IDHoSo]) VALUES (N'PKB2     ', CAST(N'2024-09-21T08:30:00.000' AS DateTime), N'HS2      ')
INSERT [dbo].[PhieuKhamBenh] ([IDPKB], [NgayGioKham], [IDHoSo]) VALUES (N'PKB3     ', CAST(N'2024-09-23T10:30:00.000' AS DateTime), N'HS3      ')
INSERT [dbo].[PhieuKhamBenh] ([IDPKB], [NgayGioKham], [IDHoSo]) VALUES (N'PKB4     ', CAST(N'2024-09-27T14:30:00.000' AS DateTime), N'HS4      ')
INSERT [dbo].[PhieuKhamBenh] ([IDPKB], [NgayGioKham], [IDHoSo]) VALUES (N'PKB5     ', CAST(N'2024-09-28T15:00:00.000' AS DateTime), N'HS5      ')
GO
INSERT [dbo].[PhieuNhapXuatVien] ([IDPHIEU], [NGAYNHAP], [NGAYXUAT], [IDHoSo]) VALUES (N'PNX1     ', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-17T00:00:00.000' AS DateTime), N'HS1      ')
INSERT [dbo].[PhieuNhapXuatVien] ([IDPHIEU], [NGAYNHAP], [NGAYXUAT], [IDHoSo]) VALUES (N'PNX2     ', CAST(N'2024-09-20T00:00:00.000' AS DateTime), CAST(N'2024-09-23T00:00:00.000' AS DateTime), N'HS2      ')
INSERT [dbo].[PhieuNhapXuatVien] ([IDPHIEU], [NGAYNHAP], [NGAYXUAT], [IDHoSo]) VALUES (N'PNX3     ', CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-09-26T00:00:00.000' AS DateTime), N'HS3      ')
INSERT [dbo].[PhieuNhapXuatVien] ([IDPHIEU], [NGAYNHAP], [NGAYXUAT], [IDHoSo]) VALUES (N'PNX4     ', CAST(N'2024-09-26T00:00:00.000' AS DateTime), CAST(N'2024-09-29T00:00:00.000' AS DateTime), N'HS4      ')
INSERT [dbo].[PhieuNhapXuatVien] ([IDPHIEU], [NGAYNHAP], [NGAYXUAT], [IDHoSo]) VALUES (N'PNX5     ', CAST(N'2024-09-27T00:00:00.000' AS DateTime), CAST(N'2024-09-30T00:00:00.000' AS DateTime), N'HS5      ')
GO
INSERT [dbo].[PhieuXetNghiem] ([IDXN], [TenXetNghiem], [NgayXetNghiem], [KQUA], [IDHoSo]) VALUES (N'PXN1     ', N'Đo Huyết Áp', CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'Cao Huyết Áp', N'HS1      ')
INSERT [dbo].[PhieuXetNghiem] ([IDXN], [TenXetNghiem], [NgayXetNghiem], [KQUA], [IDHoSo]) VALUES (N'PXN2     ', N'Xét Nghiệm Máu', CAST(N'2024-09-21T00:00:00.000' AS DateTime), N'BNP Cao, Có Khả Năng Bị Suy Tim', N'HS2      ')
INSERT [dbo].[PhieuXetNghiem] ([IDXN], [TenXetNghiem], [NgayXetNghiem], [KQUA], [IDHoSo]) VALUES (N'PXN3     ', N'Siêu Âm Bụng', CAST(N'2024-09-23T00:00:00.000' AS DateTime), N'Phát Hiện Viêm Ruột Thừa', N'HS3      ')
INSERT [dbo].[PhieuXetNghiem] ([IDXN], [TenXetNghiem], [NgayXetNghiem], [KQUA], [IDHoSo]) VALUES (N'PXN4     ', N'Chụp X-quang', CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'Gãy Xương Kín', N'HS4      ')
INSERT [dbo].[PhieuXetNghiem] ([IDXN], [TenXetNghiem], [NgayXetNghiem], [KQUA], [IDHoSo]) VALUES (N'PXN5     ', N'Chụp CT', CAST(N'2024-09-28T00:00:00.000' AS DateTime), N'Xác Định U Nang', N'HS5      ')
GO
INSERT [dbo].[Thuoc] ([IDThuoc], [TenThuoc], [HuongDanSuDung]) VALUES (N'T1       ', N'Thuốc Ức Chế Men Chuyển', N'1-2 viên / ngày')
INSERT [dbo].[Thuoc] ([IDThuoc], [TenThuoc], [HuongDanSuDung]) VALUES (N'T2       ', N'Thuốc Lợi Tiểu', N'1 viên / ngày')
INSERT [dbo].[Thuoc] ([IDThuoc], [TenThuoc], [HuongDanSuDung]) VALUES (N'T3       ', N'Kháng Sinh', N'1 viên / ngày')
INSERT [dbo].[Thuoc] ([IDThuoc], [TenThuoc], [HuongDanSuDung]) VALUES (N'T4       ', N'Giảm Đau', N'2 viên / ngày')
INSERT [dbo].[Thuoc] ([IDThuoc], [TenThuoc], [HuongDanSuDung]) VALUES (N'T5       ', N'Điều Trị Hormone', N'1 viên / tháng')
GO
INSERT [dbo].[ToaThuoc] ([IDToaThuoc], [NgayLapToaThuoc], [IDPKB], [IDBENH], [IDDonThuoc]) VALUES (N'TT1      ', CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'PKB1     ', N'B1       ', N'DT1      ')
INSERT [dbo].[ToaThuoc] ([IDToaThuoc], [NgayLapToaThuoc], [IDPKB], [IDBENH], [IDDonThuoc]) VALUES (N'TT2      ', CAST(N'2024-09-21T00:00:00.000' AS DateTime), N'PKB2     ', N'B2       ', N'DT2      ')
INSERT [dbo].[ToaThuoc] ([IDToaThuoc], [NgayLapToaThuoc], [IDPKB], [IDBENH], [IDDonThuoc]) VALUES (N'TT3      ', CAST(N'2024-09-23T00:00:00.000' AS DateTime), N'PKB3     ', N'B3       ', N'DT3      ')
INSERT [dbo].[ToaThuoc] ([IDToaThuoc], [NgayLapToaThuoc], [IDPKB], [IDBENH], [IDDonThuoc]) VALUES (N'TT4      ', CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'PKB4     ', N'B4       ', N'DT4      ')
INSERT [dbo].[ToaThuoc] ([IDToaThuoc], [NgayLapToaThuoc], [IDPKB], [IDBENH], [IDDonThuoc]) VALUES (N'TT5      ', CAST(N'2024-09-28T00:00:00.000' AS DateTime), N'PKB5     ', N'B5       ', N'DT5      ')
GO
INSERT [dbo].[VienPhi] ([IDVP], [NDONGVP], [TTOANVP], [IDHoSo]) VALUES (N'HDVP1    ', CAST(N'2024-09-17T00:00:00.000' AS DateTime), CAST(900.000 AS Decimal(10, 3)), N'HS1      ')
INSERT [dbo].[VienPhi] ([IDVP], [NDONGVP], [TTOANVP], [IDHoSo]) VALUES (N'HDVP2    ', CAST(N'2024-09-23T00:00:00.000' AS DateTime), CAST(750.000 AS Decimal(10, 3)), N'HS2      ')
INSERT [dbo].[VienPhi] ([IDVP], [NDONGVP], [TTOANVP], [IDHoSo]) VALUES (N'HDVP3    ', CAST(N'2024-09-26T00:00:00.000' AS DateTime), CAST(800.000 AS Decimal(10, 3)), N'HS3      ')
INSERT [dbo].[VienPhi] ([IDVP], [NDONGVP], [TTOANVP], [IDHoSo]) VALUES (N'HDVP4    ', CAST(N'2024-09-29T00:00:00.000' AS DateTime), CAST(500.000 AS Decimal(10, 3)), N'HS4      ')
INSERT [dbo].[VienPhi] ([IDVP], [NDONGVP], [TTOANVP], [IDHoSo]) VALUES (N'HDVP5    ', CAST(N'2024-09-30T00:00:00.000' AS DateTime), CAST(300.000 AS Decimal(10, 3)), N'HS5      ')
GO
--1 In ra hồ sơ bệnh án của bệnh nhân 
SELECT * FROM HoSoBenhAn;

--2 Danh sách bác sĩ ở Quận 9 
SELECT * FROM BacSi WHERE DiaChiBS = N'Quận 9';

--3 Danh sách tất cả bệnh nhân mắc bệnh “Tăng Huyết Áp” Bao gồm: mã hồ sơ, họ và tên bệnh nhân, triệu chứng, tên bệnh 
SELECT hs.IDHoSo, hs.HoVaTenBN, ct.TrieuChung, b.TenBenh
FROM HoSoBenhAn hs
JOIN PhieuKhamBenh p  ON hs.IDHoSo = p.IDHoSo
JOIN ChiTietPhieuKhamBenh ct ON ct.IDPKB = p.IDPKB
JOIN BENH b ON b.IDBENH = ct.IDBENH
WHERE TenBenh = N'Tăng Huyết Áp';

--4 Chọn tổng số tiền VienPhi mỗi bệnh nhân thanh toán: họ tên bệnh nhân, tổng tiền viện phí 
SELECT HoVaTenBN, SUM(TTOANVP) AS TotalVienPhi
FROM HoSoBenhAn h 
JOIN VienPhi v  ON h.IDHoSo = v.IDHoSo
GROUP BY HoVaTenBN;

--5 Tìm số lần xét nghiệm  tiến hành cho mỗi bệnh nhân: họ tên bệnh nhân, số lần xét nghiệm 
SELECT HoVaTenBN, COUNT(IDXN) AS NumberOfTests
FROM HoSoBenhAn h 
JOIN PhieuXetNghiem p ON h.IDHoSo = p.IDHoSo
GROUP BY HoVaTenBN;

--6.Truy xuất tất cả BacSi đã khám bệnh nhân “Suy Tim”:
SELECT DISTINCT HoVaTenBS
FROM BacSi b
JOIN ChiTietPhieuKhamBenh c ON b.IDBacSi = c.IDBacSi
JOIN BENH b1 ON c.IDBENH = b1.IDBENH
WHERE b1.TenBenh = N'Suy Tim'; 

--7 In ra số tiền viện phí trung bình của mỗi khoa: 
SELECT TenKhoa, AVG(vp.TTOANVP) AS AvgVienPhi
FROM KHOA k
JOIN BacSi b ON k.IDKHoa = b.IDKHoa
JOIN ChiTietPhieuKhamBenh ct ON ct.IDBacSi = b.IDBacSi
JOIN PhieuKhamBenh p ON ct.IDPKB = p.IDPKB
JOIN HoSoBenhAn hs ON hs.IDHoSo = p.IDHoSo
JOIN VienPhi vp ON vp.IDHoSo =hs.IDHoSo
GROUP BY TenKhoa;

--8 In ra tổng số tiền  của cả viện phí và lệ phí của các bệnh nhân:
SELECT hs.IDHoSo, hs.HoVaTenBN, vp.TTOANVP + lp.SoTienLePhi AS TotalPhi 
FROM HoSoBenhAn hs 
JOIN LePhi lp ON hs.IDHoSo = lp.IDHoSo
JOIN VienPhi vp ON hs.IDHoSo = vp.IDHoSo

--9 In ra bệnh nhân phải trả nhiều tiền nhất 
SELECT hs.IDHoSo, hs.HoVaTenBN, vp.TTOANVP + lp.SoTienLePhi AS TotalPhi 
FROM HoSoBenhAn hs 
JOIN LePhi lp ON hs.IDHoSo = lp.IDHoSo
JOIN VienPhi vp ON hs.IDHoSo = vp.IDHoSo
WHERE  vp.TTOANVP + lp.SoTienLePhi  = (SELECT MAX (TotalPhi ) FROM (SELECT hs.IDHoSo, hs.HoVaTenBN, vp.TTOANVP + lp.SoTienLePhi AS TotalPhi 
FROM HoSoBenhAn hs 
JOIN LePhi lp ON hs.IDHoSo = lp.IDHoSo
JOIN VienPhi vp ON hs.IDHoSo = vp.IDHoSo) AS MaxPhi)

--10 In ra bệnh nhân phải trả its tiền nhất 
SELECT hs.IDHoSo, hs.HoVaTenBN, vp.TTOANVP + lp.SoTienLePhi AS TotalPhi 
FROM HoSoBenhAn hs 
JOIN LePhi lp ON hs.IDHoSo = lp.IDHoSo
JOIN VienPhi vp ON hs.IDHoSo = vp.IDHoSo
WHERE  vp.TTOANVP + lp.SoTienLePhi  = (SELECT MIN (TotalPhi ) FROM (SELECT hs.IDHoSo, hs.HoVaTenBN, vp.TTOANVP + lp.SoTienLePhi AS TotalPhi 
FROM HoSoBenhAn hs 
JOIN LePhi lp ON hs.IDHoSo = lp.IDHoSo
JOIN VienPhi vp ON hs.IDHoSo = vp.IDHoSo) AS MinPhi)


--1 Tạo trigger ngăn chặn việc chèn HoSoBenhAn với NgayLapHoSo trong tương lai:
GO
CREATE TRIGGER trg_PreventFutureNgayLapHoSo
ON HoSoBenhAn
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE NgayLapHoSo > GETDATE())
    BEGIN
        RAISERROR ('NgayLapHoSo cannot be in the future.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
INSERT INTO HoSoBenhAn (IDHoSo, HoVaTenBN, DCHI, NSINH, PHONE, NgayLapHoSo, NgayHetHanHoSo)
VALUES ('HS123', N'Nguyen Van A', N'123 Street', '1990-01-01', '0123456789', GETDATE() + 1, NULL);

--2 Viết câu trigger cập nhật NgayHetHanHoSo tự động 3 ngày sau NgàyLapHoSo:
GO
CREATE TRIGGER trg_UpdateNgayHetHanHoSo
ON HoSoBenhAn
AFTER INSERT
AS
BEGIN
    UPDATE HoSoBenhAn
    SET NgayHetHanHoSo = DATEADD(DAY, 3, NgayLapHoSo)
    WHERE IDHoSo IN (SELECT IDHoSo FROM inserted);
END;
GO

INSERT INTO HoSoBenhAn (IDHoSo, HoVaTenBN, DCHI, NSINH, PHONE, NgayLapHoSo, NgayHetHanHoSo)
VALUES ('HS125', N'Le Thi C', N'789 Boulevard', '1988-03-03', '0123987654', '2024-10-28', NULL);

SELECT IDHoSo, NgayLapHoSo, NgayHetHanHoSo
FROM HoSoBenhAn
WHERE IDHoSo = 'HS125';

--3 Viết hàm tính tổng viện phí của bệnh nhân cho trước 
GO
CREATE FUNCTION fn_TotalVienPhi (@IDHoSo CHAR(9))
RETURNS DECIMAL(10, 3)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 3);
    SELECT @Total = SUM(TTOANVP) FROM VienPhi WHERE IDHoSo = @IDHoSo;
    RETURN ISNULL(@Total, 0);
END;
GO 
SELECT dbo.fn_TotalVienPhi('HS1') AS TotalVienPhi;

--4 Viết câu procedure để thêm bác sĩ mới 
GO
CREATE PROC sp_InsertBacSi
    @IDBacSi CHAR(9),
    @HoVaTenBS NVARCHAR(50),
    @DiaChiBS NVARCHAR(50),
    @PHONEBS VARCHAR(20),
    @IDKHoa CHAR(9)
AS
BEGIN
    INSERT INTO BacSi (IDBacSi, HoVaTenBS, DiaChiBS, PHONEBS, IDKHoa)
    VALUES (@IDBacSi, @HoVaTenBS, @DiaChiBS, @PHONEBS, @IDKHoa);
END;
GO

EXEC sp_InsertBacSi
    @IDBacSi = 'BS001',
    @HoVaTenBS = N'Nguyen Van D',
    @DiaChiBS = N'123 Main St',
    @PHONEBS = '0123456789',
    @IDKHoa = 'KH001';
SELECT * FROM BacSi WHERE IDBacSi = 'BS001';

--5 Tạo store procedure in ra sô tiền lệ phí và viện phí của bệnh nhân được nhập vào 
GO
CREATE PROCEDURE sp_GetPatientFinancialDetails
    @IDHoSo CHAR(9)
AS
BEGIN
    SELECT HoVaTenBN, DCHI, NSINH, PHONE, SoTienLePhi, TTOANVP
    FROM HoSoBenhAn
    LEFT JOIN LePhi ON HoSoBenhAn.IDHoSo = LePhi.IDHoSo
    LEFT JOIN VienPhi ON HoSoBenhAn.IDHoSo = VienPhi.IDHoSo
    WHERE HoSoBenhAn.IDHoSo = @IDHoSo;
END;
GO
EXEC sp_GetPatientFinancialDetails @IDHoSo = 'HS1';


