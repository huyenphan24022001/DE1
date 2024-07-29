USE [DE1]
GO
/****** Object:  Table [dbo].[QLNen]    Script Date: 7/29/2024 11:18:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLNen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[CCCD] [nvarchar](255) NULL,
	[Phone] [nvarchar](10) NULL,
	[TenNen] [nvarchar](255) NULL,
	[DienTich] [nvarchar](255) NULL,
	[TinhTrang] [bit] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[GhiChu] [nvarchar](255) NULL,
	[IsDelete] [bit] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 7/29/2024 11:18:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Users_ID] [int] NULL,
	[access_token] [nvarchar](255) NULL,
	[refresh_token] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/29/2024 11:18:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Pass] [nvarchar](255) NULL,
	[Role] [int] NULL,
	[FullName] [nvarchar](255) NULL,
	[CCCD] [nvarchar](12) NULL,
	[Phone] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QLNen] ON 

INSERT [dbo].[QLNen] ([ID], [FullName], [CCCD], [Phone], [TenNen], [DienTich], [TinhTrang], [DiaChi], [GhiChu], [IsDelete], [UserID]) VALUES (2, N'Phan Huyen', N'222222222222', N'0356492230', N'N001', N'2x2m', 1, N'Thanh Bình', NULL, 1, NULL)
INSERT [dbo].[QLNen] ([ID], [FullName], [CCCD], [Phone], [TenNen], [DienTich], [TinhTrang], [DiaChi], [GhiChu], [IsDelete], [UserID]) VALUES (3, N'Phan Huyen', N'111111111111', N'0356492230', N'N002', N'12x10m', 1, N'Thanh Bình', NULL, 1, NULL)
INSERT [dbo].[QLNen] ([ID], [FullName], [CCCD], [Phone], [TenNen], [DienTich], [TinhTrang], [DiaChi], [GhiChu], [IsDelete], [UserID]) VALUES (4, N'huyen', NULL, NULL, N'N006', N'22x10m', 1, N'Thanh Bình', NULL, 0, 5)
INSERT [dbo].[QLNen] ([ID], [FullName], [CCCD], [Phone], [TenNen], [DienTich], [TinhTrang], [DiaChi], [GhiChu], [IsDelete], [UserID]) VALUES (5, NULL, NULL, NULL, N'N007', N'15x5m', 0, N'Thanh Bình', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[QLNen] OFF
GO
SET IDENTITY_INSERT [dbo].[Token] ON 

INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (1, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE0NzY3NTh9.hj8wMSAEKnJSxvbGdugNQAlu8GoYG6neYD9WyI6H_BQ', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIwNzc5NTh9.uIP0rxIm23lNgaLFlvNuWxHcwGXxQgo1cQzuxKpsBFk')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (2, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE0NzcwNzd9.c1D5O9mtZCDwilIg1lHSYiKw17ym0udenHOSrCov1EQ', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIwNzgyNzd9.93I148RU0rDXh1QMSb8Rf9jZNGMbInF1h0sRbNpRPdg')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (3, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE0Nzc2NDF9.Ff5eZuL30SnsqjrRdUu6f2AtzCf7TUu-aiAKdjiPmCY', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIwNzg4NDF9.DTrktFDoWTk4yjf1gIuXOJHCfQfbOTI5fTMjQOWTZyE')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (4, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE0Nzc3MTN9.DTDhEsgoQ8fRbK7LDLHzGG7QtFzEoMRP4LRpi7fffqQ', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIwNzg5MTN9.kjuDzTvoJ-diy2bpXmIc5Y5RWxihfrndlW8T5PyICvE')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (5, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE0Nzc4MjN9.Kads5UZqjmoB07jeIJkR8L1msglzSOzvWBI7XWtUCjo', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIwNzkwMjN9.tsNxsw0RcA_BI2QmHzkbvXpCZFv0FIVb1EPA2EzL08E')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (6, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjE2MjE1NDV9.SG1O2CvGE-gsXQmIawRE66ldvcnqplDZVObBnX9f-L4', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjI3NDV9.5gtvBP42HyQZtE9obu9xmtiTBPiSrwWBNoV_EEil7lg')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (7, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjY3NDd9.jZvwuTf0GRBb1sihiBb5wDhfPyBk4SqLQpARcBHUf28', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4Mjc5NDd9.WFYNdJ_B9bitSTuRjT1dVd5DCBAerGfNZzx_Rwbi6Kc')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (8, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjY4NTR9.l0Fdw37Jtz2WkDcJJiKrRJo6Wx7A-3x_a9gCFysj5sE', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MjgwNTR9.KQ9Jp9ieCIWLhhGrz6JtIGUVjSdYtZtzloIwPIHzZk4')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (9, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjY4NTR9.l0Fdw37Jtz2WkDcJJiKrRJo6Wx7A-3x_a9gCFysj5sE', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MjgwNTR9.KQ9Jp9ieCIWLhhGrz6JtIGUVjSdYtZtzloIwPIHzZk4')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (10, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjY4NzZ9.aIgjR84iC16bfq14NUGHOsXjKtdZY0xtElBnupTF6kA', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MjgwNzZ9.BcxTs5rc2ljOaax9IDxlO8BVLro4VnqENzpzbPIkTKA')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (11, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjc5NTB9.-hhG6CXe4_zceRAacso5Y6J5iHCoqOuptO8uyYoaQuQ', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MjkxNTB9.FaTCbCwjEEI4epIePuHncpbElasqaz7H2cGtT1v7L6M')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (12, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjg4MjF9.r0j9CIeyLc0jcMBl79xhVib9M-gxQ98yj2wt8e1hf6s', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MzAwMjF9.EG1l8ASe7m2uc3CuY27NIkGnMyaz0jE9gR92mRAVAL4')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (13, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjg4NjR9.SEpVx3Niv6vXrtGkY_MHZ2oq1yZ7VsBBcxSK4OC5mDY', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MzAwNjR9.7gDMvcyIqfePxawTU2aPjLRHqsnQI4DVmVLkfAFSd6U')
INSERT [dbo].[Token] ([ID], [Users_ID], [access_token], [refresh_token]) VALUES (14, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjIyMjkwMjh9.IHxXgrdPNIQgqjHQhjuRbqCNHM7qO4oRGHTdm88s72Y', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjEiLCJVc2VyTmFtZSI6ImFkbWluIiwiUm9sZSI6IjEiLCJleHAiOjE3MjI4MzAyMjh9.aE23hAIMmAuFsryNMBdtO0Q59tIUlnYGve7tw5fHy7E')
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Pass], [Role], [FullName], [CCCD], [Phone]) VALUES (1, N'admin', N'f52EmOY2EqOlO+TvezMgDgWOo+sI249P1hzRKVcu1gE=', 1, N'admin', N'123456789123', N'123456789')
INSERT [dbo].[Users] ([ID], [UserName], [Pass], [Role], [FullName], [CCCD], [Phone]) VALUES (4, N'User', N'g/pbO9WZWuPK+yJQsY11zessVCYOri/wFsBybhsX+a4=', 2, N'User', N'123456789123', N'123456789')
INSERT [dbo].[Users] ([ID], [UserName], [Pass], [Role], [FullName], [CCCD], [Phone]) VALUES (5, N'huyen', N'f52EmOY2EqOlO+TvezMgDgWOo+sI249P1hzRKVcu1gE=', 2, N'huyen', N'123456789123', N'123456789')
INSERT [dbo].[Users] ([ID], [UserName], [Pass], [Role], [FullName], [CCCD], [Phone]) VALUES (6, N'test', N'f52EmOY2EqOlO+TvezMgDgWOo+sI249P1hzRKVcu1gE=', 2, N'test', N'123456789123', N'123456789')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[QLNen] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[QLNen]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([Users_ID])
REFERENCES [dbo].[Users] ([ID])
GO
