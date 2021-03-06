USE [Com_ymkdjubao]
GO
/****** Object:  Table [dbo].[banner]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banner](
	[id] [varchar](36) NOT NULL,
	[name] [nvarchar](50) NULL,
	[img_url] [varchar](255) NULL,
	[sort_id] [int] NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Member_ID] [varchar](36) NOT NULL,
	[Member_Num] [varchar](50) NULL,
	[Member_Name] [varchar](50) NULL,
	[Member_Phone] [int] NULL,
	[Member_Sex] [varchar](50) NULL,
	[Member_Birthday] [datetime] NULL,
	[Member_Photo] [varchar](200) NULL,
	[Member_UserID] [uniqueidentifier] NULL,
	[Member_Introduce] [text] NULL,
	[Member_FilePath] [varchar](200) NULL,
	[Member_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Member_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id] [varchar](36) NOT NULL,
	[number] [varchar](20) NULL,
	[full_name] [nvarchar](20) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](150) NULL,
	[company] [nvarchar](100) NULL,
	[department] [nvarchar](50) NULL,
	[report_object] [nvarchar](50) NULL,
	[resign] [nvarchar](50) NULL,
	[job_number] [nvarchar](50) NULL,
	[contents] [nvarchar](500) NULL,
	[insider] [nvarchar](50) NULL,
	[remark] [nvarchar](100) NULL,
	[remark_time] [datetime] NULL,
	[status] [int] NOT NULL,
	[interactive_switch] [int] NOT NULL,
	[interactive_switch_reason] [nvarchar](100) NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_file]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_file](
	[id] [varchar](36) NOT NULL,
	[report_id] [varchar](36) NOT NULL,
	[file_name] [nvarchar](100) NULL,
	[file_url] [varchar](200) NULL,
	[created_time] [datetime] NULL,
	[updated_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_interaction]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_interaction](
	[id] [varchar](36) NOT NULL,
	[report_id] [varchar](36) NOT NULL,
	[contents] [nvarchar](500) NULL,
	[type] [int] NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_interaction_file]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_interaction_file](
	[id] [varchar](36) NOT NULL,
	[report_interaction_id] [varchar](36) NOT NULL,
	[file_name] [nvarchar](100) NULL,
	[file_url] [varchar](200) NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[site_message]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_message](
	[id] [varchar](36) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[contents] [nvarchar](500) NULL,
	[remarks] [nvarchar](100) NULL,
	[remarks_time] [datetime] NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Function]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Function](
	[Function_ID] [varchar](36) NOT NULL,
	[Function_Num] [varchar](50) NULL,
	[Function_Name] [varchar](50) NULL,
	[Function_ByName] [varchar](50) NULL,
	[Function_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Function] PRIMARY KEY CLUSTERED 
(
	[Function_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Menu_ID] [varchar](36) NOT NULL,
	[Menu_Num] [varchar](50) NULL,
	[Menu_Name] [varchar](50) NULL,
	[Menu_Url] [varchar](50) NULL,
	[Menu_Icon] [varchar](50) NULL,
	[Menu_ParentID] [varchar](36) NULL,
	[Menu_IsShow] [int] NULL,
	[Menu_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_MenuFunction]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_MenuFunction](
	[MenuFunction_ID] [varchar](36) NOT NULL,
	[MenuFunction_MenuID] [varchar](36) NULL,
	[MenuFunction_FunctionID] [varchar](36) NULL,
	[MenuFunction_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_MenuFunction] PRIMARY KEY CLUSTERED 
(
	[MenuFunction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Number]    Script Date: 2019/5/30 10:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Number](
	[Number_ID] [varchar](36) NOT NULL,
	[Number_Num] [varchar](50) NULL,
	[Number_DataBase] [varchar](50) NULL,
	[Number_TableName] [varchar](50) NULL,
	[Number_NumField] [varchar](50) NULL,
	[Number_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Number] PRIMARY KEY CLUSTERED 
(
	[Number_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Role](
	[Role_ID] [varchar](36) NOT NULL,
	[Role_Num] [varchar](50) NULL,
	[Role_Name] [varchar](50) NULL,
	[Role_Remark] [varchar](500) NULL,
	[Role_IsDelete] [int] NULL,
	[Role_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_RoleMenuFunction]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_RoleMenuFunction](
	[RoleMenuFunction_ID] [varchar](36) NOT NULL,
	[RoleMenuFunction_RoleID] [varchar](36) NULL,
	[RoleMenuFunction_FunctionID] [varchar](36) NULL,
	[RoleMenuFunction_MenuID] [varchar](36) NULL,
	[RoleMenuFunction_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_RoleMenuFunction] PRIMARY KEY CLUSTERED 
(
	[RoleMenuFunction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[User_ID] [varchar](36) NOT NULL,
	[User_Name] [varchar](50) NULL,
	[User_LoginName] [varchar](50) NULL,
	[User_Pwd] [varchar](100) NULL,
	[User_Email] [varchar](50) NULL,
	[User_IsDelete] [int] NULL,
	[User_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserRole]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserRole](
	[UserRole_ID] [varchar](36) NOT NULL,
	[UserRole_UserID] [varchar](36) NULL,
	[UserRole_RoleID] [varchar](36) NULL,
	[UserRole_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_log]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_log](
	[id] [varchar](36) NOT NULL,
	[modular] [varchar](50) NULL,
	[contents] [nvarchar](200) NULL,
	[reason] [nvarchar](100) NULL,
	[operator] [nvarchar](50) NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_sys_user_role]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_sys_user_role]
AS
SELECT   dbo.Sys_User.User_ID, dbo.Sys_User.User_Name, dbo.Sys_User.User_LoginName, dbo.Sys_User.User_Pwd, 
                dbo.Sys_User.User_Email, dbo.Sys_User.User_IsDelete, dbo.Sys_User.User_CreateTime, dbo.Sys_Role.Role_Name, 
                dbo.Sys_Role.Role_Remark, dbo.Sys_UserRole.UserRole_UserID, dbo.Sys_UserRole.UserRole_RoleID, 
                dbo.Sys_UserRole.UserRole_ID, dbo.Sys_Role.Role_Num, dbo.Sys_Role.Role_ID, dbo.Sys_Role.Role_IsDelete
FROM      dbo.Sys_Role RIGHT OUTER JOIN
                dbo.Sys_UserRole ON dbo.Sys_Role.Role_ID = dbo.Sys_UserRole.UserRole_RoleID RIGHT OUTER JOIN
                dbo.Sys_User ON dbo.Sys_UserRole.UserRole_UserID = dbo.Sys_User.User_ID
GO
/****** Object:  View [dbo].[view_sys_user_role_function]    Script Date: 2019/5/30 10:19:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_sys_user_role_function]
AS
SELECT   dbo.Sys_Function.Function_ByName, dbo.Sys_Menu.Menu_Num, 
                dbo.Sys_RoleMenuFunction.RoleMenuFunction_RoleID
FROM      dbo.Sys_RoleMenuFunction LEFT OUTER JOIN
                dbo.Sys_Menu ON 
                dbo.Sys_RoleMenuFunction.RoleMenuFunction_MenuID = dbo.Sys_Menu.Menu_ID LEFT OUTER JOIN
                dbo.Sys_Function ON dbo.Sys_RoleMenuFunction.RoleMenuFunction_FunctionID = dbo.Sys_Function.Function_ID
GO
INSERT [dbo].[Member] ([Member_ID], [Member_Num], [Member_Name], [Member_Phone], [Member_Sex], [Member_Birthday], [Member_Photo], [Member_UserID], [Member_Introduce], [Member_FilePath], [Member_CreateTime]) VALUES (N'9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E', N'1', N'测试会员', 131231, N'男', CAST(N'2018-04-25T00:00:00.000' AS DateTime), N'/Content/UpFile/51446921-6121-4a53-b5f3-4ef26c1f82e0.jpg', N'a7eae7ab-0de4-4026-8da9-6529f8a1c3e2', N'<p><img src="/Admin/lib/nUeditor/upload/image/20180802/6366881296663732469581226.jpg" alt="p_big3.jpg"/></p>', N'/Content/UpFile/fc0ef283-b8c1-4fcf-851c-51141a2be661.txt', CAST(N'2018-04-25T23:00:06.637' AS DateTime))
INSERT [dbo].[Member] ([Member_ID], [Member_Num], [Member_Name], [Member_Phone], [Member_Sex], [Member_Birthday], [Member_Photo], [Member_UserID], [Member_Introduce], [Member_FilePath], [Member_CreateTime]) VALUES (N'9F722F6F-24D9-4CCF-A387-CD3E939EDF4C', N'2', N'test', 23213, N'男', CAST(N'2018-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'<p>12313撒旦发射点</p>', NULL, CAST(N'2018-08-20T10:46:20.153' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'2401F4D0-60B0-4E2E-903F-84C603373572', N'70', N'导出', N'GetExcel', CAST(N'2017-02-09T16:34:14.017' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'383E7EE2-7690-46AC-9230-65155C84AA30', N'50', N'保存', N'Save', CAST(N'2017-04-22T13:51:52.837' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'9C388461-2704-4C5E-A729-72C17E9018E1', N'40', N'删除', N'Delete', CAST(N'2016-06-20T13:40:52.360' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'20', N'添加', N'Add', CAST(N'2016-06-20T13:40:36.787' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'C9518758-B2E1-4F51-B517-5282E273889C', N'10', N'能否拥有该菜单', N'Have', CAST(N'2016-06-20T13:40:29.657' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'30', N'修改', N'Edit', CAST(N'2016-06-20T13:40:43.153' AS DateTime))
INSERT [dbo].[Sys_Function] ([Function_ID], [Function_Num], [Function_Name], [Function_ByName], [Function_CreateTime]) VALUES (N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'60', N'检索', N'Search', CAST(N'2017-02-16T17:06:23.430' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'1EC76C4C-B9B3-4517-9854-F08CD11D653D', N'A', N'基础信息', NULL, N'fa fa-cubes', NULL, 1, CAST(N'2018-04-25T21:18:09.403' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'Z-100', N'用户管理', N'/Admin/User/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:18:03.657' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'4CE21A81-1CAE-44D2-B29E-07058FF04B3E', N'Z-160', N'代码创建', N'/Admin/CreateCode/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:17:32.723' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'60AE9382-31AB-4276-A379-D3876E9BB783', N'Z-110', N'角色管理', N'/Admin/Role/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:18:55.290' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'A-100', N'会员管理', N'/Admin/Member/Index?id=1', NULL, N'1EC76C4C-B9B3-4517-9854-F08CD11D653D', 1, CAST(N'2018-04-25T21:36:28.533' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'9591F249-1471-44F7-86B5-6FDAE8B93888', N'Z', N'系统管理', NULL, N'fa fa-desktop', NULL, 1, CAST(N'2018-03-10T12:16:38.890' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'BD024F3A-99A7-4407-861C-A016F243F222', N'Z-140', N'角色功能', N'/Admin/RoleFunction/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:18:46.617' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'D721FC55-2174-40EB-BB37-5C54A158525A', N'Z-120', N'功能管理', N'/Admin/Function/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:18:21.087' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'Z-130', N'菜单功能', N'/Admin/MenuFunction/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:18:33.997' AS DateTime))
INSERT [dbo].[Sys_Menu] ([Menu_ID], [Menu_Num], [Menu_Name], [Menu_Url], [Menu_Icon], [Menu_ParentID], [Menu_IsShow], [Menu_CreateTime]) VALUES (N'F35D64AE-ECB7-4D06-ACFB-D91595966D9E', N'Z-150', N'修改密码', N'/Admin/ChangePwd/Index', NULL, N'9591F249-1471-44F7-86B5-6FDAE8B93888', 1, CAST(N'2018-03-10T12:17:03.810' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'07C2FE76-789A-4D8F-BCE4-86CCC0402911', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-09T19:05:40.507' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'0E413B56-6A4C-4C0D-A9D4-0825FE718000', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-10T10:53:10.480' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'10C6101E-D148-4D4C-8CAD-14CE82B217DB', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'2401F4D0-60B0-4E2E-903F-84C603373572', CAST(N'2019-01-08T17:31:13.393' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'1D946995-6EB5-4B79-9B37-A8E982A53C57', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-08T17:31:13.393' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'202074C0-EEA0-4CA0-880B-EB4A63AB259F', N'BD024F3A-99A7-4407-861C-A016F243F222', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-09T19:06:12.033' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'22F42CCB-C207-471A-B53F-ACBFBC8A5EB9', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:07:20.670' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'2D8D27B1-E7D7-4A51-A32D-D12EFBC15AE9', N'9591F249-1471-44F7-86B5-6FDAE8B93888', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-08T18:04:12.180' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'4FF46A79-DE87-4E71-A7A8-2122D495193E', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:05:53.180' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'5ACE268B-B027-41A4-AAF7-D4F2E61311C9', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-08T17:31:13.210' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'61F0E9AF-9597-4E47-80FB-7DD9C2552F0E', N'4CE21A81-1CAE-44D2-B29E-07058FF04B3E', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:06:28.510' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'749729EB-978E-4966-9A36-57F8D2A05270', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-09T19:05:53.180' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'7781D4CC-F8AF-4B1E-B19E-64AF640B8F1C', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-09T19:05:53.180' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'7861B618-0B12-4A56-ABDA-A5E8D17AC5D7', N'2FF9BB67-AA42-48CF-80C9-6D1CFB6B1EAD', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2018-06-28T11:30:09.723' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'7B35A10A-6A54-43C0-986F-0F8FE5A8917D', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-08T17:31:13.390' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'836FCEC0-F9B7-4F5E-8ED9-2D17EBF710D0', N'BD024F3A-99A7-4407-861C-A016F243F222', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-09T19:06:12.033' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'847AE3DF-CEE2-4466-A32D-5FDA36C060AD', N'BD024F3A-99A7-4407-861C-A016F243F222', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-09T19:06:12.037' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'8551A032-F979-40AA-8C98-D77551871247', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-08T17:31:13.393' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'8A94AC55-20F1-4030-9E6E-252F1D81AB05', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-10T10:53:10.480' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'8D4E954E-AA6B-41D6-8985-CD28766F29F8', N'1EC76C4C-B9B3-4517-9854-F08CD11D653D', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-08T18:04:07.737' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'8F7A00EB-C608-4477-9702-5CA20FE097E8', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-10T10:53:10.483' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'943AE56B-C321-4D57-86F1-9F3BBA7FB824', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-09T19:07:20.673' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'979542E7-98E0-439C-B110-4E9817C13B90', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:05:53.177' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'985006AA-A95D-440E-9928-4DCC55084E74', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-09T19:05:53.177' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'99C0708E-A4AF-4A7E-B8C5-5B120BDE85CC', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:05:40.240' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'9C377900-351E-404C-AA7B-08E5120B976A', N'BD024F3A-99A7-4407-861C-A016F243F222', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-09T19:06:12.033' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'9D685529-9601-4454-931A-016DBCBFAC54', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2019-01-09T19:07:20.673' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'9E874B1E-D908-40C3-A0C2-3A78C1EEA5CF', N'4CE21A81-1CAE-44D2-B29E-07058FF04B3E', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:06:28.510' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'A1F6E01A-65D7-4B68-9254-C31FD52EFA97', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-09T19:07:20.673' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'B2D60366-7726-429A-BB6C-781EF131AA53', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:05:40.507' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'B4D748B7-F21E-4D9B-8E74-E54F059AAAD8', N'D721FC55-2174-40EB-BB37-5C54A158525A', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-09T19:05:53.180' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'BB14769D-4760-4341-9FAF-9FA82EEADA65', N'2FF9BB67-AA42-48CF-80C9-6D1CFB6B1EAD', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', CAST(N'2018-06-28T11:30:09.723' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'BEE43B2C-0AED-4751-B184-026F1474F2CC', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-09T19:05:40.507' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'BF4C8454-C6B0-4826-9275-77676E2503CE', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-10T10:53:10.483' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'C00522B9-AF7D-4424-9FAB-AF920206B1BF', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-08T17:31:13.393' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'C2D0FD0F-77CB-4964-929A-428D27A3F8D8', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-09T19:05:40.510' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'C3C5A9BA-7928-4465-85E2-8FD44931C353', N'F35D64AE-ECB7-4D06-ACFB-D91595966D9E', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:06:21.347' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'CCC73748-BA19-488E-9137-FF59CE6A481A', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-10T10:53:10.300' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'DE247CD3-0CA6-4724-B3F5-84B8B095E7DA', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', N'9C388461-2704-4C5E-A729-72C17E9018E1', CAST(N'2019-01-09T19:05:40.507' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'E8F73A45-F06A-4748-A27F-EFBFB2AD9414', N'F35D64AE-ECB7-4D06-ACFB-D91595966D9E', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:06:21.347' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'EAE82607-9D18-48DD-A168-EDE9DAB9CC20', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:07:20.673' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'EDEF6B11-C46E-4B92-9355-C07277B2E20A', N'60AE9382-31AB-4276-A379-D3876E9BB783', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-10T10:53:10.480' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'F2CDD648-0223-4399-9F44-23D6AEF084B1', N'BD024F3A-99A7-4407-861C-A016F243F222', N'383E7EE2-7690-46AC-9230-65155C84AA30', CAST(N'2019-01-09T19:06:12.037' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'F7F7A920-C512-48C0-ACB4-8430DB8829F3', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', CAST(N'2019-01-08T17:31:13.390' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'FA2E367D-5307-4A49-A15E-079D74D1B4F8', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', CAST(N'2019-01-09T19:07:20.673' AS DateTime))
INSERT [dbo].[Sys_MenuFunction] ([MenuFunction_ID], [MenuFunction_MenuID], [MenuFunction_FunctionID], [MenuFunction_CreateTime]) VALUES (N'FF85BB1D-72C1-4D62-8503-6622FF6A14CC', N'BD024F3A-99A7-4407-861C-A016F243F222', N'C9518758-B2E1-4F51-B517-5282E273889C', CAST(N'2019-01-09T19:06:12.033' AS DateTime))
INSERT [dbo].[Sys_Number] ([Number_ID], [Number_Num], [Number_DataBase], [Number_TableName], [Number_NumField], [Number_CreateTime]) VALUES (N'B5FCC999-85B9-4DCE-A3FC-64B43EF82F68', N'1', NULL, N'Member', N'Member_Num', CAST(N'2018-04-25T23:00:03.723' AS DateTime))
INSERT [dbo].[Sys_Role] ([Role_ID], [Role_Num], [Role_Name], [Role_Remark], [Role_IsDelete], [Role_CreateTime]) VALUES (N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', N'0001', N'超级管理员', N'拥有所有权限', 2, CAST(N'2016-06-20T10:20:10.073' AS DateTime))
INSERT [dbo].[Sys_Role] ([Role_ID], [Role_Num], [Role_Name], [Role_Remark], [Role_IsDelete], [Role_CreateTime]) VALUES (N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'0002', N'普通用户', NULL, 1, CAST(N'2016-07-06T17:59:20.527' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'094E39B4-EEFA-490E-8867-636CDA3B0FD8', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'D721FC55-2174-40EB-BB37-5C54A158525A', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'1161D90B-C50F-4A88-918E-E6DE5DAC6D50', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'383E7EE2-7690-46AC-9230-65155C84AA30', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'11B97A88-9D98-44A5-BF8C-755E9414131D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'12B74E73-807E-4D17-B9ED-55882CFBBAC3', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9C388461-2704-4C5E-A729-72C17E9018E1', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'180BD84C-AEFD-4C70-8CC2-E46C3EC24872', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'1B3E823E-5F23-44A5-9FC7-AA3D95E12B1C', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'383E7EE2-7690-46AC-9230-65155C84AA30', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'1E9465F9-51EB-4486-9682-086F57C8164D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'F35D64AE-ECB7-4D06-ACFB-D91595966D9E', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'214EAFD5-377C-4011-9408-71BE25052E45', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'238FEC64-92E7-4379-A97D-659AEDEB958D', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'2F276899-2DB5-4AC8-9CE2-F9280CD03223', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'311D233E-35FB-4C12-90ED-B2A0D4FC60B6', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'4CE21A81-1CAE-44D2-B29E-07058FF04B3E', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'37854E4B-C532-4170-A9B9-3109CA2765AE', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'45ADA741-89AB-4FC1-A2E3-81CF4C853BA6', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'6C3FB9B8-59FF-4750-831F-C0034BD54FCC', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2401F4D0-60B0-4E2E-903F-84C603373572', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'785F067E-F5E5-4398-965F-549CA761F329', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'383E7EE2-7690-46AC-9230-65155C84AA30', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'8A536D01-0D2C-45A1-9D9B-C33E8B627770', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'9208ADEF-0706-48CA-A1F5-FCF08C46285E', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'BD024F3A-99A7-4407-861C-A016F243F222', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'A5EB7934-AA19-4506-B92D-AEFEF45BE76C', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'E7EF2A05-8317-41C3-B588-99519FE88BF9', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'C614CDA0-7A7B-4FE3-8D2D-C3EB066BD3DC', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9C388461-2704-4C5E-A729-72C17E9018E1', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'C66B1EF6-80D7-4E59-A518-D54A336916DB', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'9C388461-2704-4C5E-A729-72C17E9018E1', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'E4740EB6-AFF4-42F9-84E6-F4646310114A', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'C9518758-B2E1-4F51-B517-5282E273889C', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'F19C82B5-8E4B-4019-B9D4-630FA35D9B18', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'F34FCB3A-2B10-4D03-B8B4-7E4AED2A9D22', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'F27ECB0A-197D-47B1-B243-59A8C71302BF', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'F445D8B3-6825-4D71-B3B4-4FE9B57275DE', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2401F4D0-60B0-4E2E-903F-84C603373572', N'38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'F4B5C25A-CDB6-4582-801F-5CA43D3E75D7', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'7C34C2FD-98ED-4655-AA04-BB00B915A751', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'F4CBD27B-A954-46A0-A272-43F96DE9E54C', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'2401F4D0-60B0-4E2E-903F-84C603373572', N'60AE9382-31AB-4276-A379-D3876E9BB783', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_RoleMenuFunction] ([RoleMenuFunction_ID], [RoleMenuFunction_RoleID], [RoleMenuFunction_FunctionID], [RoleMenuFunction_MenuID], [RoleMenuFunction_CreateTime]) VALUES (N'FCE46CFC-EC63-4584-906E-F1A2AF474BAF', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', N'BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD', N'E5D4DA6B-AAB0-4AAA-982F-43673E8152C0', CAST(N'2019-01-08T18:30:07.690' AS DateTime))
INSERT [dbo].[Sys_User] ([User_ID], [User_Name], [User_LoginName], [User_Pwd], [User_Email], [User_IsDelete], [User_CreateTime]) VALUES (N'0198459E-2034-4533-B843-5D227AD20740', N'管理员', N'admin', N'123', N'adinnet@adinnet.cn', 2, CAST(N'2017-04-06T19:55:53.083' AS DateTime))
INSERT [dbo].[Sys_User] ([User_ID], [User_Name], [User_LoginName], [User_Pwd], [User_Email], [User_IsDelete], [User_CreateTime]) VALUES (N'A7EAE7AB-0DE4-4026-8DA9-6529F8A1C3E2', N'普通用户', N'user', N'123', N'111', 1, CAST(N'2018-03-10T12:21:15.160' AS DateTime))
INSERT [dbo].[Sys_UserRole] ([UserRole_ID], [UserRole_UserID], [UserRole_RoleID], [UserRole_CreateTime]) VALUES (N'A0A38126-5C92-4881-94AD-D00D646C53FC', N'A7EAE7AB-0DE4-4026-8DA9-6529F8A1C3E2', N'40FF1844-C099-4061-98E0-CD6E544FCFD3', CAST(N'2018-12-25T18:07:54.507' AS DateTime))
INSERT [dbo].[Sys_UserRole] ([UserRole_ID], [UserRole_UserID], [UserRole_RoleID], [UserRole_CreateTime]) VALUES (N'AAD12748-CF95-4A43-8E7F-FAFC9BFB329B', N'0198459E-2034-4533-B843-5D227AD20740', N'18FA4771-6F58-46A3-80D2-6F0F5E9972E3', CAST(N'2018-08-02T16:19:08.610' AS DateTime))
ALTER TABLE [dbo].[banner] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[banner] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_Member_ID]  DEFAULT (newid()) FOR [Member_ID]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_Member_CreateTime]  DEFAULT (getdate()) FOR [Member_CreateTime]
GO
ALTER TABLE [dbo].[report] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[report] ADD  DEFAULT ((0)) FOR [interactive_switch]
GO
ALTER TABLE [dbo].[report] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[report] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[report_file] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[report_file] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[report_interaction] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[report_interaction] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[report_interaction] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[report_interaction_file] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[report_interaction_file] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[site_message] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[site_message] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[Sys_Function] ADD  CONSTRAINT [DF_Sys_Function_Function_ID]  DEFAULT (newid()) FOR [Function_ID]
GO
ALTER TABLE [dbo].[Sys_Function] ADD  CONSTRAINT [DF_Sys_Function_Function_CreateTime]  DEFAULT (getdate()) FOR [Function_CreateTime]
GO
ALTER TABLE [dbo].[Sys_Menu] ADD  CONSTRAINT [DF_Sys_Menu_Menu_ID]  DEFAULT (newid()) FOR [Menu_ID]
GO
ALTER TABLE [dbo].[Sys_Menu] ADD  CONSTRAINT [DF_Sys_Menu_Menu_CreateTime]  DEFAULT (getdate()) FOR [Menu_CreateTime]
GO
ALTER TABLE [dbo].[Sys_MenuFunction] ADD  CONSTRAINT [DF_Sys_MenuFunction_MenuFunction_ID]  DEFAULT (newid()) FOR [MenuFunction_ID]
GO
ALTER TABLE [dbo].[Sys_MenuFunction] ADD  CONSTRAINT [DF_Sys_MenuFunction_MenuFunction_CreateTime]  DEFAULT (getdate()) FOR [MenuFunction_CreateTime]
GO
ALTER TABLE [dbo].[Sys_Number] ADD  CONSTRAINT [DF_Sys_Number_Number_ID]  DEFAULT (newid()) FOR [Number_ID]
GO
ALTER TABLE [dbo].[Sys_Number] ADD  CONSTRAINT [DF_Sys_Number_Number_CreateTime]  DEFAULT (getdate()) FOR [Number_CreateTime]
GO
ALTER TABLE [dbo].[Sys_Role] ADD  CONSTRAINT [DF_Sys_Role_Role_ID]  DEFAULT (newid()) FOR [Role_ID]
GO
ALTER TABLE [dbo].[Sys_Role] ADD  CONSTRAINT [DF_Sys_Role_Role_CreateTime]  DEFAULT (getdate()) FOR [Role_CreateTime]
GO
ALTER TABLE [dbo].[Sys_RoleMenuFunction] ADD  CONSTRAINT [DF_Sys_RoleMenuFunction_RoleMenuFunction_ID]  DEFAULT (newid()) FOR [RoleMenuFunction_ID]
GO
ALTER TABLE [dbo].[Sys_RoleMenuFunction] ADD  CONSTRAINT [DF_Sys_RoleMenuFunction_RoleMenuFunction_CreateTime]  DEFAULT (getdate()) FOR [RoleMenuFunction_CreateTime]
GO
ALTER TABLE [dbo].[Sys_User] ADD  CONSTRAINT [DF_Sys_User_User_ID]  DEFAULT (newid()) FOR [User_ID]
GO
ALTER TABLE [dbo].[Sys_User] ADD  CONSTRAINT [DF_Sys_User_User_CreateTime]  DEFAULT (getdate()) FOR [User_CreateTime]
GO
ALTER TABLE [dbo].[Sys_UserRole] ADD  CONSTRAINT [DF_Sys_UserRole_UserRole_ID]  DEFAULT (newid()) FOR [UserRole_ID]
GO
ALTER TABLE [dbo].[Sys_UserRole] ADD  CONSTRAINT [DF_Sys_UserRole_UserRole_CreateTime]  DEFAULT (getdate()) FOR [UserRole_CreateTime]
GO
ALTER TABLE [dbo].[system_log] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[system_log] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  StoredProcedure [dbo].[GetNumber]    Script Date: 2019/5/30 10:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNumber]
	@numfield varchar(50),--varchar(8000),         --字段名
    @tablename varchar(50)              --表名
AS
BEGIN
	DECLARE @Number int = 0
	select @Number=Number_Num from Sys_Number where Number_TableName=@tablename and Number_NumField=@numfield
    IF @Number=0 BEGIN
		insert into Sys_Number(Number_TableName,Number_NumField,Number_Num) values(@tablename,@numfield,1)
		select 1
	END
	ELSE BEGIN
		update Sys_Number set Number_Num = @Number +1 where Number_TableName=@tablename and Number_NumField=@numfield
		select (@Number +1)
	END
END





GO
/****** Object:  StoredProcedure [dbo].[PROC_SPLITPAGE]    Script Date: 2019/5/30 10:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------系统的--------------
CREATE  PROCEDURE [dbo].[PROC_SPLITPAGE]
    @SQL text,--varchar(8000),         --要执行的SQL语句
    @PAGE INT = 1,              --要显示的页码
    @PAGESIZE INT,              --每页的大小
    @PAGECOUNT INT = 0 OUT,     --总页数
    @RECORDCOUNT INT = 0 OUT    --总记录数
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @P1 INT

    EXEC SP_CURSOROPEN @P1 OUTPUT, @SQL, @SCROLLOPT = 1, @CCOPT = 1, @ROWCOUNT = @PAGECOUNT OUTPUT

    SET @RECORDCOUNT = @PAGECOUNT

    SELECT @PAGECOUNT=
        CEILING(1.0 * @PAGECOUNT / @PAGESIZE) , @PAGE = (@PAGE-1) * @PAGESIZE + 1

    EXEC SP_CURSORFETCH @P1, 16, @PAGE, @PAGESIZE 

    EXEC SP_CURSORCLOSE @P1
END





GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'banner名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序（数字越大越靠前）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'banner表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'banner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'full_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报对象' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'report_object'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'resign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'job_number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关知情人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'insider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'remark_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-提交举报、1-举报处理、2-处理完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'互动开关（0-开、1-关）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'interactive_switch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'互动开关原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'interactive_switch_reason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报附件表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'report_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'file_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报附件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_file'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'report_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（0-举报人发布、1-举报中心发布）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报互动表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'举报互动id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'report_interaction_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'file_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'report_interaction_file', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'full_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'remarks_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点留言表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'site_message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function', @level2type=N'COLUMN',@level2name=N'Function_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function', @level2type=N'COLUMN',@level2name=N'Function_Num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function', @level2type=N'COLUMN',@level2name=N'Function_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能英文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function', @level2type=N'COLUMN',@level2name=N'Function_ByName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function', @level2type=N'COLUMN',@level2name=N'Function_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台功能表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Function'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_Num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示（1:是 2：否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu', @level2type=N'COLUMN',@level2name=N'Menu_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFunction', @level2type=N'COLUMN',@level2name=N'MenuFunction_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFunction', @level2type=N'COLUMN',@level2name=N'MenuFunction_MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFunction', @level2type=N'COLUMN',@level2name=N'MenuFunction_FunctionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFunction', @level2type=N'COLUMN',@level2name=N'MenuFunction_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台菜单功能绑定表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_Num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可删除（1：是 2：否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Role_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction', @level2type=N'COLUMN',@level2name=N'RoleMenuFunction_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction', @level2type=N'COLUMN',@level2name=N'RoleMenuFunction_RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction', @level2type=N'COLUMN',@level2name=N'RoleMenuFunction_FunctionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction', @level2type=N'COLUMN',@level2name=N'RoleMenuFunction_MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction', @level2type=N'COLUMN',@level2name=N'RoleMenuFunction_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台权限菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleMenuFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可删除（1：是 2：否）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'User_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRole', @level2type=N'COLUMN',@level2name=N'UserRole_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRole', @level2type=N'COLUMN',@level2name=N'UserRole_UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRole', @level2type=N'COLUMN',@level2name=N'UserRole_RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRole', @level2type=N'COLUMN',@level2name=N'UserRole_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理后台用户权限绑定表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'modular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'reason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'operator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sys_Role"
            Begin Extent = 
               Top = 6
               Left = 515
               Bottom = 146
               Right = 701
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Sys_UserRole"
            Begin Extent = 
               Top = 32
               Left = 280
               Bottom = 172
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sys_User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_user_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_user_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sys_RoleMenuFunction"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Sys_Menu"
            Begin Extent = 
               Top = 6
               Left = 622
               Bottom = 146
               Right = 815
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Sys_Function"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_user_role_function'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_sys_user_role_function'
GO
