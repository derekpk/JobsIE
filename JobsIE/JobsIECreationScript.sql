/****** Object:  ForeignKey [FK_TblJobApplications_ToTblJobOffers]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblJobOffers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications] DROP CONSTRAINT [FK_TblJobApplications_ToTblJobOffers]
GO
/****** Object:  ForeignKey [FK_TblJobApplications_ToTblUsers]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications] DROP CONSTRAINT [FK_TblJobApplications_ToTblUsers]
GO
/****** Object:  ForeignKey [FK_TblJobOffer_ToTblCompanies]    Script Date: 04/23/2012 14:06:07 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobOffer_ToTblCompanies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobOffers]'))
ALTER TABLE [dbo].[TblJobOffers] DROP CONSTRAINT [FK_TblJobOffer_ToTblCompanies]
GO
/****** Object:  Table [dbo].[TblJobApplications]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblJobApplications]') AND type in (N'U'))
DROP TABLE [dbo].[TblJobApplications]
GO
/****** Object:  Table [dbo].[TblJobOffers]    Script Date: 04/23/2012 14:06:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblJobOffers]') AND type in (N'U'))
DROP TABLE [dbo].[TblJobOffers]
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 04/23/2012 14:06:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblUsers]') AND type in (N'U'))
DROP TABLE [dbo].[TblUsers]
GO
/****** Object:  Table [dbo].[TblCompanies]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblCompanies]') AND type in (N'U'))
DROP TABLE [dbo].[TblCompanies]
GO
/****** Object:  Default [DF__TblCompan__Subsc__4D94879B]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__TblCompan__Subsc__4D94879B]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblCompanies]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__TblCompan__Subsc__4D94879B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblCompanies] DROP CONSTRAINT [DF__TblCompan__Subsc__4D94879B]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Appli__52593CB8]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Appli__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Appli__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobApplications] DROP CONSTRAINT [DF__tmp_ms_xx__Appli__52593CB8]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Appli__534D60F1]    Script Date: 04/23/2012 14:06:06 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Appli__534D60F1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Appli__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobApplications] DROP CONSTRAINT [DF__tmp_ms_xx__Appli__534D60F1]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Offer__59063A47]    Script Date: 04/23/2012 14:06:07 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Offer__59063A47]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobOffers]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Offer__59063A47]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobOffers] DROP CONSTRAINT [DF__tmp_ms_xx__Offer__59063A47]
END


End
GO
/****** Object:  Table [dbo].[TblCompanies]    Script Date: 04/23/2012 14:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblCompanies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblCompanies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PaymentDate] [date] NULL,
	[SubscriptionType] [int] NOT NULL,
	[Phone] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC070EA330E9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TblCompanies] ON
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (2, N'Microsoft Corporation', N'info@microsoft.com', N'California', N'We make Windows software', CAST(0x93350B00 AS Date), 1, N'5551555             ', N'fred                ', CAST(0x0000A03C003113B7 AS DateTime))
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (3, N'Apple Computers', N'info@Apple.com', N'Silicon Valley, California', N'IPad and IPhone hardware and software', NULL, 0, N'1234991             ', N'fred                ', CAST(0x0000A03C00CD3ADD AS DateTime))
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (4, N'I.B.M.', N'info@IBM.com', N'Blanchardstown', N'Used to be the biggest', CAST(0x95350B00 AS Date), 2, N'1234567             ', N'fred                ', CAST(0x0000A03B016C2F97 AS DateTime))
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (5, N'Nokia', N'info@Nokia.com', N'Sweden', N'Mobile Devices Manufacturers', CAST(0x93350B00 AS Date), 1, N'1234000             ', N'fred                ', CAST(0x0000A03B00F061E8 AS DateTime))
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (6, N'Google Inc.', N'info@google.com', N'New york, London, Paris, Dublin', N'The worlds most popular search engine', CAST(0x96350B00 AS Date), 2, N'01321654876         ', N'fred                ', CAST(0x0000A03C0030A2C4 AS DateTime))
INSERT [dbo].[TblCompanies] ([Id], [Name], [Email], [Address], [Description], [PaymentDate], [SubscriptionType], [Phone], [Password], [LoginDate]) VALUES (8, N'Dell Ireland', N'info@Dell.com', N'Limerick', N'Big Computer maker', CAST(0x97350B00 AS Date), 2, N'01020202            ', N'fred                ', CAST(0x0000A03C00D730AE AS DateTime))
SET IDENTITY_INSERT [dbo].[TblCompanies] OFF
/****** Object:  Table [dbo].[TblUsers]    Script Date: 04/23/2012 14:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Buzzwords] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Age] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[CV_Path] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC074AB81AF0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TblUsers] ON
INSERT [dbo].[TblUsers] ([Id], [Name], [Buzzwords], [Email], [Address], [Phone], [Age], [Password], [LoginDate], [CV_Path]) VALUES (29, N'Big Little Joe', N'C++ ASP.net Java', N'joe@dit.ie', N'1 Bolton Street', N'9991112             ', N'46        ', N'fred                ', CAST(0x0000A03B001D4A63 AS DateTime), NULL)
INSERT [dbo].[TblUsers] ([Id], [Name], [Buzzwords], [Email], [Address], [Phone], [Age], [Password], [LoginDate], [CV_Path]) VALUES (30, N'Derek P Keogh', N'SQL Java Netbeans Visual Studio', N'derek@A1.com', N'70 Gracefield road, Artane', N'4442550             ', N'44        ', N'fred                ', CAST(0x0000A03C002A5B5E AS DateTime), N'DerekKeoghAssignment.doc')
INSERT [dbo].[TblUsers] ([Id], [Name], [Buzzwords], [Email], [Address], [Phone], [Age], [Password], [LoginDate], [CV_Path]) VALUES (31, N'jerome', N'VB ASP.net Java SQL Scripting', N'jerome@dit.ie', N'ddd', N'1234567             ', N'21        ', N'fred                ', CAST(0x0000A03501624018 AS DateTime), N'Matchcard.txt')
INSERT [dbo].[TblUsers] ([Id], [Name], [Buzzwords], [Email], [Address], [Phone], [Age], [Password], [LoginDate], [CV_Path]) VALUES (32, N'Mr User', N'C# C++ Java ASP.net VB.net Script HTML XML CSS', N'MrUser@A1.com', N'1 Bolton Street', N'0122222222          ', N'21        ', N'fred                ', CAST(0x0000A03C009AAE8B AS DateTime), N'MrUser_CV.doc')
INSERT [dbo].[TblUsers] ([Id], [Name], [Buzzwords], [Email], [Address], [Phone], [Age], [Password], [LoginDate], [CV_Path]) VALUES (33, N'DellBert', N'C++ Assembly UML', N'DelBert@A1.com', N'Just outside Limerick', N'1020202020          ', N'21        ', N'fred                ', CAST(0x0000A03C00D6C183 AS DateTime), N'MatchcardTemplate.txt')
SET IDENTITY_INSERT [dbo].[TblUsers] OFF
/****** Object:  Table [dbo].[TblJobOffers]    Script Date: 04/23/2012 14:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblJobOffers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblJobOffers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Title] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Details] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Location] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OfferDate] [date] NOT NULL,
	[Salary] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Benefits] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hours] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_TblJobOffers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TblJobOffers] ON
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (1, 2, N'C++ Programmers required', N'Great Job', N'Dublin', CAST(0x93350B00 AS Date), N'35,000', N'Free coke                                                                                           ', N'40                                                ')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (2, 2, N'ASP.net Developer Required', N'Even Better Job', N'Cork', CAST(0x95350B00 AS Date), N'50,000', N'Free Phones and Credit                                                                              ', N'37.5                                              ')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (3, 2, N'Java Guru Needed ASAP', N'Super duper Job', N'Dublin', CAST(0x56350B00 AS Date), N'40,000', N'Loads', N'40')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (4, 3, N'Phone Application Developer', N'ASP.net required and some C++', N'New york', CAST(0x92350B00 AS Date), N'50,000', N'Free car', N'37')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (5, 3, N'ASP.net Expert Required', N'VB and Java', N'London', CAST(0x8F350B00 AS Date), N'60,000', N'free coke and chocolate bars', N'40')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (6, 2, N'The Best Job so far', N'C++ Java Netbeans Visual Studio', N'Moscow', CAST(0x93350B00 AS Date), N'100,000', N'To many to mention                                                                                  ', N'To Be Decided                                     ')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (7, 4, N'Mainframe Programmer', N'Cobol Database Design LDAP', N'Dublin', CAST(0x94350B00 AS Date), N'To Be Decided', N'To many to mention', N'20')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (8, 4, N'Mainframe Design', N'Senior level software designer', N'Dublin', CAST(0x94350B00 AS Date), N'150,000', N'To Be Decided', N'35')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (9, 6, N'Chief Googler', N'Knowledge of Android and mobile scripting', N'Dublin', CAST(0x96350B00 AS Date), N'110,000', N'Loads and loads                                                                                     ', N'40                                                ')
INSERT [dbo].[TblJobOffers] ([Id], [CompanyId], [Title], [Details], [Location], [OfferDate], [Salary], [Benefits], [Hours]) VALUES (10, 8, N'Dell Programming Expert', N'C++ Assembly code UML', N'Limerick', CAST(0x97350B00 AS Date), N'200,000', N'Free Laptops and Desktops for all the family                                                        ', N'35                                                ')
SET IDENTITY_INSERT [dbo].[TblJobOffers] OFF
/****** Object:  Table [dbo].[TblJobApplications]    Script Date: 04/23/2012 14:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblJobApplications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblJobApplications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobOfferId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ApplicationState] [int] NOT NULL,
	[ApplicationDate] [date] NOT NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC075070F446] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TblJobApplications] ON
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (1, 6, 30, 0, CAST(0x94350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (2, 5, 30, 1, CAST(0x94350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (3, 7, 30, 1, CAST(0x95350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (4, 1, 32, 1, CAST(0x96350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (5, 9, 30, 1, CAST(0x96350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (6, 9, 32, 1, CAST(0x97350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (7, 10, 33, 1, CAST(0x97350B00 AS Date))
INSERT [dbo].[TblJobApplications] ([Id], [JobOfferId], [UserId], [ApplicationState], [ApplicationDate]) VALUES (8, 4, 33, 0, CAST(0x97350B00 AS Date))
SET IDENTITY_INSERT [dbo].[TblJobApplications] OFF
/****** Object:  Default [DF__TblCompan__Subsc__4D94879B]    Script Date: 04/23/2012 14:06:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__TblCompan__Subsc__4D94879B]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblCompanies]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__TblCompan__Subsc__4D94879B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblCompanies] ADD  CONSTRAINT [DF__TblCompan__Subsc__4D94879B]  DEFAULT ((0)) FOR [SubscriptionType]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Appli__52593CB8]    Script Date: 04/23/2012 14:06:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Appli__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Appli__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobApplications] ADD  CONSTRAINT [DF__tmp_ms_xx__Appli__52593CB8]  DEFAULT ((0)) FOR [ApplicationState]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Appli__534D60F1]    Script Date: 04/23/2012 14:06:06 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Appli__534D60F1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Appli__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobApplications] ADD  CONSTRAINT [DF__tmp_ms_xx__Appli__534D60F1]  DEFAULT (getdate()) FOR [ApplicationDate]
END


End
GO
/****** Object:  Default [DF__tmp_ms_xx__Offer__59063A47]    Script Date: 04/23/2012 14:06:07 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__tmp_ms_xx__Offer__59063A47]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobOffers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tmp_ms_xx__Offer__59063A47]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TblJobOffers] ADD  CONSTRAINT [DF__tmp_ms_xx__Offer__59063A47]  DEFAULT (getdate()) FOR [OfferDate]
END


End
GO
/****** Object:  ForeignKey [FK_TblJobApplications_ToTblJobOffers]    Script Date: 04/23/2012 14:06:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblJobOffers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications]  WITH CHECK ADD  CONSTRAINT [FK_TblJobApplications_ToTblJobOffers] FOREIGN KEY([JobOfferId])
REFERENCES [dbo].[TblJobOffers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblJobOffers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications] CHECK CONSTRAINT [FK_TblJobApplications_ToTblJobOffers]
GO
/****** Object:  ForeignKey [FK_TblJobApplications_ToTblUsers]    Script Date: 04/23/2012 14:06:06 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications]  WITH CHECK ADD  CONSTRAINT [FK_TblJobApplications_ToTblUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[TblUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobApplications_ToTblUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobApplications]'))
ALTER TABLE [dbo].[TblJobApplications] CHECK CONSTRAINT [FK_TblJobApplications_ToTblUsers]
GO
/****** Object:  ForeignKey [FK_TblJobOffer_ToTblCompanies]    Script Date: 04/23/2012 14:06:07 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobOffer_ToTblCompanies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobOffers]'))
ALTER TABLE [dbo].[TblJobOffers]  WITH CHECK ADD  CONSTRAINT [FK_TblJobOffer_ToTblCompanies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[TblCompanies] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TblJobOffer_ToTblCompanies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TblJobOffers]'))
ALTER TABLE [dbo].[TblJobOffers] CHECK CONSTRAINT [FK_TblJobOffer_ToTblCompanies]
GO
