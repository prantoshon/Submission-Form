USE [PPL]
GO
/****** Object:  Table [dbo].[CoronaInfo]    Script Date: 6/9/2020 6:24:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoronaInfo](
	[Dept] [nvarchar](50) NULL,
	[pin] [nvarchar](50) NULL,
	[Name] [nvarchar](max) NULL,
	[PresentAddress] [nvarchar](max) NULL,
	[HouseType] [nvarchar](50) NULL,
	[Coronasymptom] [nchar](1) NULL,
	[CoronasymptomDetails] [nvarchar](max) NULL,
	[WaytoComeOffice] [nvarchar](max) NULL,
	[comment1] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[WaytoComeOffice2] [nchar](3) NULL,
	[WaytoComeOffice3] [nvarchar](4) NULL,
	[WaytoComeOffice4] [nvarchar](9) NULL,
	[WaytoComeOffice5] [nvarchar](3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
