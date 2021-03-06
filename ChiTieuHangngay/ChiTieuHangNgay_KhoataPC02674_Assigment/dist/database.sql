USE [master]
GO
/****** Object:  Database [QuanLyChiTieu]    Script Date: 15/12/2021 7:24:35 PM ******/
CREATE DATABASE [QuanLyChiTieu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyChiTieu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyChiTieu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyChiTieu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyChiTieu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyChiTieu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyChiTieu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyChiTieu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyChiTieu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyChiTieu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyChiTieu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyChiTieu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyChiTieu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyChiTieu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyChiTieu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyChiTieu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyChiTieu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyChiTieu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyChiTieu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyChiTieu] SET QUERY_STORE = OFF
GO
USE [QuanLyChiTieu]
GO
/****** Object:  Table [dbo].[THU]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THU](
	[MaThu] [char](50) NOT NULL,
	[MSHangMucThu] [char](10) NOT NULL,
	[SoTien] [money] NOT NULL,
	[Ngay] [date] NOT NULL,
	[MSVI] [char](10) NOT NULL,
	[TenTaiKhoan] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_LOAITHUCHITIET] PRIMARY KEY CLUSTERED 
(
	[MaThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGTHU_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGTHU_Ngay] (@Date varchar(10), @MSND char(10))
returns table return

	
	select MSND,sum(SoTien)as TongThu
	from THU
	where Ngay like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGTHU_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGTHU_Thang] (@Date varchar(10), @MSND char(10))
returns table return

	
	select MSND,sum(SoTien)as TongThu
	from THU
	where month(Ngay) like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGTHU_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGTHU_Nam] (@Date varchar(10), @MSND char(10))
returns table return

	
	select MSND,sum(SoTien)as TongThu
	from THU
	where year(Ngay) like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  Table [dbo].[CHI]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHI](
	[MaChi] [char](50) NOT NULL,
	[MSHangMucChi] [char](10) NOT NULL,
	[SoTien] [money] NOT NULL,
	[Ngay] [date] NOT NULL,
	[MSVI] [char](10) NOT NULL,
	[TenTaiKhoan] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_LOAICHICHITIET] PRIMARY KEY CLUSTERED 
(
	[MaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGCHI_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGCHI_Nam] (@Date varchar(10), @MSND char(10))
returns table return

	select MSND,sum(SoTien)as TongChi
	from CHI
	where year(Ngay) like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGCHI_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGCHI_Thang] (@Date varchar(10), @MSND char(10))
returns table return

	select MSND,sum(SoTien)as TongChi
	from CHI
	where month(Ngay) like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TONGCHI_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TONGCHI_Ngay] (@Date varchar(10), @MSND char(10))
returns table return

	select MSND,sum(SoTien)as TongChi
	from CHI
	where Ngay like @Date and MSND like @MSND
	group by MSND
GO
/****** Object:  Table [dbo].[DANHMUCCHI]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCCHI](
	[MSHangMucChi] [char](10) NOT NULL,
	[TenHangMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMucChi] PRIMARY KEY CLUSTERED 
(
	[MSHangMucChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCTHU]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCTHU](
	[MSHangMucThu] [char](10) NOT NULL,
	[TenHangMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMucThu] PRIMARY KEY CLUSTERED 
(
	[MSHangMucThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIVI]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIVI](
	[MSLoaiVi] [char](10) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiVi] PRIMARY KEY CLUSTERED 
(
	[MSLoaiVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MSND] [nvarchar](50) NOT NULL,
	[TenHienThi] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[GioiTinh] [int] NOT NULL,
	[NamSinh] [date] NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[TenTaiKhoan] [nvarchar](25) NOT NULL,
	[VaiTro] [bit] NOT NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[MSND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TenTaiKhoan] [nvarchar](25) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TAIKHOAN_1] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VITIEN]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VITIEN](
	[MSVI] [char](10) NOT NULL,
	[TenVi] [nvarchar](50) NOT NULL,
	[MSLoaiVi] [char](10) NOT NULL,
	[SoDu] [money] NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[TenTaiKhoan] [nvarchar](25) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
 CONSTRAINT [PK_ViTien] PRIMARY KEY CLUSTERED 
(
	[MSVI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHI]  WITH CHECK ADD  CONSTRAINT [FK_CHI_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[CHI] CHECK CONSTRAINT [FK_CHI_TAIKHOAN]
GO
ALTER TABLE [dbo].[CHI]  WITH CHECK ADD  CONSTRAINT [FK_LOAICHICHITIET_DANHMUCCHI] FOREIGN KEY([MSHangMucChi])
REFERENCES [dbo].[DANHMUCCHI] ([MSHangMucChi])
GO
ALTER TABLE [dbo].[CHI] CHECK CONSTRAINT [FK_LOAICHICHITIET_DANHMUCCHI]
GO
ALTER TABLE [dbo].[CHI]  WITH CHECK ADD  CONSTRAINT [FK_LOAICHICHITIET_VITIEN] FOREIGN KEY([MSVI])
REFERENCES [dbo].[VITIEN] ([MSVI])
GO
ALTER TABLE [dbo].[CHI] CHECK CONSTRAINT [FK_LOAICHICHITIET_VITIEN]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_NGUOIDUNG_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [FK_NGUOIDUNG_TAIKHOAN]
GO
ALTER TABLE [dbo].[THU]  WITH CHECK ADD  CONSTRAINT [FK_LOAITHUCHITIET_DANHMUCTHU] FOREIGN KEY([MSHangMucThu])
REFERENCES [dbo].[DANHMUCTHU] ([MSHangMucThu])
GO
ALTER TABLE [dbo].[THU] CHECK CONSTRAINT [FK_LOAITHUCHITIET_DANHMUCTHU]
GO
ALTER TABLE [dbo].[THU]  WITH CHECK ADD  CONSTRAINT [FK_LOAITHUCHITIET_VITIEN] FOREIGN KEY([MSVI])
REFERENCES [dbo].[VITIEN] ([MSVI])
GO
ALTER TABLE [dbo].[THU] CHECK CONSTRAINT [FK_LOAITHUCHITIET_VITIEN]
GO
ALTER TABLE [dbo].[THU]  WITH CHECK ADD  CONSTRAINT [FK_THU_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[THU] CHECK CONSTRAINT [FK_THU_TAIKHOAN]
GO
ALTER TABLE [dbo].[VITIEN]  WITH CHECK ADD  CONSTRAINT [FK_VITIEN_LOAIVI] FOREIGN KEY([MSLoaiVi])
REFERENCES [dbo].[LOAIVI] ([MSLoaiVi])
GO
ALTER TABLE [dbo].[VITIEN] CHECK CONSTRAINT [FK_VITIEN_LOAIVI]
GO
ALTER TABLE [dbo].[VITIEN]  WITH CHECK ADD  CONSTRAINT [FK_VITIEN_TAIKHOAN] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[VITIEN] CHECK CONSTRAINT [FK_VITIEN_TAIKHOAN]
GO
/****** Object:  StoredProcedure [dbo].[sp_SoNam_Chi]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE  [dbo].[sp_SoNam_Chi] @TenTaiKhoan nvarchar(50)
as
begin
select YEAR(Ngay) as Nam from Chi where TenTaiKhoan like @TenTaiKhoan group by YEAR(Ngay)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SoNam_Thu]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_SoNam_Thu] @TenTaiKhoan nvarchar(50)
as
begin
select YEAR(Ngay) as Nam from THU where TenTaiKhoan like @TenTaiKhoan group by YEAR(Ngay)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TaiChinhHT]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TaiChinhHT] @tentaikhoan nvarchar(50)
as 
begin
select format(sum(SoDu), '#,##0') as TongTien
from VITIEN
where TenTaiKhoan like @tentaikhoan

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeChi_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeChi_Nam] @TenTaiKhoan nvarchar(50)
as 
begin
			select year(Ngay) as NAM, SUM(SoTien) as TONGTIEN
			from CHI
			where TenTaiKhoan like @TenTaiKhoan
			group by  year(Ngay), TenTaiKhoan
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeChi_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeChi_Ngay] @TenTaiKhoan nvarchar(50), @month INT, @YEAR INT
as 
begin
			select Ngay as NGAY, SUM(SoTien) as TongTien
			from CHI
			where TenTaiKhoan like @TenTaiKhoan and (MONTH(Ngay) = @month AND YEAR(Ngay) =@YEAR)
			group by  Ngay, TenTaiKhoan
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeChi_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeChi_Thang] @TenTaiKhoan nvarchar(50), @year INT
as 
begin
			select MONTH(Ngay) as THANG, SUM(SoTien) as TongTien
			from CHI
			where TenTaiKhoan like @TenTaiKhoan and (MONTH(Ngay) between 1 and 12) and YEAR(Ngay) =@year
			group by  Ngay, TenTaiKhoan

end 
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeThu_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeThu_Nam] @TenTaiKhoan nvarchar(50)
as 
begin
			select year(Ngay) as NAM, SUM(SoTien) as TONGTIEN
			from THU
			where TenTaiKhoan like @TenTaiKhoan
			group by  year(Ngay), TenTaiKhoan
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeThu_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeThu_Ngay] @TenTaiKhoan nvarchar(50), @month int, @YEAR INT
as 
begin			

			select Ngay as NGAY, SUM(SoTien) as TongTien
			from THU
			where TenTaiKhoan like @TenTaiKhoan and (MONTH(Ngay) = @month AND YEAR(Ngay) =@YEAR)
			group by  Ngay, TenTaiKhoan



end 
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeThu_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_ThongKeThu_Thang] @TenTaiKhoan nvarchar(50), @year int
as 
begin			

			select MONTH(Ngay) as THANG, SUM(SoTien) as TongTien
			from THU
			where TenTaiKhoan like @TenTaiKhoan and (MONTH(Ngay) between 1 and 12) and YEAR(Ngay) =@year
			group by  Ngay, TenTaiKhoan



end 
GO
/****** Object:  StoredProcedure [dbo].[sp_timTaiKhoan_Email]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_timTaiKhoan_Email] @email NVARCHAR(50), @taikhoan NVARCHAR(50)
as 
begin 
	SELECT NGUOIDUNG.MSND, NGUOIDUNG.TenHienThi, NGUOIDUNG.HoTen, NGUOIDUNG.SDT, NGUOIDUNG.Email, NGUOIDUNG.DiaChi, NGUOIDUNG.GioiTinh, NGUOIDUNG.NamSinh, NGUOIDUNG.Hinh, NGUOIDUNG.TenTaiKhoan, NGUOIDUNG.VaiTro, TAIKHOAN.MatKhau FROM NGUOIDUNG, TAIKHOAN 
WHERE NGUOIDUNG.TenTaiKhoan = TAIKHOAN.TenTaiKhoan and (NGUOIDUNG.TenTaiKhoan like @taikhoan and NGUOIDUNG.Email like email)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongChi_Nam] @TenTaiKhoan nvarchar(50)
as
begin


select  sum(SoTien) as TongTien
		from CHI
		where TenTaiKhoan like @TenTaiKhoan 
		



end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_NamNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		create PROCEDURE  [dbo].[sp_TongChi_NamNay] @TenTaiKhoan nvarchar(50)
as
begin


select  sum(SoTien) as TongTien
		from CHI
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = YEAR(getdate())
		



end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongChi_Ngay] @TenTaiKhoan nvarchar(50), @month int, @year int
as
begin

select   sum(SoTien) as TongTien
			from CHI
			where TenTaiKhoan like @TenTaiKhoan  and (MONTH(Ngay) = @month AND YEAR(Ngay) =@year)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_NgayHomNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongChi_NgayHomNay] @TenTaiKhoan nvarchar(50)
as
begin

select   sum(SoTien) as TongTien
			from CHI
			where TenTaiKhoan like  @TenTaiKhoan and (Month(Ngay) = Month(getdate()) AND YEAR(Ngay) = YEAR(getdate()))

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongChi_Thang] @TenTaiKhoan nvarchar(50), @year INT
as
begin


select  sum(SoTien) as TongTien
		from CHI
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = @year
		


end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongChi_ThangNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongChi_ThangNay] @TenTaiKhoan nvarchar(50)
as
begin


select  sum(SoTien) as TongTien
		from CHI
		where TenTaiKhoan like @TenTaiKhoan and Month(Ngay) = Month(getdate())

		


end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThu_Nam] @TenTaiKhoan nvarchar(50)
as
begin


select  sum(SoTien) as TongTien
		from THU
		where TenTaiKhoan like @TenTaiKhoan 
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_NamNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[sp_TongThu_NamNay] @TenTaiKhoan nvarchar(50)
as
begin
select sum(SoTien) as TongTien
		from THU
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = YEAR(getdate())
end	
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThu_Ngay] @TenTaiKhoan nvarchar(50), @month int, @year int
as
begin

select   SUM(SoTien) as TongTien
			from Thu
			where TenTaiKhoan like @TenTaiKhoan  and (MONTH(Ngay) = @month AND YEAR(Ngay) =@year)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_NgayHomNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThu_NgayHomNay] @TenTaiKhoan nvarchar(50)
as
begin

select   SUM(SoTien) as TongTien
			from Thu
			where TenTaiKhoan like @TenTaiKhoan  and (Month(Ngay) = Month(getdate()) AND YEAR(Ngay) = YEAR(getdate()))

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThu_Thang] @TenTaiKhoan nvarchar(50), @year INT
as
begin


select  sum(SoTien) as TongTien
		from THU
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = @year
		
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThu_ThangNay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThu_ThangNay] @TenTaiKhoan nvarchar(50)
as
begin


select  sum(SoTien) as TongTien
		from THU
		where TenTaiKhoan like @TenTaiKhoan and Month(Ngay) = Month(getdate())
		
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThuChi_Nam]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThuChi_Nam] @TenTaiKhoan nvarchar(50)
as
begin
declare @TienChi int
declare @TienThu int

select  @TienChi = sum(SoTien) 
		from CHI
		where TenTaiKhoan like @TenTaiKhoan 
		group by TenTaiKhoan

select  @TienThu = sum(SoTien) 
		from THU
		where TenTaiKhoan like @TenTaiKhoan 
		group by TenTaiKhoan

select iif (@TienThu is null,0,@TienThu) - iif (@TienChi is null,0,@TienChi) as 'TongTien' 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThuChi_Ngay]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThuChi_Ngay] @TenTaiKhoan nvarchar(50), @month int, @year int
as
begin
declare @TienChi int
declare @TienThu int
select  @TienChi= SUM(SoTien) 
			from CHI
			where TenTaiKhoan like @TenTaiKhoan  and (MONTH(Ngay) = @month AND YEAR(Ngay) =@year)
			group by   TenTaiKhoan

select  @TienThu= SUM(SoTien) 
			from THU
			where TenTaiKhoan like @TenTaiKhoan  and (MONTH(Ngay) = @month AND YEAR(Ngay) =@year)
			group by   TenTaiKhoan

select iif (@TienThu is null,0,@TienThu) - iif (@TienChi is null,0,@TienChi) as 'TongTien'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongThuChi_Thang]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_TongThuChi_Thang] @TenTaiKhoan nvarchar(50), @year INT
as
begin
declare @TienChi int
declare @TienThu int

select  @TienChi = sum(SoTien) 
		from CHI
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = @year
		group by TenTaiKhoan

select  @TienThu = sum(SoTien) 
		from THU
		where TenTaiKhoan like @TenTaiKhoan and YEAR(Ngay) = @year
		group by TenTaiKhoan

select iif (@TienThu is null,0,@TienThu) - iif (@TienChi is null,0,@TienChi) as 'TongTien' 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TongViTien]    Script Date: 15/12/2021 7:24:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_TongViTien] @TenTaiKhoan nvarchar(50) 
as
begin
	select  TenTaiKhoan,sum(Sodu) as TongTien
from VITIEN
where TenTaiKhoan like @TenTaiKhoan
group by TenTaiKhoan
end

execute sp_TongViTien 'test'
execute sp_TaiChinhHT 'babaraus123'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã Chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'MaChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số hạng mục chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'MSHangMucChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'SoTien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'Ngay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'MSVI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CHI', @level2type=N'COLUMN',@level2name=N'TenTaiKhoan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số hạng mục chi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DANHMUCCHI', @level2type=N'COLUMN',@level2name=N'MSHangMucChi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hạng mục' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DANHMUCCHI', @level2type=N'COLUMN',@level2name=N'TenHangMuc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số hạng mục thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DANHMUCTHU', @level2type=N'COLUMN',@level2name=N'MSHangMucThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hạng mục' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DANHMUCTHU', @level2type=N'COLUMN',@level2name=N'TenHangMuc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số loại ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOAIVI', @level2type=N'COLUMN',@level2name=N'MSLoaiVi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên loại ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LOAIVI', @level2type=N'COLUMN',@level2name=N'TenLoai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số người dùng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'MSND'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hiển thị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'TenHienThi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'HoTen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'SDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'GioiTinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Năm sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'NamSinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'Hinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'TenTaiKhoan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vai trò' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NGUOIDUNG', @level2type=N'COLUMN',@level2name=N'VaiTro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAIKHOAN', @level2type=N'COLUMN',@level2name=N'TenTaiKhoan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TAIKHOAN', @level2type=N'COLUMN',@level2name=N'MatKhau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'MaThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số hạng mục thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'MSHangMucThu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'SoTien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'Ngay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'MSVI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'THU', @level2type=N'COLUMN',@level2name=N'TenTaiKhoan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'MSVI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'TenVi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số loại ví' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'MSLoaiVi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số dư' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'SoDu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'Hinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tài khoản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'TenTaiKhoan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tình trạng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VITIEN', @level2type=N'COLUMN',@level2name=N'TinhTrang'
GO
USE [master]
GO
ALTER DATABASE [QuanLyChiTieu] SET  READ_WRITE 
GO
