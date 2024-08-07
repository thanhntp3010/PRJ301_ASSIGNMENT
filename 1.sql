USE [master]
GO
CREATE DATABASE [GradeAssignment]
USE [GradeAssignment]
CREATE TABLE [dbo].[Assessments](
	[AssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[Category] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[CompletionCriteria] [varchar](50) NULL,
	[Duration] [text] NULL,
	[QuestionType] [text] NULL,
	[NoQuestion] [varchar](max) NULL,
	[Weight] [float] NULL,
 CONSTRAINT [PK__Assessme__3D2BF81EB050F9DE] PRIMARY KEY CLUSTERED 
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[InstructorId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Semester] [varchar](20) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK__Classes__CB1927C09069FC61] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[CourseCode] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[StudentClassId] [int] NULL,
	[AssessmentId] [int] NULL,
	[Score] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourse]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstructorId] [int] NOT NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_InstructorCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClasses]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClasses](
	[StudentClassId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[ClassId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/7/2024 1:47:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[RoleId] [int] NULL,
	[RollNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 

INSERT [dbo].[Assessments] ([AssessmentId], [CourseId], [Category], [Type], [CompletionCriteria], [Duration], [QuestionType], [NoQuestion], [Weight]) VALUES (4, 1, N'Assignment', N'on-going', N'>0', N'Option 1: 5 weeks;', N'Option 1: Project; Option 2 (For Constructivism Approach only): Follow lecturer proposal', N'30', 30)
INSERT [dbo].[Assessments] ([AssessmentId], [CourseId], [Category], [Type], [CompletionCriteria], [Duration], [QuestionType], [NoQuestion], [Weight]) VALUES (5, 1, N'Practical Exam', N'on-going', N'>0', N'Option 1: 90 minutes; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', N'Option 1: Practical Exam; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', N'Option 1: 3; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', 10)
INSERT [dbo].[Assessments] ([AssessmentId], [CourseId], [Category], [Type], [CompletionCriteria], [Duration], [QuestionType], [NoQuestion], [Weight]) VALUES (6, 1, N'Progress Test 1	', N'on-going', N'>0', N'Option 1: 30 mins; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', N'Option 1: Multiple Choice; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', N'Option 1: 20; Option 2 (For Constructivism Approach only): Follow lecturer''s proposal', 15)
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([ClassId], [CourseId], [InstructorId], [Name], [Semester], [Year]) VALUES (1, 1, 2, N'SE1823', N'Fall', 2024)
INSERT [dbo].[Classes] ([ClassId], [CourseId], [InstructorId], [Name], [Semester], [Year]) VALUES (2, 2, 2, N'SE1823', N'Spring', 2024)
INSERT [dbo].[Classes] ([ClassId], [CourseId], [InstructorId], [Name], [Semester], [Year]) VALUES (3, 3, 3, N'SE1823', N'Fall', 2025)
INSERT [dbo].[Classes] ([ClassId], [CourseId], [InstructorId], [Name], [Semester], [Year]) VALUES (4, 4, 3, N'SE1823', N'Spring', 2025)
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseCode]) VALUES (1, N'Java Web Application Development', N'PRJ301')
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseCode]) VALUES (2, N'Mobile Programming', N'PRM392')
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseCode]) VALUES (3, N'Introduction to Databases', N'DBI202')
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseCode]) VALUES (4, N'Software development project', N'SWP391')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeId], [StudentClassId], [AssessmentId], [Score]) VALUES (8, 1, 4, CAST(7.00 AS Decimal(5, 2)))
INSERT [dbo].[Grades] ([GradeId], [StudentClassId], [AssessmentId], [Score]) VALUES (9, 2, 4, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Grades] ([GradeId], [StudentClassId], [AssessmentId], [Score]) VALUES (10, 1, 6, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Grades] ([GradeId], [StudentClassId], [AssessmentId], [Score]) VALUES (11, 1, 5, CAST(8.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[InstructorCourse] ON 

INSERT [dbo].[InstructorCourse] ([Id], [InstructorId], [CourseId]) VALUES (1, 2, 1)
INSERT [dbo].[InstructorCourse] ([Id], [InstructorId], [CourseId]) VALUES (2, 2, 2)
INSERT [dbo].[InstructorCourse] ([Id], [InstructorId], [CourseId]) VALUES (3, 3, 3)
INSERT [dbo].[InstructorCourse] ([Id], [InstructorId], [CourseId]) VALUES (4, 3, 4)
SET IDENTITY_INSERT [dbo].[InstructorCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Instructor')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentClasses] ON 

INSERT [dbo].[StudentClasses] ([StudentClassId], [StudentId], [ClassId]) VALUES (1, 4, 1)
INSERT [dbo].[StudentClasses] ([StudentClassId], [StudentId], [ClassId]) VALUES (2, 5, 2)
SET IDENTITY_INSERT [dbo].[StudentClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [FullName], [Email], [RoleId], [RollNumber]) VALUES (1, N'admin', N'123', N'Admin', N'admin@gmail.com', 1, NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FullName], [Email], [RoleId], [RollNumber]) VALUES (2, N'instructor1', N'123', N'Instructor One', N'instructor1@gmail.com', 2, NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FullName], [Email], [RoleId], [RollNumber]) VALUES (3, N'instructor2', N'123', N'Instructor Two', N'instructor2@example.com', 2, NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FullName], [Email], [RoleId], [RollNumber]) VALUES (4, N'abc', N'123', N'Student One', N'student1@example.com', 3, N'HE179209')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FullName], [Email], [RoleId], [RollNumber]) VALUES (5, N'student2', N'123', N'Student Two', N'student2@example.com', 3, N'HE187384')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4A24EE34A]    Script Date: 7/7/2024 1:47:37 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assessments]  WITH CHECK ADD  CONSTRAINT [FK_Assessments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Assessments] CHECK CONSTRAINT [FK_Assessments_Courses]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK__Classes__CourseI__33D4B598] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK__Classes__CourseI__33D4B598]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK__Classes__Instruc__34C8D9D1] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK__Classes__Instruc__34C8D9D1]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK__Grades__Assessme__38996AB5] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessments] ([AssessmentId])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK__Grades__Assessme__38996AB5]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([StudentClassId])
REFERENCES [dbo].[StudentClasses] ([StudentClassId])
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Courses]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [FK_InstructorCourse_Users] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [FK_InstructorCourse_Users]
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD  CONSTRAINT [FK__StudentCl__Class__398D8EEE] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([ClassId])
GO
ALTER TABLE [dbo].[StudentClasses] CHECK CONSTRAINT [FK__StudentCl__Class__398D8EEE]
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])

