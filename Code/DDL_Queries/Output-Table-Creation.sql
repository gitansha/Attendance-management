USE [Attendance]
GO

CREATE TABLE [dbo].[Out_StudentCourseAttendance](
	[STUDENT_ID] [nvarchar](50) NULL,
	[NAME] [nvarchar](200) NULL,
	[COURSE_ID] [nvarchar](50) NULL,
	[SCHEDULED_CLASSES] [nvarchar](50) NULL,
	[ATTENDED_CLASSES] [nvarchar](50) NULL,
	[PERCENTAGE_ATTENDANCE] [nvarchar](50) NULL,
	[EMAIL_ID] [nvarchar](50) NULL,
	[CONTACT_NO] [nvarchar](50) NULL

) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Out_TeacherCoursewiseAttendance](
	[FACULTY_NAME] [nvarchar](200) NULL,
	[COURSE_ID] [nvarchar](50) NULL,
	[STUDENT_ID] [nvarchar](50) NULL,
	[PERCENTAGE_ATTENDANCE] [nvarchar](50) NULL,
	[EMAIL_ID] [nvarchar](50) NULL,
	[CONTACT_NUMBER] [nvarchar](50) NULL
) ON [PRIMARY]
GO

