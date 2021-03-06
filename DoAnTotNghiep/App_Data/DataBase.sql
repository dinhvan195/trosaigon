CREATE DATABASE [TimTro]
GO
USE [TimTro]
GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[MaAnh] [int] IDENTITY(1,1) NOT NULL,
	[DuongDan] [nchar](100) NOT NULL,
	[MaTin] [int] NOT NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTin]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTin](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nchar](50) NULL,
 CONSTRAINT [PK_LoaiTin] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phuong]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phuong](
	[MaPhuong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhuong] [nchar](50) NOT NULL,
	[MaQuan] [int] NOT NULL,
 CONSTRAINT [PK_Phuong] PRIMARY KEY CLUSTERED 
(
	[MaPhuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quan]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quan](
	[MaQuan] [int] IDENTITY(1,1) NOT NULL,
	[TenQuan] [nchar](50) NULL,
 CONSTRAINT [PK_Quan] PRIMARY KEY CLUSTERED 
(
	[MaQuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaTV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[AnhDaiDien] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[LevelAccess] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LuuTin]    Script Date: 09/12/2019 7:45:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuuTin](
	[MaTinLuu] [int] IDENTITY(1,1) NOT NULL,
	[MaTin] [int] NULL,
	[MaTV] [int] NULL,
 CONSTRAINT [PK_LuuTin] PRIMARY KEY CLUSTERED 
(
	[MaTinLuu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tin]    Script Date: 23/11/2019 2:56:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tin](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](150) NOT NULL,
	[NgayDang] [date] NULL,
	[DiaChi] [nvarchar](150) NOT NULL,
	[Gia] [int] NOT NULL,
	[DienTich] [nchar](10) NULL,
	[DoiTuong] [nvarchar](20) NULL,
	[MoTaChiTiet] [nvarchar](max) NOT NULL,
	[MaQuan] [int] NOT NULL,
	[MaPhuong] [int] NOT NULL,
	[LuotXem] [int] DEFAULT(0)  NULL,
	[MaTV] [int] NOT NULL,
	[MaLoai] [int] NOT NULL,
	[KiemDuyet] [bit] NOT NULL,
	[SDTLienHe] [nchar](10) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tin] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_Tin] FOREIGN KEY([MaTin])
REFERENCES [dbo].[Tin] ([MaTin])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_HinhAnh_Tin]
GO
ALTER TABLE [dbo].[Phuong]  WITH CHECK ADD  CONSTRAINT [FK_Phuong_Quan] FOREIGN KEY([MaQuan])
REFERENCES [dbo].[Quan] ([MaQuan])
GO
ALTER TABLE [dbo].[Phuong] CHECK CONSTRAINT [FK_Phuong_Quan]
GO
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_LoaiTin] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiTin] ([MaLoai])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_LoaiTin]
GO
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_Phuong] FOREIGN KEY([MaPhuong])
REFERENCES [dbo].[Phuong] ([MaPhuong])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_Phuong]
GO
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_Quan] FOREIGN KEY([MaQuan])
REFERENCES [dbo].[Quan] ([MaQuan])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_Quan]
GO
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_ThanhVien]
GO
ALTER TABLE [dbo].[LuuTin]  WITH CHECK ADD  CONSTRAINT [FK_LuuTin_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[LuuTin] CHECK CONSTRAINT [FK_LuuTin_ThanhVien]
GO
ALTER TABLE [dbo].[LuuTin]  WITH CHECK ADD  CONSTRAINT [FK_LuuTin_Tin] FOREIGN KEY([MaTin])
REFERENCES [dbo].[Tin] ([MaTin])
GO
ALTER TABLE [dbo].[LuuTin] CHECK CONSTRAINT [FK_LuuTin_Tin]
GO
--Quận--------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].Quan ON

INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (1,N'Quận 1')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (2,N'Quận 2')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (3,N'Quận 3')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (4,N'Quận 4')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (5,N'Quận 5')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (6,N'Quận 6')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (7,N'Quận 7')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (8,N'Quận 8')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (9,N'Quận 9')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (10,N'Quận 10')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (11,N'Quận 11')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (12,N'Quận 12')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (13,N'Quận Thủ Đức')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (14,N'Quận Gò Vấp')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (15,N'Quận Bình Thạnh')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (16,N'Quận Tân Bình')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (17,N'Quận Tân Phú')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (18,N'Quận Phú nhuận')
INSERT [dbo].[Quan] ([MaQuan],[TenQuan]) VALUES (19,N'Quận Bình Tân')

