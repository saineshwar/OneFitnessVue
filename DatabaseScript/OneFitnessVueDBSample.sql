USE [OneFitnessVueDBSample]
GO
/****** Object:  Table [dbo].[AssignedRoles]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedRoles](
	[AssignedRoleId] [smallint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_AssignedRoles] PRIMARY KEY CLUSTERED 
(
	[AssignedRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_ChangePasswordLog]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_ChangePasswordLog](
	[CpId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
 CONSTRAINT [PK_CSC_ChangePasswordLog] PRIMARY KEY CLUSTERED 
(
	[CpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentMaster]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentMaster](
	[DMId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DocumentMaster] PRIMARY KEY CLUSTERED 
(
	[DMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquiry]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquiry](
	[EnquiryId] [int] IDENTITY(1,1) NOT NULL,
	[WorkOutId] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[MobileNo] [varchar](10) NULL,
	[EmailId] [varchar](100) NULL,
	[GenderId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [bit] NULL,
	[EnquiryDetails] [varchar](100) NULL,
	[ReasonId] [int] NULL,
 CONSTRAINT [PK_Enquiry] PRIMARY KEY CLUSTERED 
(
	[EnquiryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneralSettings]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralSettings](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[SupportEmailId] [varchar](100) NULL,
	[WebsiteTitle] [varchar](100) NULL,
	[WebsiteUrl] [varchar](100) NULL,
	[TelephoneNo] [varchar](15) NULL,
	[MobileNo] [varchar](10) NULL,
	[Status] [bit] NULL,
	[Logopath] [varchar](100) NULL,
	[LogoFileName] [varchar](100) NULL,
	[Address] [varchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_GeneralSettings] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InVoiceCounter]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InVoiceCounter](
	[InvoiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[Counter] [bigint] NULL,
 CONSTRAINT [PK_InVoiceCounter] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRegistration]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRegistration](
	[MemberId] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberNo] [varchar](20) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[MiddleName] [varchar](100) NULL,
	[DOB] [datetime] NULL,
	[Age] [int] NULL,
	[MobileNo] [varchar](10) NULL,
	[EmailId] [varchar](100) NULL,
	[GenderId] [int] NULL,
	[Address] [varchar](500) NULL,
	[JoiningDate] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [bit] NULL,
	[EmergencyContactName] [varchar](100) NULL,
	[EmergencyContactNo] [varchar](15) NULL,
 CONSTRAINT [PK_MemberRegistration] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[MenuCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MenuCategoryName] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Status] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[SortingOrder] [int] NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[MenuCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](100) NULL,
	[ControllerName] [varchar](100) NULL,
	[ActionMethod] [varchar](100) NULL,
	[Area] [varchar](100) NULL,
	[Status] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[MenuCategoryId] [int] NULL,
	[RoleId] [int] NULL,
	[SortingOrder] [int] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_MenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NLog]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](200) NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [varchar](5) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](300) NULL,
	[Properties] [nvarchar](max) NULL,
	[Callsite] [nvarchar](300) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[PaymentID] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentFromdt] [datetime] NULL,
	[PaymentTodt] [datetime] NULL,
	[NextRenewalDate] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[RecStatus] [char](1) NULL,
	[MemberID] [bigint] NULL,
	[PaymentTypeId] [int] NULL,
	[TaxId] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[TaxPercentage] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[WorkOutId] [int] NULL,
	[MembershipTypeId] [int] NULL,
	[InstallmentId] [int] NULL,
	[MemberNo] [varchar](20) NULL,
	[TaxPercentageAmount] [decimal](18, 2) NULL,
	[ApplicationType] [char](2) NULL,
	[InvoiceNo] [bigint] NULL,
 CONSTRAINT [PK_PaymentDetails] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reasons]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reasons](
	[ReasonId] [int] IDENTITY(1,1) NOT NULL,
	[ReasonName] [varchar](50) NULL,
 CONSTRAINT [PK_Reasons] PRIMARY KEY CLUSTERED 
(
	[ReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptHistory]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptHistory](
	[ReceiptHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[InvoiceNo] [bigint] NULL,
	[MemberNo] [varchar](20) NULL,
 CONSTRAINT [PK_ReceiptHistory] PRIMARY KEY CLUSTERED 
(
	[ReceiptHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[MobileNo] [varchar](20) NULL,
	[Gender] [char](1) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [int] NULL,
	[IsFirstLogin] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsFirstLoginDate] [datetime] NULL,
	[PasswordHash] [varchar](300) NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssignedRoles] ON 
GO
INSERT [dbo].[AssignedRoles] ([AssignedRoleId], [UserId], [RoleId], [CreateDate], [Status]) VALUES (1, 1, 1, CAST(N'2021-04-19T16:51:28.037' AS DateTime), 1)
GO
INSERT [dbo].[AssignedRoles] ([AssignedRoleId], [UserId], [RoleId], [CreateDate], [Status]) VALUES (2, 2, 2, CAST(N'2021-05-06T17:19:14.913' AS DateTime), 1)
GO
INSERT [dbo].[AssignedRoles] ([AssignedRoleId], [UserId], [RoleId], [CreateDate], [Status]) VALUES (3, 3, 3, CAST(N'2021-05-06T17:27:18.323' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[AssignedRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Audit_ChangePasswordLog] ON 
GO
INSERT [dbo].[Audit_ChangePasswordLog] ([CpId], [UserId], [CreatedOn], [CreatedBy]) VALUES (1, 2, CAST(N'2021-06-21T19:33:56.037' AS DateTime), 2)
GO
INSERT [dbo].[Audit_ChangePasswordLog] ([CpId], [UserId], [CreatedOn], [CreatedBy]) VALUES (2, 2, CAST(N'2021-06-22T19:14:09.703' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[Audit_ChangePasswordLog] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentMaster] ON 
GO
INSERT [dbo].[DocumentMaster] ([DMId], [DocumentName], [Status]) VALUES (1, N'PAN Card', 1)
GO
INSERT [dbo].[DocumentMaster] ([DMId], [DocumentName], [Status]) VALUES (2, N'Aadhaar Card', 1)
GO
INSERT [dbo].[DocumentMaster] ([DMId], [DocumentName], [Status]) VALUES (3, N'Driving License', 1)
GO
SET IDENTITY_INSERT [dbo].[DocumentMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Enquiry] ON 
GO
INSERT [dbo].[Enquiry] ([EnquiryId], [WorkOutId], [FirstName], [LastName], [MiddleName], [MobileNo], [EmailId], [GenderId], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EnquiryDetails], [ReasonId]) VALUES (2, 1, N'Pravin', N'Patil', N'Manish', N'9855666666', N'pravin@g.com', 1, CAST(N'2021-06-23T18:16:06.657' AS DateTime), 2, NULL, NULL, 1, N'Gym Enquiry', 3)
GO
SET IDENTITY_INSERT [dbo].[Enquiry] OFF
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] ON 
GO
INSERT [dbo].[GeneralSettings] ([CompanyId], [Name], [SupportEmailId], [WebsiteTitle], [WebsiteUrl], [TelephoneNo], [MobileNo], [Status], [Logopath], [LogoFileName], [Address], [CreatedOn], [ModifiedOn], [ModifiedBy], [CreatedBy]) VALUES (1, N'OneFitnessVue', N'Support@OneFitnessVue.com', N'https://tutexchange.com/', N'OneFitnessVue', N'02225600000', N'9000000008', 1, N'/Images/Logos/191f79df-ce95-4d5e-b9ba-6c360985b785.png', N'191f79df-ce95-4d5e-b9ba-6c360985b785.png', N'OneFitnessVue Mumbai', CAST(N'2021-06-10T11:46:40.650' AS DateTime), CAST(N'2021-06-10T11:49:59.700' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[InVoiceCounter] ON 
GO
INSERT [dbo].[InVoiceCounter] ([InvoiceId], [Counter]) VALUES (1, 10)
GO
SET IDENTITY_INSERT [dbo].[InVoiceCounter] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberRegistration] ON 
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (1, N'OFV174NOAOMFXPU1', N'Britney', N'Carter', N'Alison', CAST(N'1990-06-01T00:00:00.000' AS DateTime), 31, N'9000000000', N'Britney@OneFitnessVue.com', 2, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-06-23T11:43:31.730' AS DateTime), 2, NULL, NULL, 1, N'Sai', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (2, N'OFV1749IUPYE4XJ8', N'Kendra', N'Cross', N'Pena', CAST(N'1993-06-13T00:00:00.000' AS DateTime), 28, N'9000000000', N'Kendra@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2021-06-23T11:43:31.730' AS DateTime), 2, CAST(N'2021-07-01T18:54:18.633' AS DateTime), 2, 1, N'Mahesh VenuGopal', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (3, N'OFV174TJH8F6RLTM', N'Pravin', N'Patil', N'Manish', CAST(N'1990-06-10T00:00:00.000' AS DateTime), 31, N'9000000000', N'Pravin@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-06-23T15:06:14.327' AS DateTime), 2, NULL, NULL, 1, N'Sai', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (4, N'OFV181X06ESVBSQ6', N'Ramesh', N'Jadhav', N'Ashutosh', CAST(N'1993-06-08T00:00:00.000' AS DateTime), 28, N'9000000000', N'Ramesh@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T15:33:08.203' AS DateTime), 2, NULL, NULL, 1, N'Sai', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (10004, N'OFV182TCBRRKQQ7W', N'Jayesh', N'Sharsti', N'Ravi', CAST(N'1993-07-01T00:00:00.000' AS DateTime), 28, N'9000000000', N'Jayesh@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2021-07-01T18:30:27.667' AS DateTime), 2, NULL, NULL, 1, N'Sai', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (10005, N'OFV183BJCRWMUJEK', N'Rakesh', N'Dinesh', N'Mahesh', CAST(N'1994-07-06T00:00:00.000' AS DateTime), 27, N'9000000000', N'Rakesh@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-07-02T00:00:00.000' AS DateTime), CAST(N'2021-07-02T19:10:47.943' AS DateTime), 2, NULL, NULL, 1, N'Mahesh', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (10006, N'OFV186JIKEIIUINS', N'Ravi', N'Prasad', N'Ganesh', CAST(N'1994-07-06T00:00:00.000' AS DateTime), 27, N'9000000000', N'Ravi@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-07-06T00:00:00.000' AS DateTime), CAST(N'2021-07-05T12:41:17.023' AS DateTime), 2, NULL, NULL, 1, N'Ganesh Prasad', N'9000000000')
GO
INSERT [dbo].[MemberRegistration] ([MemberId], [MemberNo], [FirstName], [LastName], [MiddleName], [DOB], [Age], [MobileNo], [EmailId], [GenderId], [Address], [JoiningDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [Status], [EmergencyContactName], [EmergencyContactNo]) VALUES (10007, N'OFV189AZ1GZYXBHD', N'Tejas', N'Tejas', N'Tejas', CAST(N'1995-07-11T00:00:00.000' AS DateTime), 26, N'9000000000', N'Tejas@OneFitnessVue.com', 1, N'Sri Krishna Niwas, 6, Takandas Kataria Marg, Matunga West', CAST(N'2021-07-08T00:00:00.000' AS DateTime), CAST(N'2021-07-08T14:41:04.397' AS DateTime), 2, NULL, NULL, 1, N'Tejas', N'9000000000')
GO
SET IDENTITY_INSERT [dbo].[MemberRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuCategory] ON 
GO
INSERT [dbo].[MenuCategory] ([MenuCategoryId], [MenuCategoryName], [RoleID], [Status], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [SortingOrder]) VALUES (1, N'Menu Settings', 1, 1, CAST(N'2021-04-19T19:29:13.770' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[MenuCategory] ([MenuCategoryId], [MenuCategoryName], [RoleID], [Status], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [SortingOrder]) VALUES (2, N'Master Settings', 1, 1, CAST(N'2021-04-19T19:29:13.770' AS DateTime), NULL, 1, NULL, 2)
GO
INSERT [dbo].[MenuCategory] ([MenuCategoryId], [MenuCategoryName], [RoleID], [Status], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [SortingOrder]) VALUES (3, N'Home', 2, 1, CAST(N'2021-05-07T12:06:18.417' AS DateTime), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[MenuCategory] ([MenuCategoryId], [MenuCategoryName], [RoleID], [Status], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [SortingOrder]) VALUES (4, N'REPORTS', 3, 1, CAST(N'2021-06-16T22:53:10.543' AS DateTime), NULL, 1, NULL, NULL)
GO
INSERT [dbo].[MenuCategory] ([MenuCategoryId], [MenuCategoryName], [RoleID], [Status], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [SortingOrder]) VALUES (5, N'REPORTS', 2, 1, CAST(N'2021-06-16T22:53:10.543' AS DateTime), NULL, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MenuCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuMaster] ON 
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (1, N'Create MenuCategory', N'MenuCategory', N'Create', N'Administration', 1, CAST(N'2021-04-19T19:32:29.627' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (2, N'Create Menu', N'MenuMaster', N'Create', N'Administration', 1, CAST(N'2021-04-19T19:33:09.483' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3, N'Create SubMenu', N'SubMenuMaster', N'Create', N'Administration', 1, CAST(N'2021-04-19T19:33:36.910' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (4, N'Order Menu Category', N'Ordering', N'MenuCategory', N'Administration', 1, CAST(N'2021-04-19T19:35:26.913' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (5, N'Order Main Menu', N'Ordering', N'MainMenu', N'Administration', 1, CAST(N'2021-04-19T19:35:54.090' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (6, N'Order Sub Menu', N'Ordering', N'SubMenu', N'Administration', 1, CAST(N'2021-04-19T19:36:19.400' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (7, N'Roles', N'RoleMaster', N'Index', N'Administration', 1, CAST(N'2021-04-19T19:36:47.140' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (8, N'Create Users', N'User', N'Create', N'Administration', 1, CAST(N'2021-04-19T19:37:11.063' AS DateTime), NULL, 1, 1, 1, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (1002, N'Add WorkOut', N'WorkOut', N'Add', N'Administration', 1, CAST(N'2021-04-23T19:01:58.070' AS DateTime), NULL, 2, 1, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (2002, N'Add Installment', N'Installment', N'Add', N'Administration', 1, CAST(N'2021-04-30T18:23:28.790' AS DateTime), NULL, 2, 1, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3002, N'MembershipType', N'MembershipType', N'Add', N'Administration', 1, CAST(N'2021-05-03T15:13:48.703' AS DateTime), NULL, 2, 1, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3003, N'Add Member', N'Member', N'Application', N'Service', 1, CAST(N'2021-05-07T12:14:29.850' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3004, N'Search Member', N'Member', N'Index', N'Service', 1, CAST(N'2021-06-07T19:03:24.383' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3005, N'General Settings', N'GeneralSettings', N'Settings', N'Administration', 1, CAST(N'2021-06-08T12:56:04.670' AS DateTime), NULL, 2, 1, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3006, N'Payment History', N'PaymentHistory', N'Index', N'Service', 1, CAST(N'2021-06-12T12:51:19.980' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3007, N'Application Renewal', N'Renewal', N'Application', N'Service', 0, CAST(N'2021-06-14T18:33:01.500' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3008, N'Yearwise Report', N'Report', N'Yearwise', N'Administration', 1, CAST(N'2021-06-16T22:53:50.667' AS DateTime), NULL, 4, 3, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3009, N'Monthwise Report', N'Report', N'Monthwise', N'Administration', 1, CAST(N'2021-06-16T22:54:14.740' AS DateTime), NULL, 4, 3, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3010, N'Renewal Report', N'Report', N'Renewal', N'Administration', 1, CAST(N'2021-06-16T22:54:33.627' AS DateTime), NULL, 4, 3, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3011, N'Renewal Report', N'Report', N'Renewal', N'Service', 1, CAST(N'2021-06-16T22:54:33.627' AS DateTime), NULL, 5, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3012, N'Add Enquiry', N'Enquiry', N'Application', N'Service', 1, CAST(N'2021-06-23T16:12:33.910' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3013, N'Application Refund', N'Refund', N'Application', N'Service', 0, CAST(N'2021-06-30T14:06:32.137' AS DateTime), NULL, 3, 2, NULL, 1, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [ControllerName], [ActionMethod], [Area], [Status], [CreatedOn], [ModifiedOn], [MenuCategoryId], [RoleId], [SortingOrder], [CreatedBy], [ModifiedBy]) VALUES (3014, N'Refund Report', N'Report', N'Refund', N'Administration', 1, CAST(N'2021-06-30T18:04:11.173' AS DateTime), NULL, 4, 3, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[NLog] ON 
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1, N'DESKTOP-DUM6D15', CAST(N'2021-07-02T19:34:23.650' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2, N'DESKTOP-DUM6D15', CAST(N'2021-07-03T10:44:13.137' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (3, N'DESKTOP-DUM6D15', CAST(N'2021-07-03T10:44:54.837' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (4, N'DESKTOP-DUM6D15', CAST(N'2021-07-03T10:44:55.067' AS DateTime), N'Error', N'Connection ID "18014398515387564064", Request ID "80000021-0001-fa00-b63f-84710c7967bb": An unhandled exception was thrown by the application.', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer', N'ConnectionId=18014398515387564064|TraceIdentifier=80000021-0001-fa00-b63f-84710c7967bb|EventId_Id=2|EventId_Name=ApplicationError|EventId=ApplicationError', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.ReportApplicationError', N'System.InvalidOperationException: There is already an open DataReader associated with this Connection which must be closed first.
   at Microsoft.Data.SqlClient.SqlInternalConnectionTds.ValidateConnectionForExecute(SqlCommand command)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Rollback()
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose(Boolean disposing)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose()
   at Microsoft.Data.SqlClient.SqlTransaction.Dispose(Boolean disposing)
   at System.Data.Common.DbTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.DisposeAsync()
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.AspNetCore.Http.Features.RequestServicesFeature.<DisposeAsync>g__Awaited|9_0(RequestServicesFeature servicesFeature, ValueTask vt)
   at Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.FireOnCompleted()')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (5, N'DESKTOP-DUM6D15', CAST(N'2021-07-03T10:45:51.610' AS DateTime), N'Error', N'Connection ID "18014398519682531766", Request ID "800001b7-0002-fa00-b63f-84710c7967bb": An unhandled exception was thrown by the application.', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer', N'ConnectionId=18014398519682531766|TraceIdentifier=800001b7-0002-fa00-b63f-84710c7967bb|EventId_Id=2|EventId_Name=ApplicationError|EventId=ApplicationError', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.ReportApplicationError', N'System.InvalidOperationException: There is already an open DataReader associated with this Connection which must be closed first.
   at Microsoft.Data.SqlClient.SqlInternalConnectionTds.ValidateConnectionForExecute(SqlCommand command)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Rollback()
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose(Boolean disposing)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose()
   at Microsoft.Data.SqlClient.SqlTransaction.Dispose(Boolean disposing)
   at System.Data.Common.DbTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.DisposeAsync()
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.AspNetCore.Http.Features.RequestServicesFeature.<DisposeAsync>g__Awaited|9_0(RequestServicesFeature servicesFeature, ValueTask vt)
   at Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.FireOnCompleted()')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (6, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T17:57:47.040' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (7, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T18:03:46.247' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (8, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T18:05:55.230' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (9, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T19:08:02.207' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (10, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T19:09:54.833' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (11, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T19:14:36.900' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (12, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T19:18:45.310' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (13, N'DESKTOP-DUM6D15', CAST(N'2021-07-04T19:26:26.887' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (14, N'DESKTOP-DUM6D15', CAST(N'2021-07-05T12:29:54.087' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (15, N'DESKTOP-DUM6D15', CAST(N'2021-07-05T12:38:47.997' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (16, N'DESKTOP-DUM6D15', CAST(N'2021-07-05T12:49:28.150' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (17, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T18:22:24.113' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (18, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T18:26:21.380' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (19, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T19:00:57.337' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (20, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T19:23:22.777' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (21, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T19:42:06.823' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (22, N'DESKTOP-DUM6D15', CAST(N'2021-07-06T19:49:55.940' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (23, N'DESKTOP-DUM6D15', CAST(N'2021-07-07T12:32:19.007' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (24, N'DESKTOP-DUM6D15', CAST(N'2021-07-07T12:57:09.780' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (25, N'DESKTOP-DUM6D15', CAST(N'2021-07-07T14:11:07.593' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (26, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:45:17.133' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (27, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:45:48.447' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (28, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:46:15.200' AS DateTime), N'Error', N'Connection ID "17582052946865029131", Request ID "8000000c-0000-f400-b63f-84710c7967bb": An unhandled exception was thrown by the application.', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer', N'ConnectionId=17582052946865029131|TraceIdentifier=8000000c-0000-f400-b63f-84710c7967bb|EventId_Id=2|EventId_Name=ApplicationError|EventId=ApplicationError', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.ReportApplicationError', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Rollback()
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose(Boolean disposing)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose()
   at Microsoft.Data.SqlClient.SqlTransaction.Dispose(Boolean disposing)
   at System.Data.Common.DbTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.DisposeAsync()
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.AspNetCore.Http.Features.RequestServicesFeature.<DisposeAsync>g__Awaited|9_0(RequestServicesFeature servicesFeature, ValueTask vt)
   at Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.FireOnCompleted()')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (29, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:46:45.850' AS DateTime), N'Error', N'Failed executing DbCommand (30,658ms) [Parameters=[], CommandType=''Text'', CommandTimeout=''30'']
SELECT COUNT(*)
FROM [PaymentDetails] AS [p]
INNER JOIN [MemberRegistration] AS [m] ON [p].[MemberID] = [m].[MemberId]
INNER JOIN [MembershipType] AS [m0] ON [p].[MembershipTypeId] = [m0].[MembershipTypeId]
INNER JOIN [WorkOut] AS [w] ON [p].[WorkOutId] = [w].[WorkOutId]
INNER JOIN [Installments] AS [i] ON [p].[InstallmentId] = [i].[InstallmentId]
INNER JOIN [TaxMaster] AS [t] ON [p].[TaxId] = [t].[TaxId]
INNER JOIN [PaymentType] AS [p0] ON [p].[PaymentTypeId] = [p0].[PaymentTypeId]', N'Microsoft.EntityFrameworkCore.Database.Command', N'elapsed=30,658|commandType=Text|commandTimeout=30|newLine=
|commandText=SELECT COUNT(*)
FROM [PaymentDetails] AS [p]
INNER JOIN [MemberRegistration] AS [m] ON [p].[MemberID] = [m].[MemberId]
INNER JOIN [MembershipType] AS [m0] ON [p].[MembershipTypeId] = [m0].[MembershipTypeId]
INNER JOIN [WorkOut] AS [w] ON [p].[WorkOutId] = [w].[WorkOutId]
INNER JOIN [Installments] AS [i] ON [p].[InstallmentId] = [i].[InstallmentId]
INNER JOIN [TaxMaster] AS [t] ON [p].[TaxId] = [t].[TaxId]
INNER JOIN [PaymentType] AS [p0] ON [p].[PaymentTypeId] = [p0].[PaymentTypeId]|EventId_Id=20102|EventId_Name=Microsoft.EntityFrameworkCore.Database.Command.CommandError|EventId=Microsoft.EntityFrameworkCore.Database.Command.CommandError', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition`6.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (30, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:46:45.867' AS DateTime), N'Error', N'An exception occurred while iterating over the results of a query for context type ''OneFitnessVue.Data.EFContext.OneFitnessVueContext''.
Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:b14cc192-89db-4d9f-955c-1a0c1ca7ade8
Error Number:-2,State:0,Class:11', N'Microsoft.EntityFrameworkCore.Query', N'contextType=OneFitnessVue.Data.EFContext.OneFitnessVueContext|newline=
|error=Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:b14cc192-89db-4d9f-955c-1a0c1ca7ade8
Error Number:-2,State:0,Class:11|EventId_Id=10100|EventId_Name=Microsoft.EntityFrameworkCore.Query.QueryIterationFailed|EventId=Microsoft.EntityFrameworkCore.Query.QueryIterationFailed', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition`3.Log', N'Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:b14cc192-89db-4d9f-955c-1a0c1ca7ade8
Error Number:-2,State:0,Class:11')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (31, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:46:54.723' AS DateTime), N'Error', N'An unhandled exception has occurred while executing the request.', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware', N'EventId_Id=1|EventId_Name=UnhandledException|EventId=UnhandledException', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke', N'Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Linq.Enumerable.Single[TSource](IEnumerable`1 source)
   at lambda_method589(Closure , QueryContext )
   at Microsoft.EntityFrameworkCore.Query.Internal.QueryCompiler.Execute[TResult](Expression query)
   at Microsoft.EntityFrameworkCore.Query.Internal.EntityQueryProvider.Execute[TResult](Expression expression)
   at System.Linq.Queryable.Count[TSource](IQueryable`1 source)
   at OneFitnessVue.Web.Areas.Service.Controllers.PaymentHistoryController.ShowAllMemberRegistration() in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Controllers\PaymentHistoryController.cs:line 44
   at lambda_method586(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
ClientConnectionId:b14cc192-89db-4d9f-955c-1a0c1ca7ade8
Error Number:-2,State:0,Class:11')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (32, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T12:51:36.767' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1026, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:03:32.000' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1027, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:07:57.590' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1028, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:08:15.703' AS DateTime), N'Error', N'An unhandled exception has occurred while executing the request.', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware', N'EventId_Id=1|EventId_Name=UnhandledException|EventId=UnhandledException', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at OneFitnessVue.Web.Areas.Service.Controllers.ReceiptController.Generate(String memberId, String paymentId) in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Controllers\ReceiptController.cs:line 64
   at lambda_method617(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1029, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:12:05.490' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1030, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:12:37.260' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1031, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:14:18.707' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (1032, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T13:15:05.677' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2026, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:08:36.717' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2027, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:15:49.190' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2028, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:16:18.760' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2029, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:26:34.610' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2030, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:30:03.007' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2031, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:31:58.173' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2032, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:37:39.403' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2033, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T14:39:44.987' AS DateTime), N'Error', N'An unhandled exception has occurred while executing the request.', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware', N'EventId_Id=1|EventId_Name=UnhandledException|EventId=UnhandledException', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke', N'System.ArgumentNullException: Value cannot be null. (Parameter ''items'')
   at Microsoft.AspNetCore.Mvc.Rendering.MultiSelectList..ctor(IEnumerable items, String dataValueField, String dataTextField, IEnumerable selectedValues, String dataGroupField)
   at Microsoft.AspNetCore.Mvc.Rendering.SelectList..ctor(IEnumerable items, String dataValueField, String dataTextField, Object selectedValue)
   at Microsoft.AspNetCore.Mvc.Rendering.SelectList..ctor(IEnumerable items, String dataValueField, String dataTextField)
   at AspNetCore.Areas_Service_Views_Member_Application.<ExecuteAsync>b__56_0() in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Views\Member\Application.cshtml:line 104
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext.GetChildContentAsync(Boolean useCachedResult, HtmlEncoder encoder)
   at Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper.ProcessAsync(TagHelperContext context, TagHelperOutput output)
   at Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner.<RunAsync>g__Awaited|0_0(Task task, TagHelperExecutionContext executionContext, Int32 i, Int32 count)
   at AspNetCore.Areas_Service_Views_Member_Application.ExecuteAsync() in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Views\Member\Application.cshtml:line 12
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageCoreAsync(IRazorPage page, ViewContext context)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderPageAsync(IRazorPage page, ViewContext context, Boolean invokeViewStarts)
   at Microsoft.AspNetCore.Mvc.Razor.RazorView.RenderAsync(ViewContext context)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ViewContext viewContext, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewExecutor.ExecuteAsync(ActionContext actionContext, IView view, ViewDataDictionary viewData, ITempDataDictionary tempData, String contentType, Nullable`1 statusCode)
   at Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor.ExecuteAsync(ActionContext context, ViewResult result)
   at Microsoft.AspNetCore.Mvc.ViewResult.ExecuteResultAsync(ActionContext context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|29_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2034, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:08:46.233' AS DateTime), N'Warn', N'A random key was generated. You can change it by setting the `options.WithEncryptionKey(...)` method.', N'DNTCaptcha.Core.CaptchaCryptoProvider', N'', N'DNTCaptcha.Core.CaptchaCryptoProvider.getDesKey', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2035, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:11:07.537' AS DateTime), N'Warn', N'The query uses the ''First''/''FirstOrDefault'' operator without ''OrderBy'' and filter operators. This may lead to unpredictable results.', N'Microsoft.EntityFrameworkCore.Query', N'EventId_Id=10103|EventId_Name=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning|EventId=Microsoft.EntityFrameworkCore.Query.FirstWithoutOrderByAndFilterWarning', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2036, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:12:52.177' AS DateTime), N'Error', N'Connection ID "18014398511092596737", Request ID "800000ca-0000-fa00-b63f-84710c7967bb": An unhandled exception was thrown by the application.', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer', N'ConnectionId=18014398511092596737|TraceIdentifier=800000ca-0000-fa00-b63f-84710c7967bb|EventId_Id=2|EventId_Name=ApplicationError|EventId=ApplicationError', N'Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.ReportApplicationError', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Rollback()
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose(Boolean disposing)
   at Microsoft.Data.SqlClient.SqlInternalTransaction.Dispose()
   at Microsoft.Data.SqlClient.SqlTransaction.Dispose(Boolean disposing)
   at System.Data.Common.DbTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalTransaction.DisposeAsync()
   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.DisposeAsync()
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.<DisposeAsync>g__Await|15_0(Int32 i, ValueTask vt, List`1 toDispose)
   at Microsoft.AspNetCore.Http.Features.RequestServicesFeature.<DisposeAsync>g__Awaited|9_0(RequestServicesFeature servicesFeature, ValueTask vt)
   at Microsoft.AspNetCore.Server.IIS.Core.IISHttpContext.FireOnCompleted()')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2037, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:13:22.203' AS DateTime), N'Error', N'Failed executing DbCommand (30,028ms) [Parameters=[], CommandType=''Text'', CommandTimeout=''30'']
SELECT [i].[InstallmentName], CONVERT(VARCHAR(11), [i].[InstallmentMonths]), CONVERT(VARCHAR(11), [i].[InstallmentId])
FROM [Installments] AS [i]', N'Microsoft.EntityFrameworkCore.Database.Command', N'elapsed=30,028|commandType=Text|commandTimeout=30|newLine=
|commandText=SELECT [i].[InstallmentName], CONVERT(VARCHAR(11), [i].[InstallmentMonths]), CONVERT(VARCHAR(11), [i].[InstallmentId])
FROM [Installments] AS [i]|EventId_Id=20102|EventId_Name=Microsoft.EntityFrameworkCore.Database.Command.CommandError|EventId=Microsoft.EntityFrameworkCore.Database.Command.CommandError', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition`6.Log', N'')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2038, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:13:22.240' AS DateTime), N'Error', N'An exception occurred while iterating over the results of a query for context type ''OneFitnessVue.Data.EFContext.OneFitnessVueContext''.
Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:7a3fa969-d190-4d82-837a-27fb510b728a
Error Number:-2,State:0,Class:11', N'Microsoft.EntityFrameworkCore.Query', N'contextType=OneFitnessVue.Data.EFContext.OneFitnessVueContext|newline=
|error=Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:7a3fa969-d190-4d82-837a-27fb510b728a
Error Number:-2,State:0,Class:11|EventId_Id=10100|EventId_Name=Microsoft.EntityFrameworkCore.Query.QueryIterationFailed|EventId=Microsoft.EntityFrameworkCore.Query.QueryIterationFailed', N'Microsoft.EntityFrameworkCore.Diagnostics.EventDefinition`3.Log', N'Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
ClientConnectionId:7a3fa969-d190-4d82-837a-27fb510b728a
Error Number:-2,State:0,Class:11')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2039, N'DESKTOP-DUM6D15', CAST(N'2021-07-08T15:13:32.127' AS DateTime), N'Error', N'An unhandled exception has occurred while executing the request.', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware', N'EventId_Id=1|EventId_Name=UnhandledException|EventId=UnhandledException', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke', N'Microsoft.Data.SqlClient.SqlException (0x80131904): Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.
 ---> System.ComponentModel.Win32Exception (258): The wait operation timed out.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader()
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReader(RelationalCommandParameterObject parameterObject)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.InitializeReader(DbContext _, Boolean result)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.Execute[TState,TResult](TState state, Func`3 operation, Func`3 verifySucceeded)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at OneFitnessVue.Data.Installments.Queries.InstallmentQueries.GetInstallments() in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Data\Installments\Queries\InstallmentQueries.cs:line 100
   at OneFitnessVue.Web.Areas.Service.Controllers.MemberController.Application() in D:\Projects\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Controllers\MemberController.cs:line 79
   at lambda_method261(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
ClientConnectionId:7a3fa969-d190-4d82-837a-27fb510b728a
Error Number:-2,State:0,Class:11')
GO
INSERT [dbo].[NLog] ([ID], [MachineName], [Logged], [Level], [Message], [Logger], [Properties], [Callsite], [Exception]) VALUES (2040, N'DESKTOP-DUM6D15', CAST(N'2021-07-10T16:03:53.703' AS DateTime), N'Error', N'An unhandled exception has occurred while executing the request.', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware', N'EventId_Id=1|EventId_Name=UnhandledException|EventId=UnhandledException', N'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke', N'Microsoft.Data.SqlClient.SqlException (0x80131904): Invalid object name ''MembershipType''.
   at Microsoft.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at Microsoft.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at Microsoft.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at Microsoft.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at Microsoft.Data.SqlClient.SqlDataReader.get_MetaData()
   at Microsoft.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean isAsync, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry, String method)
   at Microsoft.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at Microsoft.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at OneFitnessVue.Data.Reporting.Queries.ReportingQueries.GetTopMembershipTypeInYear() in D:\Project_Sample\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Data\Reporting\Queries\ReportingQueries.cs:line 53
   at OneFitnessVue.Web.Areas.Service.Controllers.DashboardController.Dashboard() in D:\Project_Sample\OneVueFitness\OneFitnessVueSolution\OneFitnessVue.Web\Areas\Service\Controllers\DashboardController.cs:line 114
   at lambda_method46(Closure , Object , Object[] )
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
ClientConnectionId:0ab62a90-2b3c-495e-9dc9-4926ad99c0a7
Error Number:208,State:1,Class:16')
GO
SET IDENTITY_INSERT [dbo].[NLog] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentDetails] ON 
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (1, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-23T00:00:00.000' AS DateTime), CAST(N'2021-06-23T11:43:31.747' AS DateTime), 2, NULL, NULL, N'A', 1, 1, 1, CAST(12000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(13200.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV174NOAOMFXPU1', CAST(1200.00 AS Decimal(18, 2)), N'NW', 1)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (2, CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2021-12-24T00:00:00.000' AS DateTime), CAST(N'2021-12-24T00:00:00.000' AS DateTime), CAST(N'2021-06-23T11:43:31.730' AS DateTime), 2, CAST(N'2021-07-01T18:54:18.720' AS DateTime), 2, N'A', 2, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV1749IUPYE4XJ8', CAST(700.00 AS Decimal(18, 2)), N'NW', 2)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (3, CAST(N'2021-06-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), CAST(N'2021-06-23T15:06:14.340' AS DateTime), 2, CAST(N'2021-06-30T15:10:51.853' AS DateTime), NULL, N'A', 3, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV174TJH8F6RLTM', CAST(700.00 AS Decimal(18, 2)), N'RF', 3)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (4, CAST(N'2022-06-24T00:00:00.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), CAST(N'2021-06-27T16:03:09.897' AS DateTime), 2, NULL, NULL, N'A', 1, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV174NOAOMFXPU1', CAST(700.00 AS Decimal(18, 2)), N'RF', 4)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (5, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T15:33:08.213' AS DateTime), 2, NULL, NULL, N'A', 4, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV181X06ESVBSQ6', CAST(700.00 AS Decimal(18, 2)), N'NW', 5)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (6, CAST(N'2021-12-31T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T15:34:42.040' AS DateTime), 2, NULL, NULL, N'A', 4, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV181X06ESVBSQ6', CAST(700.00 AS Decimal(18, 2)), N'RE', 6)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (10005, CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2021-07-01T18:30:27.673' AS DateTime), 2, NULL, NULL, N'A', 10004, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV182TCBRRKQQ7W', CAST(700.00 AS Decimal(18, 2)), N'NW', 7)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (10006, CAST(N'2021-07-02T00:00:00.000' AS DateTime), CAST(N'2022-07-02T00:00:00.000' AS DateTime), CAST(N'2022-07-02T00:00:00.000' AS DateTime), CAST(N'2021-07-02T19:10:47.950' AS DateTime), 2, NULL, NULL, N'A', 10005, 1, 1, CAST(12000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(13200.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV183BJCRWMUJEK', CAST(1200.00 AS Decimal(18, 2)), N'NW', 8)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (10007, CAST(N'2021-07-06T00:00:00.000' AS DateTime), CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2021-07-05T12:41:17.033' AS DateTime), 2, NULL, NULL, N'A', 10006, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV186JIKEIIUINS', CAST(700.00 AS Decimal(18, 2)), N'NW', 9)
GO
INSERT [dbo].[PaymentDetails] ([PaymentID], [PaymentFromdt], [PaymentTodt], [NextRenewalDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [RecStatus], [MemberID], [PaymentTypeId], [TaxId], [Amount], [TaxPercentage], [TotalAmount], [WorkOutId], [MembershipTypeId], [InstallmentId], [MemberNo], [TaxPercentageAmount], [ApplicationType], [InvoiceNo]) VALUES (10008, CAST(N'2021-07-08T00:00:00.000' AS DateTime), CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2021-07-08T14:41:04.407' AS DateTime), 2, NULL, NULL, N'A', 10007, 1, 1, CAST(7000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7700.00 AS Decimal(18, 2)), 1, 1, 1, N'OFV189AZ1GZYXBHD', CAST(700.00 AS Decimal(18, 2)), N'NW', 10)
GO
SET IDENTITY_INSERT [dbo].[PaymentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Reasons] ON 
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (1, N'NewsPaper')
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (2, N'Banner or Poster')
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (3, N'Friends')
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (4, N'Neighbour')
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (5, N'Social Media')
GO
INSERT [dbo].[Reasons] ([ReasonId], [ReasonName]) VALUES (6, N'No reference')
GO
SET IDENTITY_INSERT [dbo].[Reasons] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceiptHistory] ON 
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (1, CAST(N'2021-06-23T11:44:23.977' AS DateTime), 2, 14, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (2, CAST(N'2021-06-23T11:44:39.920' AS DateTime), 2, 14, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (3, CAST(N'2021-06-23T11:44:45.613' AS DateTime), 2, 14, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (4, CAST(N'2021-06-23T11:45:08.720' AS DateTime), 2, 1, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (5, CAST(N'2021-06-25T19:01:58.863' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (6, CAST(N'2021-06-25T19:12:17.153' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (7, CAST(N'2021-06-25T19:28:38.693' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (8, CAST(N'2021-06-25T19:28:38.693' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (9, CAST(N'2021-06-25T19:32:54.083' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10, CAST(N'2021-06-25T19:33:23.573' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (11, CAST(N'2021-06-25T19:33:28.817' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (12, CAST(N'2021-06-25T19:33:45.197' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (13, CAST(N'2021-06-25T19:44:28.030' AS DateTime), 2, 3, N'OFV174TJH8F6RLTM')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (14, CAST(N'2021-06-29T17:39:27.827' AS DateTime), 2, 1, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (15, CAST(N'2021-06-30T12:37:14.307' AS DateTime), 2, 4, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (16, CAST(N'2021-06-30T13:16:52.223' AS DateTime), 2, 4, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (17, CAST(N'2021-06-30T13:18:52.580' AS DateTime), 2, 4, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (18, CAST(N'2021-06-30T15:14:49.150' AS DateTime), 3, 1, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10014, CAST(N'2021-07-01T17:51:04.997' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10015, CAST(N'2021-07-01T18:57:50.047' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10016, CAST(N'2021-07-01T18:59:59.440' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10017, CAST(N'2021-07-01T19:00:03.413' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10018, CAST(N'2021-07-01T19:00:21.520' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10019, CAST(N'2021-07-01T19:00:59.727' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10020, CAST(N'2021-07-01T19:02:03.047' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10021, CAST(N'2021-07-01T19:02:13.943' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10022, CAST(N'2021-07-01T19:05:15.050' AS DateTime), 2, 0, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10023, CAST(N'2021-07-02T15:35:02.840' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10024, CAST(N'2021-07-02T17:37:10.800' AS DateTime), 2, 2, N'OFV1749IUPYE4XJ8')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10025, CAST(N'2021-07-02T17:44:02.257' AS DateTime), 2, 7, N'OFV182TCBRRKQQ7W')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10026, CAST(N'2021-07-02T17:45:08.673' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10027, CAST(N'2021-07-03T10:44:54.890' AS DateTime), 2, 1, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10028, CAST(N'2021-07-03T10:45:51.607' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10029, CAST(N'2021-07-04T19:26:26.953' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10030, CAST(N'2021-07-05T12:49:28.220' AS DateTime), 2, 9, N'OFV186JIKEIIUINS')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10031, CAST(N'2021-07-06T18:26:21.450' AS DateTime), 2, 8, N'OFV183BJCRWMUJEK')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10032, CAST(N'2021-07-06T19:23:22.830' AS DateTime), 2, 7, N'OFV182TCBRRKQQ7W')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10033, CAST(N'2021-07-07T12:57:09.860' AS DateTime), 2, 1, N'OFV174NOAOMFXPU1')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10034, CAST(N'2021-07-08T12:45:48.503' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (10035, CAST(N'2021-07-08T12:46:07.457' AS DateTime), 2, 5, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (20034, CAST(N'2021-07-08T13:07:57.627' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (20035, CAST(N'2021-07-08T13:12:37.307' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (20036, CAST(N'2021-07-08T13:15:05.723' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30034, CAST(N'2021-07-08T14:16:18.810' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30035, CAST(N'2021-07-08T14:37:39.457' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30036, CAST(N'2021-07-08T15:11:07.573' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30037, CAST(N'2021-07-08T15:12:39.920' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30038, CAST(N'2021-07-08T16:20:13.937' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
INSERT [dbo].[ReceiptHistory] ([ReceiptHistoryId], [CreatedOn], [CreatedBy], [InvoiceNo], [MemberNo]) VALUES (30039, CAST(N'2021-07-08T16:20:43.657' AS DateTime), 2, 6, N'OFV181X06ESVBSQ6')
GO
SET IDENTITY_INSERT [dbo].[ReceiptHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 
GO
INSERT [dbo].[UserMaster] ([UserId], [UserName], [FirstName], [LastName], [EmailId], [MobileNo], [Gender], [Status], [CreatedBy], [IsFirstLogin], [CreatedOn], [ModifiedOn], [IsFirstLoginDate], [PasswordHash], [ModifiedBy]) VALUES (1, N'superadmin', N'superadmin', N'superadmin', N'saihacksoft@gmail.com', N'9000000000', N'M', 1, 1, 0, CAST(N'2021-04-19T16:51:28.037' AS DateTime), NULL, CAST(N'2021-04-19T16:51:28.037' AS DateTime), N'b6bc7b58510319a151d168ba3d5aecb3ac0a9708d06dd930f37fbc89b6cdc697', NULL)
GO
INSERT [dbo].[UserMaster] ([UserId], [UserName], [FirstName], [LastName], [EmailId], [MobileNo], [Gender], [Status], [CreatedBy], [IsFirstLogin], [CreatedOn], [ModifiedOn], [IsFirstLoginDate], [PasswordHash], [ModifiedBy]) VALUES (2, N'demouser', N'Demouser', N'Demouser', N'demouser@OneFitnessVue.com', N'9000000000', N'M', 1, 1, 0, CAST(N'2021-05-06T17:19:14.723' AS DateTime), NULL, CAST(N'2021-04-19T16:51:28.037' AS DateTime), N'b6bc7b58510319a151d168ba3d5aecb3ac0a9708d06dd930f37fbc89b6cdc697', NULL)
GO
INSERT [dbo].[UserMaster] ([UserId], [UserName], [FirstName], [LastName], [EmailId], [MobileNo], [Gender], [Status], [CreatedBy], [IsFirstLogin], [CreatedOn], [ModifiedOn], [IsFirstLoginDate], [PasswordHash], [ModifiedBy]) VALUES (3, N'demoadmin', N'DemoAdmin', N'DemoAdmin', N'demouser1@OneFitnessVue.com', N'9000000000', N'M', 1, 1, 1, CAST(N'2021-05-06T17:27:18.157' AS DateTime), NULL, CAST(N'2021-04-19T16:51:28.037' AS DateTime), N'b6bc7b58510319a151d168ba3d5aecb3ac0a9708d06dd930f37fbc89b6cdc697', NULL)
GO
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
ALTER TABLE [dbo].[Enquiry] ADD  CONSTRAINT [DF_Enquiry_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[MemberRegistration] ADD  CONSTRAINT [DF_MemberRegistration_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_CreateDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_IsFirstLogin]  DEFAULT ((0)) FOR [IsFirstLogin]
GO
ALTER TABLE [dbo].[MenuMaster]  WITH CHECK ADD  CONSTRAINT [FK_MenuMaster_MenuCategory] FOREIGN KEY([MenuCategoryId])
REFERENCES [dbo].[MenuCategory] ([MenuCategoryId])
GO
ALTER TABLE [dbo].[MenuMaster] CHECK CONSTRAINT [FK_MenuMaster_MenuCategory]
GO
/****** Object:  StoredProcedure [dbo].[CSC_USP_UpdatePassword]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[CSC_USP_UpdatePassword]  
 @UserId  bigint  ,    
 @Password varchar(150)    
as    
begin    
    
Update [UserMaster]    
Set PasswordHash =@Password  
where  UserId= @UserId    
  
INSERT INTO Audit_ChangePasswordLog
           ([UserId]  
           ,[CreatedOn]  
           ,[CreatedBy])  
     VALUES  
           (@UserId  
           ,getdate()  
           ,@UserId)  
  
end    
    
GO
/****** Object:  StoredProcedure [dbo].[NLog_Procedure]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NLog_Procedure] (  
  @machineName nvarchar(200),  
  @logged datetime,  
  @level varchar(5),  
  @message nvarchar(max),  
  @logger nvarchar(300),  
  @properties nvarchar(max),  
  @callsite nvarchar(300),  
  @exception nvarchar(max)  
) AS  
BEGIN  
  INSERT INTO [dbo].[NLog] (  
    [MachineName],  
    [Logged],  
    [Level],  
    [Message],  
    [Logger],  
    [Properties],  
    [Callsite],  
    [Exception]  
  ) VALUES (  
    @machineName,  
    @logged,  
    @level,  
    @message,  
    @logger,  
    @properties,  
    @callsite,  
    @exception  
  )  
  
  end  
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetAllRenwalrecordsFromBetweenDate]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_GetAllRenwalrecordsFromBetweenDate]           
     @Paymentfromdt DATETIME = NULL          
 ,@Paymenttodt DATETIME = NULL          
AS          
BEGIN          
 IF (          
   @Paymentfromdt IS NOT NULL          
   AND @Paymenttodt IS NOT NULL          
   )          
 BEGIN          
  SELECT MR.MemberID          
   ,PaymentID          
   ,MR.FirstName + ' | ' + MR.LastName AS NAME          
   ,MR.Address          
   ,MR.MobileNo          
   ,MR.EmailID          
   ,MR.MemberNo          
    ,'6 Month' as InstallmentName            
             ,'Gym 6 Months' as MembershipTypeName            
             ,'GYM' as WorkOutName            
   ,CONVERT(VARCHAR, PD.PaymentFromdt, 103) AS JoiningDate          
   ,CONVERT(VARCHAR, PD.PaymentTodt, 103) AS RenewalDate          
   ,PD.TotalAmount          
            
  FROM PaymentDetails PD          
  Inner join MemberRegistration MR on PD.MemberID =MR.MemberId          
     WHERE CONVERT(VARCHAR(10), PaymentTodt, 126) between @Paymentfromdt and @Paymenttodt and PD.ApplicationType = 'RE'         
  ORDER BY PD.PaymentID DESC          
 END          
     
END 
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetNewInvoiceId]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_GetNewInvoiceId]    
@InvoiceId bigint out
as    
begin    
    declare @currentcounter bigint
	declare @Newcounter bigint
    set @currentcounter = ( select Top 1 Counter from InVoiceCounter)	
	set @Newcounter = @currentcounter + 1
	update InVoiceCounter
	set 
	Counter = @Newcounter
  
  Select @InvoiceId =@Newcounter

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetNewRegistrationDaily]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     
CREATE Proc [dbo].[Usp_GetNewRegistrationDaily]  
    
as    
begin    
    
      
SELECT count(1) as NewRegistration    
  FROM [OneFitnessVueDBSample].[dbo].[PaymentDetails] MR    
  WHERE  CONVERT(varchar,MR.CreatedOn,23) =  CONVERT(varchar,getdate(),23) and MR.ApplicationType = 'N'    
    
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetNewRegistrationMonthly]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Proc [dbo].[Usp_GetNewRegistrationMonthly]

as
begin

 
 declare @Year int
 declare @Month int
 
 SET @Year = DATEPART(YEAR, GETDATE())  
 SET @Month = DATEPART(Month, GETDATE())  
SELECT count(1) as NewRegistration
  FROM MemberRegistration MR
 
  WHERE DATEPART(MM, MR.CreatedOn) = @Month  
  AND DATEPART(YEAR, MR.CreatedOn) = @Year   

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetRecepitDetails]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetRecepitDetails]                
@MemberID bigint,                
@PaymentID bigint                
as                
begin                
                
select TOP 1                
MR.MemberNo                
       ,MR.FirstName                
    ,MR.MiddleName                
    ,MR.LastName                
      ,convert(varchar, P.PaymentFromdt, 103) as PaymentFromdt                
      ,convert(varchar, P.PaymentTodt, 103)as PaymentTodt                
      ,convert(varchar, P.NextRenewalDate, 103)as NextRenewalDate                
  ,'6 Month' as InstallmentName            
             ,'Gym 6 Months' as MembershipTypeName            
             ,'GYM' as WorkOutName               
   ,'Cash' as PaymentTypeName                
   , 10 as TaxRate                
   ,'155555555555' as IdentificationNo                
   ,'GST' as TaxType                
   ,P.Amount                
   ,P.TaxPercentage                
   ,P.TotalAmount                
   ,P.TaxPercentageAmount              
   ,case when P.ApplicationType = 'NW' then 'New' when P.ApplicationType = 'RE' then 'Renewed' when P.ApplicationType = 'RF' then 'Refund'end as ApplicationType          
   ,P.InvoiceNo
   ,UM.FirstName+' '+UM.LastName as CreatedBy
from PaymentDetails P                                       
Inner join MemberRegistration MR on P.MemberID =MR.MemberId                        
Inner join UserMaster UM on P.CreatedBy =UM.UserId
Where P.MemberID = @MemberID and P.PaymentID =@PaymentID                
Order by P.PaymentID desc                
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetRefundMonthly]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Usp_GetRefundMonthly]

as
begin

 
 declare @Year int
 declare @Month int
 
 SET @Year = DATEPART(YEAR, GETDATE())  
 SET @Month = DATEPART(Month, GETDATE())  
SELECT count(1) as REFUND
  FROM [OneFitnessVueDBSample].[dbo].[PaymentDetails] MR
  WHERE DATEPART(MM, MR.CreatedOn) = @Month  
  AND DATEPART(YEAR, MR.CreatedOn) = @Year   and MR.ApplicationType = 'RF'

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetRenewedMonthly]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetRenewedMonthly]

as
begin

 
 declare @Year int
 declare @Month int
 
 SET @Year = DATEPART(YEAR, GETDATE())  
 SET @Month = DATEPART(Month, GETDATE())  
SELECT count(1) as NewRegistration
  FROM [OneFitnessVueDBSample].[dbo].[PaymentDetails] MR
  WHERE DATEPART(MM, MR.CreatedOn) = @Month  
  AND DATEPART(YEAR, MR.CreatedOn) = @Year   and MR.ApplicationType = 'RE'

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetTopMembershipType]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_GetTopMembershipType]  
  
as  
begin  
  
declare @year int    
set @year = (select CASE WHEN MONTH(getdate()) > 10 THEN YEAR(getdate()) + 1 ELSE YEAR(getdate()) END)    
  
SELECT      
 COUNT(P.MemberID) AS TotalCount ,  
 'Gym 6 Months'  
FROM PaymentDetails P        
Inner join MemberRegistration MR on P.MemberID =MR.MemberId   
WHERE  ApplicationType='NW'AND DATEPART(yyyy, P.CreatedOn) = @year  

order by TotalCount desc  
  
end  
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetYearwiseNewMember]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetYearwiseNewMember]                 
--exec Usp_GetYearwiseNewMember 2021                
              
as                
                
begin          
                
                
declare @leap char(3)          
declare @totalsum int        
          
declare @mm bigint          
declare @year int        
set @year = (select CASE WHEN MONTH(getdate()) > 10 THEN YEAR(getdate()) + 1 ELSE YEAR(getdate()) END)        
declare @year1 bigint          
          
SET @mm = (SELECT          
 DATEPART(MM, GETDATE()))          
          
if(@mm = 1)          
begin          
SET @year1 = @year + 1          
          
          
end          
          
          
          
SET @leap = (SELECT          
 CASE          
  WHEN (@YEAR % 4 = 0 AND @YEAR % 100 <> 0) OR @YEAR % 400 = 0 THEN 'YES' ELSE 'NO'          
 END AS LeapYear)          
          
declare @mainsum4 int          
declare @mainsum5 int          
declare @mainsum6 int          
declare @mainsum7 int          
declare @mainsum8 int          
declare @mainsum9 int          
declare @mainsum10 int          
declare @mainsum11 int          
declare @mainsum12 int          
declare @mainsum3 int          
declare @mainsum2 int          
declare @mainsum1 int          
               
Declare @total bigint          
          
SET @mainsum4 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE  ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126)          
BETWEEN (CONVERT(varchar, @year) + '-04-01') AND (CONVERT(varchar, @year) + '-04-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year)          
          
          
SET @mainsum5 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-05-01') AND (CONVERT(varchar, @year) + '-05-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
          
SET @mainsum6 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-06-01') AND (CONVERT(varchar, @year) + '-06-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum7 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-07-01') AND (CONVERT(varchar, @year) + '-07-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum8 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-08-01') AND (CONVERT(varchar, @year) + '-08-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum9 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-09-01') AND (CONVERT(varchar, @year) + '-09-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum10 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-10-01') AND (CONVERT(varchar, @year) + '-10-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum11 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-11-01') AND (CONVERT(varchar, @year) + '-11-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum12 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-12-01') AND (CONVERT(varchar, @year) + '-12-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum3 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-01-01') AND (CONVERT(varchar, @year1) + '-01-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
          
           
           
          
if(@leap ='NO')          
begin          
SET @mainsum2 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-02-01') AND (CONVERT(varchar, @year1) + '-02-28')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
end          
          
if(@leap ='YES')          
begin          
SET @mainsum2 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-02-01') AND (CONVERT(varchar, @year1) + '-02-29')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
end          
          
          
SET @mainsum1 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='NW' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-03-01') AND (CONVERT(varchar, @year1) + '-03-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year1) ---may          
          
          
SET @totalsum = (ISNULL(@mainsum4, 0) +          
ISNULL(@mainsum5, 0) +          
ISNULL(@mainsum6, 0) +          
ISNULL(@mainsum7, 0) +          
ISNULL(@mainsum8, 0) +          
ISNULL(@mainsum9, 0) +          
ISNULL(@mainsum10, 0) +          
ISNULL(@mainsum11, 0) +          
ISNULL(@mainsum12, 0) +          
ISNULL(@mainsum1, 0) +          
ISNULL(@mainsum2, 0) +          
ISNULL(@mainsum3, 0))          
          
SELECT          
 isnull(@mainsum4,0) AS april,          
  isnull(@mainsum5,0) AS may,          
  isnull(@mainsum6,0) AS june,          
  isnull(@mainsum7,0) AS july,          
  isnull(@mainsum8,0) AS august,          
  isnull(@mainsum9,0) AS sept,          
  isnull(@mainsum10,0) AS oct,          
  isnull(@mainsum11,0) AS nov,          
  isnull(@mainsum12,0) AS dec,          
  isnull(@mainsum3,0) AS jan,          
  isnull(@mainsum2,0) AS feb,          
  isnull(@mainsum1,0) AS march        
         
          
end   
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetYearwiseRenewedMember]    Script Date: 10-07-2021 5.50.09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetYearwiseRenewedMember]                 
--exec Usp_GetYearwiseRenewedMember                      
as                
                
begin          
                
                
declare @leap char(3)          
declare @totalsum int        
          
declare @mm bigint          
declare @year int        
set @year = (select CASE WHEN MONTH(getdate()) > 10 THEN YEAR(getdate()) + 1 ELSE YEAR(getdate()) END)        
declare @year1 bigint          
          
SET @mm = (SELECT          
 DATEPART(MM, GETDATE()))          
          
if(@mm = 1)          
begin          
SET @year1 = @year + 1          
          
          
end          
          
          
          
SET @leap = (SELECT          
 CASE          
  WHEN (@YEAR % 4 = 0 AND @YEAR % 100 <> 0) OR @YEAR % 400 = 0 THEN 'YES' ELSE 'NO'          
 END AS LeapYear)          
          
declare @mainsum4 int          
declare @mainsum5 int          
declare @mainsum6 int          
declare @mainsum7 int          
declare @mainsum8 int          
declare @mainsum9 int          
declare @mainsum10 int          
declare @mainsum11 int          
declare @mainsum12 int          
declare @mainsum3 int          
declare @mainsum2 int          
declare @mainsum1 int          
               
Declare @total bigint          
          
SET @mainsum4 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE  ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126)          
BETWEEN (CONVERT(varchar, @year) + '-04-01') AND (CONVERT(varchar, @year) + '-04-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year)          
          
          
SET @mainsum5 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-05-01') AND (CONVERT(varchar, @year) + '-05-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
          
SET @mainsum6 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-06-01') AND (CONVERT(varchar, @year) + '-06-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum7 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-07-01') AND (CONVERT(varchar, @year) + '-07-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum8 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-08-01') AND (CONVERT(varchar, @year) + '-08-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum9 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-09-01') AND (CONVERT(varchar, @year) + '-09-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum10 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-10-01') AND (CONVERT(varchar, @year) + '-10-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum11 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-11-01') AND (CONVERT(varchar, @year) + '-11-30')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum12 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year) + '-12-01') AND (CONVERT(varchar, @year) + '-12-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year) ---may          
          
SET @mainsum3 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-01-01') AND (CONVERT(varchar, @year1) + '-01-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
          
           
           
          
if(@leap ='NO')          
begin          
SET @mainsum2 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-02-01') AND (CONVERT(varchar, @year1) + '-02-28')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
end          
          
if(@leap ='YES')          
begin          
SET @mainsum2 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-02-01') AND (CONVERT(varchar, @year1) + '-02-29')          
AND DATEPART(yyyy, M.CreatedOn) = @year1)          
 ---may          
end          
          
          
SET @mainsum1 = (SELECT          
 COUNT(MemberID) AS Total          
FROM PaymentDetails M          
WHERE ApplicationType='RE' and CONVERT(varchar(10), M.CreatedOn, 126) BETWEEN (CONVERT(varchar, @year1) + '-03-01') AND (CONVERT(varchar, @year1) + '-03-31')          
AND DATEPART(yyyy, M.CreatedOn) = @year1) ---may          
          
          
SET @totalsum = (ISNULL(@mainsum4, 0) +          
ISNULL(@mainsum5, 0) +          
ISNULL(@mainsum6, 0) +          
ISNULL(@mainsum7, 0) +          
ISNULL(@mainsum8, 0) +          
ISNULL(@mainsum9, 0) +          
ISNULL(@mainsum10, 0) +          
ISNULL(@mainsum11, 0) +          
ISNULL(@mainsum12, 0) +          
ISNULL(@mainsum1, 0) +          
ISNULL(@mainsum2, 0) +          
ISNULL(@mainsum3, 0))          
          
SELECT          
        
 isnull(@mainsum4,0) AS april,          
  isnull(@mainsum5,0) AS may,          
  isnull(@mainsum6,0) AS june,          
  isnull(@mainsum7,0) AS july,          
  isnull(@mainsum8,0) AS august,          
  isnull(@mainsum9,0) AS sept,          
  isnull(@mainsum10,0) AS oct,          
  isnull(@mainsum11,0) AS nov,          
  isnull(@mainsum12,0) AS dec,          
  isnull(@mainsum3,0) AS jan,          
  isnull(@mainsum2,0) AS feb,          
  isnull(@mainsum1,0) AS march        
        
          
end   
GO