SET IDENTITY_INSERT [dbo].Quan OFF
--Phường--------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].Phuong ON

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (1,N'Phường Tân Định',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (2,N'Phường Đa Kao',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (3,N'Phường Bến Nghé',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (4,N'Phường Bến Thành',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (5,N'Phường Nguyễn Thái Bình',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (6,N'Phường Phạm Ngũ Lão',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (7,N'Phường Cầu Ông Lãnh',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (8,N'Phường Cô Giang',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (9,N'Phường Nguyễn Cư Trinh',1)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (10,N'Phường Cầu Kho',1)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (11,N'Phường Thảo Điền',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (12,N'Phường An Phú',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (13,N'Phường Bình An',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (14,N'Phường Bình Trưng Đông',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (15,N'Phường Bình Trưng Tây',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (16,N'Phường Bình Khánh',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (17,N'Phường An Khánh',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (18,N'Phường Cát Lái',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (19,N'Phường Thạnh Mỹ Lợi',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (20,N'Phường An Lợi Đông',2)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (21,N'Phường Thủ Thiêm',2)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (22,N'Phường 1',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (23,N'Phường 2',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (24,N'Phường 3',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (25,N'Phường 4',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (26,N'Phường 5',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (27,N'Phường 6',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (28,N'Phường 7',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (29,N'Phường 8',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (30,N'Phường 9',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (31,N'Phường 11',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (32,N'Phường 12',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (33,N'Phường 13',3)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (34,N'Phường 14',3)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (35,N'Phường 1',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (36,N'Phường 2',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (37,N'Phường 3',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (38,N'Phường 5',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (39,N'Phường 6',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (40,N'Phường 8',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (41,N'Phường 9',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (42,N'Phường 12',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (43,N'Phường 13',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (44,N'Phường 14',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (45,N'Phường 15',4)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (46,N'Phường 16',4)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (47,N'Phường 1',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (48,N'Phường 2',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (49,N'Phường 3',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (50,N'Phường 4',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (51,N'Phường 5',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (52,N'Phường 6',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (53,N'Phường 7',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (54,N'Phường 8',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (55,N'Phường 9',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (56,N'Phường 10',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (57,N'Phường 11',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (58,N'Phường 12',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (59,N'Phường 13',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (60,N'Phường 14',5)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (61,N'Phường 15',5)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (62,N'Phường 1',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (63,N'Phường 2',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (64,N'Phường 3',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (65,N'Phường 4',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (66,N'Phường 5',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (67,N'Phường 6',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (68,N'Phường 7',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (69,N'Phường 8',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (70,N'Phường 9',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (71,N'Phường 10',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (72,N'Phường 11',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (73,N'Phường 12',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (74,N'Phường 13',6)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (75,N'Phường 14',6)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (76,N'Phường Tân Thuận Đông',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (77,N'Phường Tân Thuận Tây',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (78,N'Phường Tân Kiểng',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (79,N'Phường Tân Hưng',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (80,N'Phường Bình Thuận',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (81,N'Phường Tân Quy',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (82,N'Phường Phú Thuận',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (83,N'Phường Tân Phú',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (84,N'Phường Tân Phong',7)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (85,N'Phường Phú Mỹ',7)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (86,N'Phường 1',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (87,N'Phường 2',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (88,N'Phường 3',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (89,N'Phường 4',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (90,N'Phường 5',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (91,N'Phường 6',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (92,N'Phường 7',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (93,N'Phường 8',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (94,N'Phường 9',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (95,N'Phường 10',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (96,N'Phường 11',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (97,N'Phường 12',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (98,N'Phường 13',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (99,N'Phường 14',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (100,N'Phường 15',8)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (101,N'Phường 16',8)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (102,N'Phường Long Bình',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (103,N'Phường Long Thạnh Mỹ',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (104,N'Phường Tân Phú',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (105,N'Phường Hiệp Phú',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (106,N'Phường Tăng Nhơn Phú A',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (107,N'Phường Tăng Nhơn Phú B',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (108,N'Phường Phước Long B',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (109,N'Phường Phước Long A',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (110,N'Phường Trường Thạnh',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (111,N'Phường Long Phước',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (112,N'Phường Long Trường',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (113,N'Phường Phước Bình',9)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (114,N'Phường Phú Hữu',9)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (115,N'Phường 1',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (116,N'Phường 2',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (117,N'Phường 3',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (118,N'Phường 4',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (119,N'Phường 5',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (120,N'Phường 6',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (121,N'Phường 7',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (122,N'Phường 8',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (123,N'Phường 9',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (124,N'Phường 10',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (125,N'Phường 11',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (126,N'Phường 12',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (127,N'Phường 13',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (128,N'Phường 14',10)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (129,N'Phường 15',10)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (130,N'Phường 1',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (131,N'Phường 2',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (132,N'Phường 3',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (133,N'Phường 4',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (134,N'Phường 5',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (135,N'Phường 6',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (136,N'Phường 7',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (137,N'Phường 8',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (138,N'Phường 9',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (139,N'Phường 10',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (140,N'Phường 11',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (141,N'Phường 12',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (142,N'Phường 13',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (143,N'Phường 14',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (144,N'Phường 15',11)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (145,N'Phường 16',11)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (146,N'Phường Thạnh Xuân',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (147,N'Phường Thạnh Lộc',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (148,N'Phường Hiệp Thành',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (149,N'Phường Thới An',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (150,N'Phường Tân Chánh Hiệp',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (151,N'Phường An Phú Đông',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (152,N'Phường Tân Thới Hiệp',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (153,N'Phường Trung Mỹ Tây',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (154,N'Phường Tân Hưng Thuận',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (155,N'Phường Đông Hưng Thuận',12)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (156,N'Phường Tân Thới Nhất',12)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (157,N'Phường Linh Xuân',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (158,N'Phường Bình Chiểu',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (159,N'Phường Linh Trung',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (160,N'Phường Tam Bình',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (161,N'Phường Tam Phú',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (162,N'Phường Hiệp Bình Phước',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (163,N'Phường Hiệp Bình Chánh',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (164,N'Phường Linh Chiểu',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (165,N'Phường Linh Tây',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (166,N'Phường Linh Đông',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (167,N'Phường Bình Thọ',13)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (168,N'Phường Trường Thọ',13)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (169,N'Phường 1',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (170,N'Phường 3',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (171,N'Phường 4',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (172,N'Phường 5',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (173,N'Phường 6',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (174,N'Phường 7',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (175,N'Phường 8',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (176,N'Phường 9',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (177,N'Phường 10',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (178,N'Phường 11',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (179,N'Phường 12',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (180,N'Phường 13',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (181,N'Phường 14',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (182,N'Phường 15',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (183,N'Phường 16',14)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (184,N'Phường 17',14)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (185,N'Phường 1',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (186,N'Phường 2',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (187,N'Phường 3',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (188,N'Phường 5',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (189,N'Phường 6',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (190,N'Phường 7',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (191,N'Phường 11',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (192,N'Phường 12',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (193,N'Phường 13',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (194,N'Phường 14',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (195,N'Phường 15',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (196,N'Phường 17',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (197,N'Phường 19',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (198,N'Phường 21',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (199,N'Phường 22',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (200,N'Phường 24',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (201,N'Phường 25',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (202,N'Phường 26',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (203,N'Phường 27',15)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (204,N'Phường 28',15)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (205,N'Phường 1',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (206,N'Phường 2',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (207,N'Phường 3',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (208,N'Phường 4',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (209,N'Phường 5',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (210,N'Phường 6',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (211,N'Phường 7',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (212,N'Phường 8',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (213,N'Phường 9',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (214,N'Phường 10',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (215,N'Phường 11',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (216,N'Phường 12',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (217,N'Phường 13',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (218,N'Phường 14',16)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (219,N'Phường 15',16)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (220,N'Phường Tân Sơn Nhì',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (221,N'Phường Tây Thạnh',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (222,N'Phường Sơn Kỳ',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (223,N'Phường Tân Quý',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (224,N'Phường Tân Thành',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (225,N'Phường Phú Thọ Hoà',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (226,N'Phường Phú Thạnh',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (227,N'Phường Phú Trung',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (228,N'Phường Hoà Thạnh',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (229,N'Phường Hiệp Tân',17)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (230,N'Phường Tân Thới Hoà',17)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (231,N'Phường 1',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (232,N'Phường 2',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (233,N'Phường 3',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (234,N'Phường 4',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (235,N'Phường 5',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (236,N'Phường 6',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (237,N'Phường 7',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (238,N'Phường 8',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (239,N'Phường 9',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (240,N'Phường 10',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (241,N'Phường 11',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (242,N'Phường 12',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (243,N'Phường 13',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (244,N'Phường 14',18)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (245,N'Phường 15',18)

INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (246,N'Phường Bình Hưng Hòa',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (247,N'Phường Bình Hưng Hòa A',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (248,N'Phường Bình Hưng Hòa B',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (249,N'Phường Bình Trị Đông',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (250,N'Phường Bình Trị Đông A',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (251,N'Phường Bình Trị Đông B',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (252,N'Phường Tân Tạo',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (253,N'Phường Tân Tạo A',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (254,N'Phường An Lạc',19)
INSERT [dbo].[Phuong] (MaPhuong,TenPhuong,MaQuan) VALUES (255,N'Phường An Lạc A',19)

SET IDENTITY_INSERT [dbo].Phuong OFF
--Loại tin-----------------------------------------------------------------------------------
INSERT [dbo].[LoaiTin] ([TenLoai]) VALUES (N'Cho thuê phòng')
INSERT [dbo].[LoaiTin] ([TenLoai]) VALUES (N'Tìm người ở ghép')
INSERT [dbo].[LoaiTin] ([TenLoai]) VALUES (N'Cho thuê nguyên căn')
INSERT [dbo].[LoaiTin] ([TenLoai]) VALUES (N'Cho thuê mặt bằng')
--Thành Viên----------------------------------------------------------------------------------
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (1,N'Quản trị viên','0123456789','admin@gmail.com','admin',N'252 Lý Chính Thắng','avatar5.png',1)
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (1,N'Nguyễn Đình Văn','0112346587','dinhvan47@gmail.com','123456',N'134/45 Lý Chính Thắng','avatar5.png',1)
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (1,N'Vũ Thành Vinh','0707987644','vuthannvinh0938@gmail.com','123456',N'134 Trần Diệu','avatar1.png',1)
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (0,N'Trần Thanh Hằng','0967281473','thaanhhang1335@gmail.com','456789',N'54 Nguyễn Văn Thủ','avt5.jpg',0)
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (0,N'Nguyễn Đình Trọng','0707456789','dinhtrong54@gmail.com','147852',N'122 Trần Quang Khải','avt4.jpg',1)
INSERT [dbo].[ThanhVien] (LevelAccess,HoTen,SDT,Email,MatKhau,DiaChi,AnhDaiDien,GioiTinh) VALUES (0,N'Nguyễn Quỳnh Anh','0909756890','qanh195921@gmail.com','258963',N'25 Nguyễn Bính','avt3.jpg',0)

--Tin--------------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].Tin ON 
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,1,5,N'Cho thuê phòng trọ cao cấp, tiện nghi tại 319/22 Nguyễn Công Trứ, P.Nguyễn Thái Bình, Quận 1',N'319/22 Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, Hồ Chí Minh','18 - 20m2',6000000,'0913662386',1,1,1,'2019-06-08',N'Tất cả',N'Cho thuê phòng Quận 1 máy lạnh invester mới 100%, giờ tự do, nhà có thang máy, nước nóng năng lượng mặt trời, ban công, cửa sổ thoáng, sạch sẽ, khu an ninh, trung tâm. WC riêng, bồn tắm đứng Phòng trọ gần chợ Bến Thành, phòng khám hiếm muộn bác sĩ Ngọc Lan. Đây là khu vực rất nhiều ngân hàng, công ty tài chính, chứng khoán đặt trụ sở phù hợp các bạn làm việc cho các bạn làm việc cho các cơ quan này.Xung quanh nơi đây có đầy đủ trung tâm thương mại lớn, cửa hàng tiện lợi như: vinmart, siêu thị co.op food, bách hoá xanh..')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,2,9,N'Tìm 1 nữ ở ghép tại nhà nguyên căn Cống Quỳnh, Q.1',N'157A Lầu 1 Đường Cống Quỳnh, Phường Nguyễn Cư Trinh, Quận 1, Hồ Chí Minh157A Lầu 1 Đường Cống Quỳnh, Phường Nguyễn Cư Trinh, Quận 1, Hồ Chí Minh','100m2',1500000,'0703111889',1,2,1,'2019-06-22',N'Nữ',N'Nhà nguyên căn cũ rộng rãi, có gác suốt nằm trên mặt tiền đường Cống quỳnh, Q1. Ở 5 người, tiền nhà 1tr/người/tháng Nhà đối diện chợ Thái Bình, cách Bùi Viện 100m, gần trường sân khấu điện ảnh, nhiều siêu thị: Siêu thị Hà Nội, Coopmart, cv 23/9, chợ Bến Thành, bệnh viện Từ Dũ, ngay ngã tư Nguyễn Trãi và Cống Quỳnh thuận tiện đi lại các địa điểm ở các quận. Có wifi: 50k/tháng. Nước tầm 150k/người, điện giá nhà nước (tầm 100k/người). Mọi người đều đi làm văn phòng (hành chính, nhân sự, trợ lý), an ninh, yên tĩnh. Giờ giấc tự do, ko chung chủ. Giữ xe 220k/tháng tại bãi giữ xe hội người mù cách nhà ở 5m. Ưu tiên: Người có ít đồ đạc, nhân viên văn phòng, người ở sạch sẽ gọn gàng, người mong muốn ở cố định, lâu dài. Mình ko tiếp các trường hợp ở vài tháng')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,3,3,N'Cho thuê lại mặt bằng làm shop, tiệm nail, tiệm làm tóc ngay trung tâm quận 1',N'17c Đường Nam Kỳ Khởi Nghĩa, Phường Bến Nghé, Quận 1, Hồ Chí Minh','70m2',15000000,'0834985987',1,4,2,'2019-02-27',N'Tất cả',N'Cần cho thuê lại mặt bằng diện tích sử dụng 70m2 . Mình đã đầu tư làm quán nước và cơm trưa, trưởng bếp nghỉ nên mình cho thuê lại cho thuê lại mặt bằng : 15tr/ tháng.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,4,1,N'Phòng ngay cầu Kiệu, Quận 1, full nội thất, có ban công cửa sổ cực thoáng mát',N'29A/1 Đường Nguyễn Văn Nguyễn, Phường Tân Định, Quận 1, Hồ Chí Minh','25m2',6000000,'0903156245',1,1,3,'2019-08-28',N'Tất cả',N'Tiện nghi: Có thang máy, xe để trong nhà, máy giặt free, camera an ninh 24/24h, ban công lấy gió trời, phòng thoáng, sạch sẽ, wifi tốc độ cao. Phòng nội thất bao gồm: Giường nệm, tủ quần áo, bàn làm việc, tủ lạnh mini, kệ bếp, bếp điện từ, phòng vệ sinh trong phòng, máy nước nóng lạnh, bàn ăn... Điểm thuận lợi: Nhà không chung chủ, giờ giấc tự do, nhà có sân thượng thoáng, phơi đồ thoải mái. Có dịch vụ vệ sinh công cộng trong nhà hàng tuần. Vị trí giao thông: Ngay Quận 1 nên di chuyển qua các quận như 2, 3, 4, 5, 8, 7 đều gần.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,5,10,N'Tìm nam ở ghép trong KTX cao cấp full nội thất phòng 4 người',N'18/45 Đường Nguyễn Văn Cừ, Phường Cầu Kho, Quận 1, Hồ Chí Minh','60m2',1400000,'0981171355',1,2,4,'2019-09-22',N'Nam',N'Giường tầng chắc chắn kèm nệm, grap, rèm, bàn học và tủ áo. Nhà bếp rộng rãi có tủ lạnh, bếp từ, hồng ngoại, và đầy đủ dụng cụ bếp. Phòng khách có sofa, bàn tiếp khách sinh hoạt thoải mái. Nhà vệ sinh sạch sẽ kèm máy nước nóng. Máy giặt và máy sấy miễn phí. Wifi chất lượng cao free. Hệ thống cửa điện tử ra vào hiện đại, camera an ninh 24/24. Tiện ích: 2 siêu thị vinmart, ministop, chợ, bệnh viện, trung tâm thương mại, ngân hàng,...')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,6,12,N'PHÒNG TRỌ CAO CẤP CÓ THANG MÁY VỪA HOÀN THIỆN TẠI QUẬN 2',N'Đường Thân Văn Nhiếp, Phường An Phú, Quận 2, Hồ Chí Minh','23m2',3300000,'0796252353',2,1,5,'2019-03-21',N'Tất cả',N'Cách Mặt tiền Đường Mai Chí Thọ 10m. Liền kề Đô Thị Thủ Thiêm, chỉ cách hầm Thủ Thiêm 3 Km. Liền kề đại lộ Đông Tây, cao tốc TpHCM – Long Thành. Nằm giữa trung tâm Quận 2, được bao quanh bởi những đường giao thông huyết mạch, khu dân cư hiện đại bậc nhất Sài Thành. Mang đến cho cư dân những dịch vụ tiện ích hiện đại. Liền kề cảng Cát Lái. Cách bệnh viện quận 2 khoảng 5 phút di chuyển, gần trường học. Cách siêu thị 24 giờ ( seven eleven), siêu thị Coop mart 50 mét.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,7,12,N'Tìm nữ đi làm ở ghép chung cư cao cấp The Sun Avnue Quận 2',N'Đường Mai Chí Thọ, Phường An Phú,Quận 2, Hồ Chí Minh','76m2',3700000,'0908346069',2,2,1,'2019-02-26',N'Nữ',N'Căn hộ 2 phòng ngủ còn dư một phòng, trong phòng đã có 2 nữ đang ở cần tìm 1 nữ ở ghép (3 người ở chung một phòng) nhà có tổng cộng 5-6 người ở. Phòng master rộng 25m2 toilet trong riêng biệt. Căn hộ được trang bị đầy đủ nội thất như tủ lạnh, máy lạnh, máy nước nóng, giường tủ, nệm, phòng ngủ sàn gỗ cao cấp, xoong, nồi, chén bát, ....... Cửa ra vào được trang bị khóa vân tay, tòa nhà an ninh sử dụng thẻ thang máy, bảo vệ 24/7 nên vô cùng an toàn và bảo mật. Nhà mới bàn giao, nội thất mới hoàn thiện nên rất sạch sẽ và cao cấp. Ban công view sông mát mẻ, yên tĩnh thích hợp thư giãn sau giờ làm việc căng thẳng, Khu dân cư dân trí cao. Dự án với nhiều tiện ích: hồ bơi tràn bờ, phòng gym, khu vực sinh hoạt cộng động, khu bbq, khu cafe, cửa hàng tiện lợi Circle K, Vinmart+, 7eleven, .....')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,8,13,N'Cho thuê mặt bằng Q.2 kinh doanh',N'Đường Trần Não, Phường Bình An, Quận 2, Hồ Chí Minh','95m2',25000000,'0946380730',2,4,2,'2019-01-27',N'Tất cả',N'Mặt tiền đường Trần Não, quận 2. Có đầy đủ nội thất được đặt đóng theo thiết kế hiện đại. (sang nhượng giá rẻ cho chủ nhân thiện chí mới). Mật độ phù hợp cho khoảng 25 -30 người làm việc ngay & luôn!')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,9,13,N'PHÒNG TRỌ PHƯỜNG BÌNH AN, QUẬN 2',N'30/9 Đường số 1, Phường Bình An, Quận 2, Hồ Chí Minh','20m2',2500000,'0903743462',2,1,3,'2019-11-15',N'Tất cả',N'Phòng trọ Quận 2 tiện nghi, khu Phường Bình An, không ngập nước, sạch sẽ, khu dân trí cao. Tiện nghi:Wifi.Bãi giữ xe.Nước nóng.Giường.Nệm Kymdan. Bàn ghế. Máy lạnh.Camera.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,10,19,N'Nam ghép phòng quận 2 rất nhiều tiện ích',N'22/12 đường số 5 Phường Thạnh Mỹ Lợi, Quận 2, Hồ Chí Minh','35m2',1500000,'0981171355',2,2,4,'2019-09-22',N'Nam',N'Phòng rộng ở 3 nam, hiện đã có 2 bạn. Tiện ích: WC riêng, máy lạnh, tủ để quần áo riêng màu xanh như hình. Khu vực chung đã có đủ: bếp ga đôi nấu ăn, phòng giặt đồ, tủ lạnh để đồ ăn. Gia thuê : 1,7 T/ thang phòng máy lạnh., hoặc 1,5 T/ tháng giá phòng không có máy lạnh Giá điện nước chia đều giá rẻ, miễn phí wifi internet. Vé xe và phí quản lý theo hoá đơn chung.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,11,24,N'Cho thuê phòng đầy đủ nội thất, Quận 3',N'594/5 Điện Biên Phủ vs Nguyễn Thiện Thuật, Phường 3','30m2',5000000,'0909658468',3,1,5,'2019-02-17',N'Tất cả',N'Sẽ là nơi lý tưởng để nghỉ ngơi sau một ngày làm việc bận rôn.Diện tích 30-40m2, thoáng mát, có của sổ, balcon, có khu tiếp bạn và người thân khi ghé thăm, cho bạn cảm giác như ở nhà mình. yên tĩnh, an ninh, giờ giấc tự do, có chìa khóa riêng. Hiện chúng tôi có 3 phòng  trống Nhà đẹp phù hợp với đối tượng là khách nước ngoài, Việt kiều, công chức, sinh viên.Tiện ích: Máy nước nóng lạnh, nhà vệ sinh ngay trong phòng, sân phơi quần áo, để xe trong sân nhà, internet WiFi, TH cáp, camera 24/24 ở mỗi tầng lầu và sân để xe, báo cháy tự động.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,12,30,N'Cần tìm nữ ở ghép gấp, chung cư 86 Nguyễn Thông, Quận 3',N'Chung cư 86 Nguyễn Thông, Phường 9,Quận 3, Hồ Chí Minh','30m2',700000,'0908977952',3,2,1,'2019-04-13',N'Nữ',N'Nhà nguyên căn sạch sẽ, thoáng mát, gần chợ, gần ga Sài Gòn, trung tâm Quận 3. Có chỗ nấu ăn và chia khoa rieng. Gía 700k/tháng bao điện nước, wifi miễn phí. Cần nữ nhân viên văn phòng hoặc có việc làm ổn định')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,13,22,N'Cho thuê mặt bằng kinh doanh ngay hẻm 290 Lý Thái Tổ, Q.3',N'Hẻm 290 Đường Lý Thái Tổ, Phường 1, Quận 3, Hồ Chí Minh','21m2',7000000,'0916739595',3,4,2,'2019-05-11',N'Tất cả',N'Nhà hẻm xe hơi 6m, ngay khu dân cư đông đúc qua lại hằng ngày. Cách đường Lý Thái Tổ 20m. Điện nước riêng, WC riêng, có máy lạnh, cửa kính cường lực 2 lớp. Thích hợp kinh doanh nhiều ngành nghề. Mặt bằng đẹp, mới, có gác lửng, mái che. có thể ở lại. Đã trang bị sẵn wifi, camera an ninh vào chỉ việc kinh doanh thôi. Tiện ích xung quanh đầy đủ không thiếu gì cả')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,14,31,N'PHÒNG MÁY LẠNH CHO THUÊ Ở CMT8, TT Q3 BAN CÔNG THOÁNG MÁT',N'390/11A CMT8, P11, Q3','26m2',4500000,'0389843210',3,1,3,'2019-07-12',N'Tất cả',N'Phòng lớn có máy lạnh cho thuê sạch đẹp như mới, nằm trong hẻm khu an ninh, thoáng mát, rộng rãi yên tĩnh. Hiện có 1 phòng, rộng 26m2, ban công thoáng mát, nhà vệ sinh và lối đi riêng, giờ giấc tự do.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,15,33,N'Tìm Nam Ở Ghép - Phòng Sạch Sẽ, Thoáng Mát - Q3',N'686/72/49 Đường Cách Mạng Tháng Tám, Phường 13, Quận 3, Hồ Chí Minh','16m2',1300000,'0981171355',3,2,4,'2019-09-22',N'Nam',N'Nhà phố 4 tầng. Có phòng tắm riêng. Có chỗ để xe miễn phí. Có wifi đầy đủ. Ở luôn, k cần cọc. Ưu tiên ae đã đi làm')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,16,43,N'Cho thuê phòng trọ đầy đủ tiện nghi tại trung tâm',N'Đường Đoàn Văn Bơ, Phường 13, Quận 4, Hồ Chí Minh','24m2',5000000,'0983635245',4,1,5,'2019-06-18',N'Tất cả',N'Nhà mới xây có phòng cho thuê đầy đủ tiện nghi gồm máy lạnh, tủ lạnh, tivi smart, giường ga gối đệm đầy đủ! Wc với các thiết bị cao cấp! Nhà nằm ngay đường 576 đoàn văn bơ rộng rãi! Khu ăn ninh vì nhiều dịch vụ tây âu như phòng trọ, thuê xe, giặt ủi và đổi tiền nên rất văn minh sạch sẽ! Thích hợp với các bạn nước ngoài, các bạn công chức làm tại khu vực trung tâm sài gòn vì 5 phút tới q1! Ai muốn có một chỗ ơ như khách sạn mà giá lại nhà trọ thì hãy gọi ngay')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,17,38,N'TÌM 1 BẠN NỮ Ở CHUNG QUẬN 4',N'02 Đường số 2, Phường 5, Quận 4, Hồ Chí Minh','25m2',1700000,'0909979187',4,2,1,'2019-03-24',N'Nữ',N'Phòng đầy đủ tiện nghi, có máy giặt, tủ lạnh, chỗ để xe miễn phí. Chỉ tìm sinh viên/ nhân viên văn phòng hiền lành, ý thức để ở chung nhe. Có tất cả những tiện ích bạn cần. Bạn đến xem sẽ thích ngay.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,18,42,N'Mặt bằng Q.4 cho thuê đường chính',N'517 Đường Đoàn Văn Bơ, Phường 12, Quận 4, Hồ Chí Minh','10m2',5000000,'0974090592',4,4,2,'2019-03-21',N'Tất cả',N'Gần chợ đông đúc dân cư qua lại, bán hàng sáng đêm. Mặt bằng có sẵn: cửa kính, dán tường sạch sẽ không bao gồm máy lạnh ( nếu lấy luôn máy lạnh + đèn trần bù thêm 5 triệu sau này dọn đi được tháo dỡ đem theo). Chủ nhà thân thiện lối đi chung, nhưng nhà chỉ có 1 cô lớn tuổi ít ở nhà nên riêng tư và an toàn. Điện nước có đồng hồ riêng, tính giá nhà nước. Mặt bằng không ở lại, chính chủ đăng tin miễn tiếp môi giới')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,19,44,N'Thuê phòng 3 triệu phòng 20m2 hẻm 500 Đoàn Văn Bơ, Quận 4',N'500/97 Đường Đoàn Văn Bơ, Phường 14, Quận 4, Hồ Chí Minh','20m2',3000000,'0938933662',4,1,3,'2019-06-27',N'Tất cả',N'Cho thuê phòng 15m2 nhà đẹp mới xây hẻm 3m số 500 Đoàn Văn Bơ, giá 3 triệu/tháng. Khu dân cư yên tĩnh an ninh, gần chợ 200 Xóm Chiếu và trường Đh Nguyễn Tất Thành. Phòng rất đẹp,WC-bếp riêng, đồng hồ điện-nước riêng mỗi phòng.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,20,45,N'Cần gấp 1 bạn nam để ở chung phòng',N'122 Đường Nguyễn Tất Thành,Phường 15, Quận 4, Hồ Chí Minh','24m2',1000000,'0981171355',4,2,4,'2019-09-22',N'Nam',N'Cần gấp 1 bạn nam để ở chung. Hiện tại trong phòng đều là sv. Điện nước tính theo giá nhà nước, có nước lọc uống free')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,21,56,N'Cho Thuê Phòng Đẹp Ngay Đường Võ Văn Kiệt, View Sông',N'1188 Đường Võ Văn Kiệt, Phường 10, Quận 5, Hồ Chí Minh','40m2',6500000,'0945640094',5,1,5,'2019-04-16',N'Tất cả',N'Gần Công viên nước Đại Thế Giới, Nhà văn hóa Q5, Trường đại học Hồng Bàng, Bệnh viện Nguyễn Tri Phương, bệnh viện ĐH Y Dược, Sở cảnh sát công an Q5, UBND Q5, Rạp chiếu phim CGV Hùng Vương Palaza. Mất 3 phút để đến đường Nguyễn Trãi, đường An Dương Vương, đường Nguyễn Tri Phương... Đặc biệt: rất phù hợp với những người làm việc ở Q1 muốn kiếm phòng đẹp, full nội thất, an ninh nhưng giá cả phù hợp. Gần Công viên nước Đại Thế Giới, Nhà văn hóa Q5, Trường đại học Hồng Bàng, Bệnh viện Nguyễn Tri Phương, bệnh viện ĐH Y Dược, Sở cảnh sát công an Q5, UBND Q5, Rạp chiếu phim CGV Hùng Vương Palaza. Mất 3 phút để đến đường Nguyễn Trãi, đường An Dương Vương, đường Nguyễn Tri Phương... Đặc biệt: rất phù hợp với những người làm việc ở Q1 muốn kiếm phòng đẹp, full nội thất, an ninh nhưng giá cả phù hợp.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,22,52,N'Cần 2 bạn nữ dễ thương ở ghép chung cư',N'107b Đường Trần Hưng Đạo, Phường 6, Quận 5, Hồ Chí Minh','40m2',1350000,'0934046112',5,2,1,'2019-08-17',N'Nữ',N'Hiện tại phòng có 2 nữ dễ thương làm văn phòng ở rồi. Giá 5,5 triệu cho nguyên căn rồi chia theo số người nha. Điện nước giá nhà nước. Phòng có cửa sổ thoáng mát, vệ sinh riêng.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,23,48,N'Mặt bằng kinh doanh Quận 5 130m²',N'Đường Phan Văn Trị, Phường 2, Quận 5, Hồ Chí Minh','130m2',30000000,'0911787379',5,4,2,'2019-02-11',N'Tất cả',N'Mặt bằng kinh doanh Quận 5 130m2. 1 triệt lửng 2 Lầu,3 nhà vệ sinh,nhà đẹp mới sạch sẽ,2 máy lạnh,liên hệ để biết chi tiết rõ hơn.Sang lại Hoặc Thuê.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,24,48,N'cho thuê phòng trọ sinh viên ngay trung tâm sài gòn quận 5',N'38/22 Đường Phan Văn Trị, Phường 2, Quận 5, Hồ Chí Minh','20m2',25000000,'0943565446',5,1,3,'2019-09-04',N'Tất cả',N'Phòng rộng 20m2, có ban ban công nhỏ phía sau, toilet riêng dạng nhà 3 tầng, mỗi tầng 2 phòng xài chung 1 toilet.  Ở riêng không chung chủ, xe dựng dưới tầng trệt miễn phí. Wifi chia theo đầu người. Điện nước theo giá nhà nước rất rẻ. Chủ nhà vui tính và dễ.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,25,57,N'Tìm nam ở ghép quận 5, ưu tiên sinh viên Đại Học Y Dược',N'243/4 Đường Hồng Bàng, Phường 11, Quận 5, Hồ Chí Minh','18m2',1100000,'0981171355',5,2,4,'2019-09-22',N'Nam',N'Phòng mình hiện tại có 2 người cần thêm một bạn nam ở ghép, khu vực an ninh có camera giám sát. Giờ giấc tự do không chung chủ nhà. Toilet chung dưới tầng trệt (phòng mình ở ngay tần lửng nên các bạn khỏi lo nhé). Khu vực bếp rộng rãi tha hồ nấu nướng. Đậu xe trong nhà (miễn phí). Thuận tiện di chuyển các quận 1 (10 phút), quận 10, quận 11 (5 phút).... Cách trường đại học y dược 50m. Chỉ mất 5-10 phút di chuyển đến các trường Đại Học Sài Gòn, Đại học khoa học tự nhiên, Đại học Sư phạm (lưu ý: khu vực này không kẹt xe). Phòng có máy lạnh sẵn, có tủ quần áo, có thể dọn vào ở ngay. ưu tiên các bạn ít đồ đạc.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,26,72,N'Cho thuê nhiều phòng trọ 1051/4 Hậu Giang, Quận 6',N'Đường Hậu Giang, Phường 11, Quận 6, Hồ Chí Minh','20m2',2000000,'0845458845',6,1,5,'2019-02-09',N'Tất cả',N'Toà nhà trọ khang trang D/c: 1051/4 Hau Giang, P.11, Q.6. khuôn viên 14x40 , 3 lầu, 50 phòng, gần Bùng Binh Mũi tầu Hậu Giang- Kinh Dương Vương- An Duong Vuong. Gần trường CD GTVT 3; CD Kinh te ky thuật TPHCM Nguyễn Van Luong, chi nhanh Trường DH Mo, TP.HCM, An Duong Vuong. Mỗi phòng sing hoạt riêng biệt. Trang bị tiêu chuẩn: (internet CÁP QUANG tốc độ cao, truyền hình cáp SCTV Miễn phi). điện nước theo đồng hồ riêng. Sân phơi quần áo rộng.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,27,74,N'Phòng trọ Q.6, tìm 1-2 NỮ ở ghép - Sát Galaxy Kinh Dương Vuong',N'Đường số 10, Phường 13, Quận 6, Hồ Chí Minh','35m2',1000000,'0933669133',6,2,1,'2019-01-08',N'Nữ',N'Nữ - Tìm 1-2 người ở ghép - Q.6 - Bình Tân (ngay đường số 10 , sát Galaxy Kinh Dương Vương; Khu Ăn uống ẩm thực đường số 6 ; vòng xoay Phú Lâm, .....) . Giá phòng 3 triệu / 1 tháng (mỗi người 1 tr) ; CÓ BAN CÔNG rộng thoáng mát , hướng gió . Dt sàn : 35 m2 (rộng) ; có gác lửng ; trần nhà cao . Nói chung đây là phòng cho gia đình ở (hoặc làm văn phòng) , nên ngoài yếu tố chỉ để ở , thì PHONG THỦY , hướng nắng, hướng gió đều rất Ok , mát mẻ, ban ngày có ánh nắng tự nhiên, ..... (nên trực tiếp tới xem phòng, sẽ thích !! ')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,28,71,N'Mặt bằng kinh doanh mặt tiền đường An Dương Vương, Quận 6',N'338 Đường An Dương Vương, Phường 10, Quận 6, Hồ Chí Minh','160m2',50000000,'0901363895',6,4,2,'2019-06-08',N'Tất cả',N'Diện tích 8 x 20 + sân trước rộng rãi như hình, có thể tận dụng thêm hầm. Vị trí: mặt tiền đường An Dương Vương, Quận 6. Phù hợp kinh doanh mọi ngành nghề ( cafe, spa, bida, gym...)')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,29,72,N'Cho thuê phòng trọ Quận 6 sạch sẽ, thoáng mát, an ninh',N'31-33 Phố số 24, Phường 11, Quận 6, Hồ Chí Minh','24m2',3000000,'0971460387',6,1,3,'2019-09-07',N'Tất cả',N'Phòng sạch sẽ,thoáng mát diện tích 24m2, có wifi sử dụng miễn phí 100Mbps bao mạnh,tollet riêng .Đối diện Metreo, sát bên công viên Phú Lâm. Đặc biệt rất anh ninh và môi trường thể thao gần phòng gym center Muscle Fuel.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,30,74,N'Tìm Nam ở ghép phòng trọ gần Galaxy Quận 6',N'60 Đường Lê Tuấn Mậu, Phường 13, Quận 6, Hồ Chí Minh','15m2',800000,'0981171355',6,2,4,'2019-09-22',N'Nam',N'Cần tìm 1 nam ở ghép phòng trọ gần Galaxy Quận 6. Tiền phòng: 800k/người. Điện nước theo giá chung. Máy lạnh, nước nóng, Wifi đầy đủ. Giờ giấc tự do. Yêu cầu: sạch sẽ, gọn gàng, không hút thuốc. ưu tiên sinh viên')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,31,82,N'Cho Thuê Phòng Trọ Quận 7, Giá Rẻ, Tiện Nghi',N'851/19/2 Đường Huỳnh Tấn Phát, Phường Phú Thuận, Quận 7, Hồ Chí Minh','30m2',3300000,'0917624231',7,1,5,'2019-05-05',N'Tất cả',N'Tất cả các phòng đều có cửa sổ, hành lang thoáng mát, vệ sinh khép kín. Cách Phú Mỹ Hưng: 300m; Cách Hồ bán nguyệt, cầu ánh sao: 1km; cách Bệnh viện Q7: 600m. Mất 4 phút tới siêu thị BigC hay Co.opmart tại Crescent Mall Phú Mỹ Hưng. Gần trường ĐH Tôn Đức Thắng, ĐH Rmit, ĐH Nguyễn Tất Thành, ĐH Luật,… Đặc biệt: Cách trạm xe Bus 100m đi thẳng lên trung tâm Q1 và trường ĐH cao Thắng.- Giờ giấc tự do. - Giữ xe miễn phí. - Có camera theo dõi nên rất an toàn.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,32,80,N'Tìm nữ công sở, sinh viên ở ghép quận 7',N'502/11 Đường Huỳnh Tấn Phát, Phường Bình Thuận, Quận 7, Hồ Chí Minh','19m2',1500000,'0904156016',7,2,1,'2019-03-04',N'Nữ',N'Phòng có gác , rộng,ở lầu 5 chung cư mini 502/11 Huỳnh Tấn Phát. Bảo vệ 24.24 an ninh cực tốt : giờ giấc tự do thoải mái. Gia phong 3tr/ 2 nguoi. cần 1 bạn làm văn phòng ở chung. Phòng ở 2 người vô cùng thoải mái. Tòa nhà có khoảng 10 cái máy giặt và máy sấy phục vụ khách trọ luôn nhé. chủ nhà vô cùng dễ thương với khách và cuối tuần nào cũng có nấu ăn cho cả tòa nhà luôn mình cũng là dân văn phòng ạ.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,33,83,N'Cho thuê nhà mặt tiền đường Huỳnh Tấn Phát, P.Tân Phú, Q.7',N'1208 Đường Huỳnh Tấn Phát, Phường Tân Phú, Quận 7, Hồ Chí Minh','120m2',15000000,'0983343839',7,4,2,'2019-02-03',N'Tất cả',N'Vỉa hè rộng, thoáng. Đường Huỳnh Tấn Phát đã nâng cấp xong. Nhà kinh doanh được ngay. Rất thích hợp mở sapa, massage, trường mẫu giáo, dịch vụ ... đại lý nội thất, siêu thị tiện lợi. Showroom các loại... Khu mua bán sầm uất Kh,u vực đông dân cư, gần trường học, chung cư mới xây, chợ,...')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,34,83,N'PHÒNG GIÁ RẺ 2TR8 CHO THUÊ GẦN CHỢ TÂN MỸ, QUẬN 7',N'119 Đường Nguyễn Thị Thập, Phường Tân Phú, Quận 7, Hồ Chí Minh','18m2',2800000,'0346562074',7,1,3,'2019-08-02',N'Tất cả',N'Đặc biệt : Giảm 500k ưu đãi cho bạn khi ký cọc trong tháng này thôi nhé Tiết kiệm chi phí hàng tháng vào nơi ở của mình. Diện tích: 18 - 25m2.Nhà mới xây, sạch sẽCó sân thượng phơi đồNhà vệ sinh riêng, kệ bếp riêng, cửa sổ thóag mátGiờ giấc tự do, không chung chủ. Thang máy từng tầng lầu. Bảo vệ 24/24.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,35,85,N'Cần nam ở ghép trong căn hộ Era Town Đức Khải',N'Đường Nguyễn Lương Bằng, Phường Phú Mỹ, Quận 7, Hồ Chí Minh','30m2',1500000,'0981171355',7,2,4,'2019-09-22',N'Nam',N' Diện tích 30m2, phòng có WC riêng, máy lạnh. Có sẵn quạt, nệm, tủ đựng đồ nên chỉ cần xách va ly vào là ở. Nhà đã có máy giặt, tủ lạnh xài free. Liền kề Phú Mỹ Hưng thông qua đường Nguyễn Lương Bằng. Giao thông đi lại thuận tiện, cách TT thành phố 15 phút. Tiện ích xung quanh siêu thị, hồ bơi, công viên, cửa hàng tiện lợi, phòng gym, sân thể dục... An ninh 24/24, có thẻ từ thang máy')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,36,90,N'Cho Thuê Phòng Trọ Quận 8, Giá Rẻ, Tiện Nghi',N'19-21 Đường 909 Phố Tạ Quang Bửu, Phường 5, Quận 8, Hồ Chí Minh','20m2',3600000,'0907373371',8,1,5,'2019-09-15',N'Tất cả',N'Mình chính chủ cho thuê phòng trọ cao cấp mới xây đầy đủ tiện nghi tại Quận 8. Vị trí thuận tiện ra Q10, Q1, Q5, Khu an ninh , dân trí , khu coffee, văn phòng công ty , gần chợ , siêu thị lớn. Phòng trọ cao cấp mới xây sạch đẹp , để xe trong nhà, khóa vân tay, camera an ninh 24/24, trong phòng có tủ quần áo, giường, gối nệm, máy lạnh, wc riêng từng phòng, máy giặt, giờ giấc tự do không chung chủ ...')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,37,101,N'Cần 1 nữ ở ghép chung cư Q8 gần Q6/BX Miền Tây',N'Số 176 Đường số 44, Phường 16, Quận 8, Hồ Chí Minh','50m2',1500000,'0979266982',8,2,1,'2019-07-16',N'Nữ',N'Chung cư mới, rộng 50m2: 1PK, 1PN, 1 bếp, 1 ban công, 1 WC. Ngay An Duong Vuong giao Võ Văn Kiệt, Q8, giáp Bình Chánh. Cách quận 1 chỉ 20-30ph chạy xe nhờ đường rộng thông thoáng. Thang máy mitsubishi 6 chiếc 1 block, chạy êm và k bị kẹt thang. Cửa gỗ tự nhiên, sơn và gạch lát cao cấp. Nội thất đầy đủ, đồ mới: tủ lạnh Hitachi, máy lạnh mới Daikin, máy giặt cửa trước Electrolux, máy nước nóng Electrolux, bàn ghế ăn gỗ tự nhiên, giàn phơi đồ thông minh, hệ thống kệ sách, kệ dép gỗ tự nhiên, bếp & dụng cụ nấu ăn có đủ.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,38,95,N'Cho thuê mặt bằng 3x7 mặt tiền số 7 Dã Tượng, P.10, Q.8',N'7 Đường Dã Tượng, Phường 10, Quận 8, Hồ Chí Minh','27m2',30000000,'0938912286',8,4,2,'2019-05-18',N'Tất cả',N'DT 3 x 7m . Có 1 phòng ngủ lại. Cách cầu Nguyễn Tri Phương 400m, khu dân cư đông đúc, gần chợ, trường học, tiện mở văn phòng, công ty, tiệm tóc, nail,')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,39,86,N'Phòng trọ Q.8 tiện nghi thoáng mát',N'231/97B Đường Dương Bá Trạc, Phường 1, Quận 8, Hồ Chí Minh','23m2',3500000,'0788663140',8,1,3,'2019-03-30',N'Tất cả',N'Sạch sẽ thoáng mát. Mở cửa 24h. Máy lạnh tiết kiệm điện 1,5 ngựa hiệu Toshiba mới. Toilet trong phòng, nước nóng năng lượng mặt trời. Có ban công thoáng mát. Bếp riêng từng phòng, có kệ bếp nhôm trên dưới. Có sàn nước mỗi lầu. Thang máy, tầng hầm để xe. Có hệ thống camera và phòng cháy chữa cháy.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,40,90,N'Cần tìm 1 nam ở ghép đường phạm thể hiển',N'Đường Phạm Thế Hiển, Phường 5, Quận 8, Hồ Chí Minh','20m2',1200000,'0981171355',8,2,4,'2019-09-22',N'Nam',N'Cần thêm 1 nam (tổng là 3 người ở). Ưu tiên người miền nam. Không hút thuốc, trung thực hiền. Ưu tiên cho người ít đồ đạc. Sạch sẽ ngăn nắp gọn gàng. Giữ vệ sinh chung. Chỉ cần mang balo đến là ở ngay')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,41,109,N'Cho thuê phòng trọ hẻm 76 Tây Hòa, Quận 9',N'76 Đường Tây Hòa, Phường Phước Long A, Quận 9, Hồ Chí Minh','30m2',3500000,'0948191112',9,1,5,'2019-01-26',N'Tất cả',N'Vị trí ở thuận lợi di chuyển Q9 , THỦ ĐỨC , LÀNG ĐẠI HỌC , QUẬN BÌNH THẠNH trong bán kính 10 – 15 phút đi xe máy. Phòng rộng rãi thoáng mát, 4 người ở được thoải mái. Không gian thoáng mát . Phòng đều có Quạt Treo Tường ( sẽ lắp theo máy lạnh nếu yêu cầu ), tủ lạnh , tủ đồ , kệp bếp , kệ nấu ăn… Hệ thống wifi tốc độ cao, camera quan sát')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,42,114,N'Tìm 1 hoặc 2 nữ ở ghép căn hộ SKY9',N'Số 1 Đường Liên Phường, Phường Phú Hữu, Quận 9, Hồ Chí Minh','50m2',2500000,'0901265307',9,2,1,'2019-03-29',N'Nữ',N'Phòng full nội thất ,dùng chung nội thất phòng khách và bếp, tiện ích xung quanh tiện nghi sạch sẽ. Có chìa khoá phòng riêng. Hồ bơi, phòng gym, yoga, sân vườn BBQ miễn phí... Điện nước tính theo đầu người. Yêu cầu nữ công việc ổn định , đi làm văn phòng , ít đồ đạc , sạch sẽ, thân thiện')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,43,105,N'Chính chủ sang nhượng mặt bằng 167m2 tại mặt tiền tầng trệt TTTM Vincom Lê Văn Việt, Q.9',N'Đường Lê Văn Việt, Phường Hiệp Phú, Quận 9, Hồ Chí Minh','167m2',50000000,'0908671478',9,4,2,'2019-04-20',N'Tất cả',N'Mặt bằng hiện đang kinh doanh bánh cafe. Trang trí nội thất rất đẹp, vị trí đắc địa, khu buôn bán sầm uất bậc nhất ngay trung tâm hành chính Q9, ngay trục đường chính rất thuận tiện giao thong. Gần chợ, trường học, siêu thị, bệnh viện, công viên, giao thông công cộng, công ty, ngân hàng, ATM, quán xá....')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,44,109,N'Cho thuê phòng trọ mới xây lại mặt tiền 86C Tây Hòa, Q.9',N'86 Đường Tây Hòa, Phường Phước Long A, Quận 9, Hồ Chí Minh','16m2',2000000,'0907373226',9,1,3,'2019-08-10',N'Tất cả',N'Tình trạng phòng: thoáng mát, sạch đẹp. Mô tả chung:  Phòng có gác lửng rộng, la phông thoáng mát , Điện, nước tính đúng giá nhà nước , Có lối đi riêng, chỗ để xe riêng , Có chỗ nấu ăn , Toilet riêng, có vòi sen , Gần chợ, trường học, siêu thị, ngân hàng , Có wifi, cáp TV , Khu vực an ninh, thuận tiện cho sinh viên, gia đình')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,45,114,N'NAM Ở GHÉP 1 TRIỆU, NỘI THẤT ĐẦY ĐỦ, CÓ HỒ BƠI',N'Chung cư Sky9 Vòng xoay Liên Phường, Phường Phú Hữu, Quận 9, Hồ Chí Minh','75m2',1000000,'0981171355',9,2,4,'2019-09-22',N'Nam',N'Tìm Nam ở Ghép Chung cư Sky9 Giá 1 triệu/tháng, 4 người/phòng và 6 người/phòng master. An toàn - Yên tĩnh. Đầy đủ nội thất. Vị trí:Chung cư Sky9 Vòng xoay Liên Phường, P. Phú Hữu, Q.9. Nội thất mới 100%. Khóa điện tử, Camera, Tủ Lạnh, Máy giặt, Bàn ăn, Bếp Hồng ngoại, Nồi Sunhouse, ấm siêu tốc, Giường, nệm đầy đủ... Bảo vệ An Ninh 24/7, Free Wifi 65Mb/s, đầy đủ tiện ích sử dụng thỏa mái Gym, Hồ Bơi, Phòng thể thao, Không gian xanh mát biệt thự...')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,46,129,N'Cho thuê phòng cao cấp, đầy đủ tiện nghi tại 102/39 Tô Hiến Thành, P.15, Quận 10',N'102/39 Đường Tô Hiến Thành, Phường 15, Quận 10, Hồ Chí Minh','20m2',5000000,'0913662386',10,1,5,'2019-08-12',N'Tất cả',N'Cho thuê phòng cao cấp đầy đủ tiện nghi nhà mới. Máy lạnh inverter mới 100%, có nước nóng năng lượng mặt trời, tivi... Diện tích: 20 m2')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,47,127,N'phòng quận 10 đầy đủ tiện nghi, bếp nấu ăn bv 24/24 giá 5 triệu',N'243/9/27 Đường Tô Hiến Thành, Phường 13, Quận 10, Hồ Chí Minh','20m2',5000000,'0917383381',10,1,1,'2019-07-19',N'Tất cả',N'Toà nhà có 14 phòng cho thuê đay đủ tiện nghi,khu vực trung tâm thuân tiên đi lại,gần siêu thi big c ,đại học bách khoa,dại học hufflit,chợ hoà hưng..... nhà mới, có thang máy, có bảo vệ, free máy guau. Nhà có hầm để xe,có bve 24/24 khách trong toà nhà dân văn phòng va sinh viên...')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,48,119,N'Tìm 02 nữ ở ghép phòng 30m2, giờ tự do, wifi Free 1,2tr/tháng',N'339/17 Đường Tô Hiến Thành, Phường 5, Quận 10, Hồ Chí Minh','35m2',1200000,'0775068369',10,2,2,'2019-05-16',N'Nữ',N'Hiện tại mình đang ở phòng 3,8tr/th với 2 người nữa cùng quê, do nay 2 bạn này chuyển về Thủ Đức học nên mình cần tìm 2 bạn nữ ờ ghép ( ưu tiên sinh viên HUFLIT do mình đang học năm 02 trường này) Phòng nằm trong tầng lửng, cách trường HUFLIT 300m, mất phút đi bộ là đến trường, nước 100k/ người, điện 3,5k/kw, wifi Free, giờ tự do, không chung chủ.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,49,125,N'Phòng Full Tiện Nghi - ngay CMT.8 gần chợ Hoà Hưng, Quận 10',N'472/18 Đường Cách Mạng Tháng Tám, Phường 11, Quận 10, Hồ Chí Minh','17m2',4200000,'0906656687',10,1,3,'2019-04-14',N'Tất cả',N'Bạn có muốn sở hữu 1 căn phòng cao cấp chỉ 4tr2/ tháng ở TRUNG TÂM QUẬN 3 - QUẬN 10 với các đặc điểm: Vị trí ngay Cách Mạng Tháng 8 Quận 3 - ngay cv Lê Thị Riêng - kế bên Trần Văn Đang sát bên chợ Hoà Hưng Phòng Cửa Sổ giá 4tr3. Phòng rộng 15- 20 m2 - An Ninh - Yên Tĩnh. Thiết kế mỗi tầng 2 phòng riêng biệt với không gian làm việc, sinh hoạt riêng tư, thoải mái')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,50,126,N'Cần tìm bạn nam hiền lành ở ghép, phòng full nội thất có gác lửng',N'28/19 Đường Trần Thiện Chánh, Phường 12, Quận 10, Hồ Chí Minh','30m2',2000000,'0981171355',10,2,4,'2019-09-22',N'Nam',N'phòng mới xây cực kỳ sạch sẽ đẹp cần bạn nan ở ghép. có đủ nội thất, bếp, tủ áo, tủ lạnh, máy lạnh, sofa, nệm, tolet riêng. khu vực nhiều siêu thị, nhiều trường đại học, trung tâm vui chơi giải trí. Chỉ trả 2 tr. Bao tất cả các chi phí khác. Dọn vào ở ngay')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,51,140,N'Phòng trọ sạch đẹp, tiện nghi cho thuê tại 363B Lê Đại Hành, Phường 11, Quận 11',N'363B Đường Lê Đại Hành, Phường 11, Quận 11, Hồ Chí Minh','20m2',2500000,'0962438346',11,1,5,'2019-12-08',N'Tất cả',N'Chính chủ cần cho thuê phòng trọ tiện nghi, có ban công, máy lạnh, wc riêng biệt, rộng thoáng mát.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,52,137,N'Tìm 1 bạn nữ ở ghép',N'236/18 Đường Thái Phiên, Phường 8, Quận 11, Hồ Chí Minh','20m2',1300000,'0838139639',11,2,1,'2019-10-07',N'Nữ',N'mình cần tìm 1 bạn NỮ ở ghép tại Quận 11 tphcm , tính tình hiền lành, gọn gàng, vui vẻ,....phòng trọ của mình thì có nhà vệ sinh trong nhà , có gác lửng , có đầy đủ đồ như tủ lạnh, bếp gas, xoang nồi, chén, bát ,....có nguyên 1 kệ sách bạn thỏa thích mà đọc nhé , bạn đến ở chỉ cần mang theo quần áo và tủ đồ là ok,....nhà trọ nằm ở mặt tiền sáng sủa trên lầu 2 , ở đây an ninh là số 1 , có người trông xe, giờ đóng cửa là 1h sáng nếu bạn về khuya quá thì có thể liên hệ qua điện thoại của chủ nhà, gần phòng trọ cóa siêu thị Bách hóa xanh, bệnh viện, chợ, khu tập gym và yoga, hàng quán đồ ăn vặt tùm lum ,....')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,53,144,N'Siêu rẻ KTX cao cấp giá 700k/Người/Tháng,Q11',N'299/23F Phố Lý Thường Kiệt, Phường 15, Quận 11, Hồ Chí Minh','25m2',700000,'0963181015',11,1,2,'2019-10-25',N'Tất cả',N'Thuận tiện: Khu vực Quận 11- Quận 10 -Quận Tân Bình- Quận Tân Phú -Quận 3. Gần Đại Học Bách Khoa-Đại học công nghê thông tin-Cao đẳng lý tự trọng. Gần các trạm xe bus và Trung Tâm ăn uống-thể dục thể thao nhà thi đấu Phú Thọ….. Tiện Ích Sử Dụng Dịch Vụ: Nhà mới xây ,Phòng rộng,Có máy lạnh,Wifi đường truyền tốc độ cao ,Khu căn tin,Giặc sấy,Nhà vệ sinh riêng biệt,sân phơi đồ rộng rãi,đội ngũ nhân viên chăm sóc khách hàng nhiệt tình và chu đáo.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,54,136,N'Phòng trọ mới xây 170 - 172 Lê Đại Hành, P.7, Q.11',N'170 172 Đường Lê Đại Hành, Phường 7, Quận 11, Hồ Chí Minh','18m2',2800000,'0838139639',11,1,3,'2019-11-27',N'Tất cả',N'Nhà trọ mới xây, sạch mát, có sân phơi, có gác, có nhà vệ sinh riêng trong phòng. Có wifi miễn phí và TH cáp, được nấu ăn, có chỗ để xe  Không giới hạn số người ở. Vị trí đắc địa qua lại giữa Quận 3, Quận 10, Quận 1, Quận 6, Tân Phú thuận tiện phù hợp với các bạn có đam mê ăn uống. Khu vực an ninh, yên tĩnh, có camera giám sát an ninh. Nội thất cao cấp, kệ để bếp, vòi tắm hoa sen, cửa kính nhôm, cửa sổ thoáng mát. Gần trường học, bệnh viện, trung tâm mua sắm, công viên')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,55,144,N'TÌM BẠN NAM Ở GHÉP GẦN TRƯỜNG ĐH BÁCH KHOA',N'11 hẻm 281 Phố Lý Thường Kiệt, Phường 15, Quận 11, Hồ Chí Minh','30m2',1300000,'0981171355',11,2,4,'2019-09-22',N'Nam',N'Phòng 4 triệu đã bao gồm trọn gói điện+nước+wifi+... nên xài thoải mái máy lạnh, tủ lạnh, bếp điện 24/24. Nằm gần ĐH Bách Khoa đi bộ khoảng 5p là tới, phòng mình trên trên tầng 2, tầng dưới là công ty thế giới nhớt nên an ninh tốt, camera an ninh tầng dưới rất nhiều. Có 1 bạn sinh viên mới ra trường bạn đó dọn ra nên mình tìm 1 bạn nam vào ở cùng để share tiền phòng. Yêu cầu sạch sẽ, gọn gàng, sinh viên càng tốt vì mình cũng là sinh viên Bách Khoa năm 3')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,56,147,N'Phòng trọ cho thuê, phòng rộng thoáng',N'Đường Hà Huy Giáp, Phường Thạnh Lộc, Quận 12, Hồ Chí Minh','30m2',2500000,'0909706113',12,1,5,'2019-07-25',N'Tất cả',N'Phòng trọ cao cấp dành cho nữ sinh viên, nhân viên văn phòng và gia đình. Miễn phí Wifi, máy giặt, rác. Chỗ để xe rộng rãi, ra vào cửa vân tay. An Toàn - Sạch Sẽ - Yên Tĩnh - Văn Minh - Tiện Ích > Phù hợp nghỉ ngơi, làm việc, học hành. Bếp và phòng vệ sinh riêng từng phòng')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,57,156,N'Tìm nữ ở ghép nhà nguyên căn giá rẻ',N'Phường Tân Thới Nhất, Quận 12, Hồ Chí Minh','48m2',1100000,'0919502402',12,2,1,'2019-08-06',N'Nữ',N'Nhà nguyên căn 48 mét vuông, 2 phòng ngủ, 2WC, bếp chung sạch sẽ thoáng mát. Nhà có sẵn tủ lạnh, máy giặt, bếp, dụng cụ nấu ăn. Có khu vực để làm bếp riêng nếu cần. Hiện tại nhà có vợ chồng mình ở 1 phòng, phòng phía trên cần tìm hai bạn nữ ở ghép.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,58,150,N'Cho thuê phòng trọ cao cấp, phường 17, quận 12',N'224/17 Đường Phan Văn Hân, Phường Tân Chánh Hiệp, Quận 12, Hồ Chí Minh','25m2',5000000,'0933290533',12,1,3,'2019-09-01',N'Tất cả',N'diện tích 25 đến 30 m2 ,đầy đủ nội thất gồm(máy lạnh,tủ lạnh,tivi,giường tủ,chăn,ga gối ,nệm,tủ quần áo,quạt trần,máy giặt,internet,bếp) phòng thoáng mát có ban công cửa sổ,bảo vệ,nhà để xe rộng rãi,có người dọn dẹp hàng tuần, cửa vân tay. khu vực nằm ngay trung tâm quận bình thạnh giao thông thuận lợi sát quận 1,gần nhiều trường đại học,hutech,kinh tế ,hồng bàng,thuy lợi')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,59,151,N'Share phòng chung cư cho nữ, cc Phạm Viết Chánh, 12',N'Đường Phạm Viết Chánh, Phường Phường An Phú Đông, Quận 12, Hồ Chí Minh','72m2',2250000,'0707987644',12,1,5,'2019-10-11',N'Tất cả',N'Hiện tại nhà cc lầu 10, thang máy, nhà có 2 phòng, trong đó có 1 phòng cần tìm thêm 1 bạn nữ (tổng cộng chỉ ở 2 người/ phòng), phòng còn lại ở 1 người. Phòng có máy lạnh, tủ quần áo, gương, giường nệm.  Nhà đầy đủ nội thất, ban công phơi đồ, tủ lạnh, máy giặt, bếp nấu ăn đầy đủ, phòng khách cũng có máy lạnh, nhà sàn gỗ, nhà vệ sinh rộng và sạch sẽ tuyệt đối, ko thiếu thứ gì. Siêu thị, chợ , quận 1 sát bên đi đâu cũng tiện  view rất chill phù hợp với bạn nào cần 1 nơi thoải mái mỗi khi đi làm về cần thư giãn,')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,60,154,N'TÌM BẠN NAM Ở GHÉP CC 8X-PLUS, QUẬN 12, TP.HCM',N'136a Đường Trường Chinh, Phường Tân Hưng Thuận, Quận 12, Hồ Chí Minh','63m2',2000000,'0981171355',12,2,4,'2019-09-22',N'Nam',N'Phòng đã có tủ lạnh, bếp, ban công, máy giặt, giờ giấc tự do ... hợp đồng tiền cọc mình đã làm hết rồi chỉ việc qua ở và trả tiền hằng tháng thôi nha.Phòng 2.000.000/tháng bao gồm cả điện nước luôn. Giới thiệu qua hiện mình và 1 bạn đang ở, phòng 63m2, đều là nvvp nên mình ưu tiên nvvp, hiền lành là được')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,61,8,N'Cho thuê nhà nguyên căn đẹp thoáng mát',N'178/2 Đường Cô Giang, Phường Cô Giang, Quận 1, Hồ Chí Minh','80m²',9500000,'0789241804',1,3,2,'2019-12-23',N'Tất cả',N'Nhà 1 trệt 1 lầu 2pn 2 wc gần trung tâm phố đi bộ 5p,gần chợ Bv,có sân để xe thoảng mat,gần trường học các cấp')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,62,12,N'Cho thuê nhà 3 lầu 101m2 tại Khu Đô Thị LakeView City An Phú, Q.2',N'Đường B, Phường An Phú, Quận 2, Hồ Chí Minh','101m2',4000000,'0961087030',2,3,3,'2019-10-26',N'Tất cả',N'HỖ TRỢ NGAY 200 TRIỆU tiền làm nội thất cơ bản, với điều kiện số tiền làm nội thất phải nhiều hơn 200 tr và cần xem qua báo giá thi công cơ bản và mặt bằng bố trí đã được đồng thuận thi công. Số tiền phát sinh thêm bên thuê tự chịu.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,63,31,N'Cho thuê mặt bằng ',N'648/99 Đường Cách Mạng Tháng Tám, Phường 11, Quận 3, Hồ Chí Minh','170m2',1700000,'0983057406',3,3,4,'2019-09-18',N'Tất cả',N'Nhà trong hẻm lớn, ngõ đối diện với CV Lê Thị Riêng. Nhà 02 lầu 01 trệt gồm: 03 phòng ngủ, 03 toilet, 01 phòng khách, 01 phòng bếp và phòng ăn, 01 nhà để xe. Khu an ninh, yên tĩnh phù hợp để ở hoặc mở văn phòng kinh doanh online, văn phòng đại diện. Cho thuê nguyên căn, có thể thuê lâu dài. Nhà mới, đẹp và sạch sẽ. Nội thất gần như đầy đủ.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,64,36,N'Cho thuê nhà nguyên căn 2 phòng ngủ, giá rẻ Quận 4',N'Đường Bến Vân Đồn, Phường 2, Quận 4, Hồ Chí Minh','120m2',8000000,'0931303891',4,3,5,'2019-08-15',N'Tất cả',N'Nhà vừa được nâng cấp, lót lại gạch bông mới, tường mới sơn. Gồm: 1 Phòng khách. 2 Phòng ngủ. 1 Phòng Bếp. 1 Nhà Vệ Sinh. Có sân vườn lớn để thư giãn, hóng mát, phơi đồ, để xe...vv. Có chỗ để xe máy. Nhà trệt. Không có tầng. Khu dân cư an toàn, yên tĩnh, hẻm rất dễ vào, gần cầu Nguyễn Văn Cừ, gần công viên thoáng mát, rất dễ đi lại, ngay Trung Tâm Thành Phố. Gần trường học, bệnh viện và trụ sở công an Quận 4')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,65,47,N'Nhà cho thuê Quận 5 thoáng mát',N'835/38M Đường Trần Hưng Đạo, Phường 1, Quận 5, Hồ Chí Minh','33m2',1000000,'0788663140',5,3,1,'2019-07-12',N'Tất cả',N'Nhà cho thuê nguyên căn 1 trệt 1 lửng 1 lầu. Địa chỉ: 835/38M Đường Trần Hưng Đạo, Phường 1, Quận 5, Hồ Chí Minh. Gồm 4 phòng, 2 nhà vệ sinh. Hẻm rộng rãi, nhà đầy đủ tiện nghi.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,66,67,N'Cho thuê nhà nguyên căn Q.6- 4PN-11 triệu',N'Đường Hồng Bàng, Phường 6, Quận 6, Hồ Chí Minh','44m2',1100000,'0913963999',6,3,2,'2019-06-10',N'Tất cả',N'1PN lớn 20m2, 1PN 12m2, 2pn 9m2. 3wc , bếp, pk 20m2, có sân để xe (6 chiếc). Nội thất cơ bản gồm giường, nệm, gối, 3 tủ quần áo, 2 bàn làm việc, bếp, 2 máy tắm nóng, 1 máy giặt, thiết bị vs đầy đủ. Phù hợp ở gia đình hoặc làm kho chứa hàng vì sát Chợ Lớn')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (1,67,79,N'Cho thuê nhà nguyên căn hẻm 1041 Trần Xuân Soạn, Q.7',N'1041 Phố Trần Xuân Soạn, Phường Tân Hưng, Quận 7, Hồ Chí Minh','42m2',4000000,'0908753242',7,3,3,'2019-05-06',N'Tất cả',N'Cho thuê nhà nguyên căn hẻm 1041 trần xuân soạn, quận 7. Trệt lầu. Gần chợ, gần trường học. Cách hẻm nhựa khoảng 60m. Tổng diện tích sử dụng 42m2. Tiện cho các cặp vợ chồng trẻ có con nhỏ. Cách quận 8,1,5 khoảng 5phut. Hẻm co lắp camera an ninh.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (0,68,91,N'Cho thuê nhà nguyên căn 150m, có sân rộng, Quận 8',N'23/74/11 Đường Phạm Thế Hiển, Phường 6, Quận 8, Hồ Chí Minh','150m2',6000000,'0933420410',8,3,4,'2019-04-03',N'Tất cả',N'3 Phòng ngủ 1 Phòng khách. 1 Bếp. 2 Tolet. 1 sân rộng. Thích hợp ở, làm nhà kho. Nhà trống vào ở ngay. Giá rẻ nhất Q.8')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (0,69,112,N'Nhà nguyên căn 1 trệt 2 lầu Quận 9 - Gần khu công nghệ cao',N'143/9/5 Đường Võ Văn Hát, Phường Long Trường, Quận 9, Hồ Chí Minh','150m2',5500000,'0945518078',9,3,3,'2019-03-01',N'Tất cả',N'Nhà ở nguyên căn 1 trệt 2 lầu 150m2: 1 phòng khách, 3 phòng ngủ, 1 phòng bếp, 2 nhà vệ sinh và sân thượng thoáng mát. Gần khu công nghệ cao, chợ, Co.op Food, Vinmart, Thế giới di động,... Khu dân cư an ninh, an toàn, yên tĩnh. Điện nước giá nhà nước. Cửa sổ giếng trời sáng sủa, thoáng mát')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (0,70,127,N'Nhà nguyên căn cho thuê Cách Mạng Tháng 8, P13, Quận 10',N'493 Đường Cách Mạng Tháng Tám, Phường 13, Quận 10, Hồ Chí Minh','52m2',1500000,'0792081989',10,3,2,'2019-02-26',N'Tất cả',N'Cho thuê nhà nguyên căn Cách Mạng Tháng 8, Phường 13, Quận 10. Vị trí: Gần CLB Lan Anh, chợ Hòa Hưng, Hoàng Dư Khương, sầm uất, vị trí đẹp. Thích hợp kinh doanh mọi ngành nghề. Giá cho thuê: 13 triệu /tháng (thương lượng).')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (0,71,130,N'Nhà Cho Thuê Nguyên Căn Ở & VP-Q.11- 5PN-1Trệt 2Lầu',N'Địa chỉ 26/1 Tân Hóa Phường 1 Quận 11 TPHCM','100m2',1450000,'0766622997',11,3,1,'2019-01-09',N'Tất cả',N'1. Nhà 2 lầu đúc có giếng trời giữa nhà. Có 5 phòng, tổng diện tích sử dụng: khoảng 100m2. 1 nhà bếp: 25m2 Có máy lạnh. 3 toilet. Phòng thoáng mát. Có toilet riêng. Có máy lạnh. Có đồng hồ điện riêng, hệ thống nước tự động. Có chỗ để xe rộng như hình, bếp rộng rãi, trang trí đẹp, rất phù hợp vừa ở vừa làm văn phòng công ty.')
INSERT [dbo].[Tin](KiemDuyet,MaTin,MaPhuong,TieuDe,DiaChi,DienTich,Gia,SDTLienHe,MaQuan,MaLoai,MaTV,NgayDang,DoiTuong,MoTaChiTiet) VALUES (0,72,148,N'CHO THUÊ NHÀ NGUYÊN CĂN YÊN TĨNH, THOÁNG MÁT',N'48/162/8 Đường Lê Văn Khương, Phường Hiệp Thành, Quận 12, Hồ Chí Minhm2','48m2',2800000,'0933484821',12,3,5,'2019-06-21',N'Tất cả',N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 1 LẦU. ĐỊA CHỈ: HẺM 567/162/8 Đường Lê Văn Khương, Phường Hiệp Thành, Quận 12, Hồ Chí Minh')


SET IDENTITY_INSERT [dbo].Tin OFF 
-- Hình ảnh --------------------------------------------------------------

INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.1.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.2.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.3.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.4.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.5.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.6.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.7.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('1.8.jpg',1)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.1.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.2.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.3.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.4.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.5.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('2.6.jpg',2)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('3.1.jpg',3)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('3.2.jpg',3)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('3.3.jpg',3)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('3.4.jpg',3)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('3.5.jpg',3)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('4.1.jpg',4)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('4.2.jpg',4)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('5.1.jpg',5)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('5.2.jpg',5)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('5.3.jpg',5)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('5.4.jpg',5)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('5.5.jpg',5)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('6.1.jpg',6)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('6.2.jpg',6)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('6.3.jpg',6)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('6.4.jpg',6)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('6.5.jpg',6)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.1.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.2.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.3.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.4.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.5.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('7.6.jpg',7)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.1.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.2.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.3.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.4.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.5.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.6.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.7.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.8.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.9.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('8.10.jpg',8)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('9.1.jpg',9)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('9.2.jpg',9)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('9.3.jpg',9)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('9.4.jpg',9)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('9.5.jpg',9)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('10.1.jpg',10)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('10.2.PNG',10)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('10.3.PNG',10)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('10.4.PNG',10)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('11.1.jpg',11)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('11.2.jpg',11)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('11.3.jpg',11)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('11.4.jpg',11)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('11.5.jpg',11)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.1.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.2.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.3.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.4.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.5.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('12.6.jpg',12)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.1.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.2.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.3.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.4.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.5.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.6.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('13.7.jpg',13)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.1.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.2.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.3.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.4.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.5.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('14.6.jpg',14)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('15.1.jpg',15)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('15.2.jpg',15)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('15.3.jpg',15)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('16.1.jpg',16)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('16.2.jpg',16)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('16.3.jpg',16)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('16.4.jpg',16)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('16.5.jpg',16)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('17.1.jpg',17)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('17.2.jpg',17)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('17.3.jpg',17)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('17.4.jpg',17)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('17.5.jpg',17)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('18.1.jpg',18)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('18.2.jpg',18)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('18.3.jpg',18)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('19.1.jpg',19)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('19.2.jpg',19)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('19.3.jpg',19)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('19.4.jpg',19)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('19.5.jpg',19)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('20.1.jpg',20)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('20.2.jpg',20)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('20.3.jpg',20)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('21.1.jpg',21)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('21.2.jpg',21)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('21.3.jpg',21)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('21.4.jpg',21)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('21.5.jpg',21)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('22.1.jpg',22)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('22.2.jpg',22)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('22.3.jpg',22)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('22.4.jpg',22)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('22.5.jpg',22)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('23.1.jpg',23)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('23.2.jpg',23)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('24.1.jpg',24)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('24.2.jpg',24)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('24.3.jpg',24)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('25.1.jpg',25)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('25.2.jpg',25)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('25.3.jpg',25)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('25.4.jpg',25)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('26.1.jpg',26)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('26.2.jpg',26)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('27.1.jpg',27)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('27.2.jpg',27)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('27.3.jpg',27)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('27.4.jpg',27)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('28.1.jpg',28)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('28.2.jpg',28)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('28.3.jpg',28)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('28.4.jpg',28)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('28.5.jpg',28)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('29.1.jpg',29)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('29.2.jpg',29)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('29.3.jpg',29)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('29.4.jpg',29)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('29.5.jpg',29)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('30.1.jpg',30)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('30.2.jpg',30)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('30.3.jpg',30)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('30.4.jpg',30)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('30.5.jpg',30)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('31.1.jpg',31)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('31.2.jpg',31)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('31.3.jpg',31)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('31.4.PNG',31)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('31.5.jpg',31)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('32.1.jpg',32)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('32.2.jpg',32)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('32.3.jpg',32)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('32.4.jpg',32)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('33.1.jpg',33)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('33.2.jpg',33)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('33.3.jpg',33)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('33.4.jpg',33)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('34.1.jpg',34)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('35.1.jpg',35)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('35.2.jpg',35)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.1.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.2.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.3.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.4.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.5.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('36.6.jpg',36)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('37.1.jpg',37)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('37.2.jpg',37)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('37.3.jpg',37)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('37.4.jpg',37)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('37.5.jpg',37)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('38.1.jpg',38)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('38.2.jpg',38)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('38.3.jpg',38)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('38.4.jpg',38)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('38.5.jpg',38)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('39.1.jpg',39)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('39.2.jpg',39)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('39.3.jpg',39)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('39.4.jpg',39)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('39.5.jpg',39)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('40.1.jpg',40)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('40.2.jpg',40)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('40.3.jpg',40)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('41.1.jpg',41)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('41.2.jpg',41)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('41.3.jpg',41)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('42.1.jpg',42)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('42.2.jpg',42)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('43.1.jpg',43)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('43.2.jpg',43)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('43.3.jpg',43)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('43.4.jpg',43)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('43.5.jpg',43)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('44.1.jpg',44)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('44.2.jpg',44)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('44.3.jpg',44)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('45.1.jpg',45)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('45.2.jpg',45)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('45.3.jpg',45)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('46.1.jpg',46)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('46.2.jpg',46)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('46.3.jpg',46)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('46.4.jpg',46)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('47.1.jpg',47)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('48.1.jpg',48)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('48.2.jpg',48)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('48.3.jpg',48)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('48.4.jpg',48)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('49.1.jpg',49)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('49.2.jpg',49)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('50.1.jpg',50)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('50.2.jpg',50)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('50.3.jpg',50)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('50.4.jpg',50)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('51.1.jpg',51)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('51.2.jpg',51)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('51.3.jpg',51)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('51.4.jpg',51)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('52.1.jpg',52)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('52.2.jpg',52)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('52.3.jpg',52)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('52.4.jpg',52)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('52.5.jpg',52)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('53.1.jpg',53)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('53.2.jpg',53)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('53.3.jpg',53)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('53.4.jpg',53)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('53.5.jpg',53)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('54.1.jpg',54)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('54.2.jpg',54)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('54.3.jpg',54)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('54.4.jpg',54)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('55.1.jpg',55)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('55.2.jpg',55)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('55.3.jpg',55)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('55.4.jpg',55)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('55.5.jpg',55)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('56.1.jpg',56)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('56.2.jpg',56)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('56.3.jpg',56)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('56.4.jpg',56)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('56.5.jpg',56)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('57.1.jpg',57)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('57.2.jpg',57)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('57.3.jpg',57)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('58.1.jpg',58)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('58.2.jpg',58)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('58.3.jpg',58)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('58.4.jpg',58)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('58.5.jpg',58)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('59.1.jpg',59)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('59.2.jpg',59)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('59.3.jpg',59)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('60.1.jpg',60)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('60.2.jpg',60)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('60.3.jpg',60)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('60.4.jpg',60)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('60.5.jpg',60)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('61.1.jpg',61)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('61.2.jpg',61)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('61.3.jpg',61)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('61.4.jpg',61)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('62.1.jpg',62)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('62.2.jpg',62)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('62.3.jpg',62)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('63.1.jpg',63)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('64.1.jpg',64)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('64.2.jpg',64)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('64.3.jpg',64)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('64.4.jpg',64)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('65.1.jpg',65)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('66.1.jpg',66)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('66.2.jpg',66)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('66.3.jpg',66)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('66.4.jpg',66)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.1.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.2.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.3.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.4.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.5.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('67.6.jpg',67)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('68.1.jpg',68)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('68.2.jpg',68)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('68.3.jpg',68)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('68.4.jpg',68)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('68.5.jpg',68)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.1.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.2.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.3.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.4.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.5.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('69.6.jpg',69)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('70.1.jpg',70)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('70.2.jpg',70)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('70.3.jpg',70)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('70.4.jpg',70)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('70.5.jpg',70)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('71.1.jpg',71)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('71.2.jpg',71)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('72.1.jpg',72)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('72.2.jpg',72)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('72.3.jpg',72)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('72.4.jpg',72)
INSERT [dbo].HinhAnh (DuongDan,MaTin) VALUES ('72.5.jpg',72)

SET IDENTITY_INSERT [dbo].LuuTin ON
INSERT [dbo].LuuTin (MaTinLuu,MaTV,MaTin) VALUES (1,1,1)
INSERT [dbo].LuuTin (MaTinLuu,MaTV,MaTin) VALUES (2,1,3)
SET IDENTITY_INSERT [dbo].LuuTin OFF


