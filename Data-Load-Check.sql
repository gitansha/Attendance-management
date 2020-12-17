USE [Attendance]
GO

SELECT [COURSE_ID]
      ,[COURSE_NAME]
      ,[FACULTY]
  FROM [dbo].[In_Mstr_CourseList]

GO

USE [Attendance]
GO

SELECT [DATE]
      ,[HOLIDAY]
      ,[DAY]
  FROM [dbo].[In_Mstr_Holidays]

GO

USE [Attendance]
GO

SELECT [STUDENT_ID]
      ,[SEMESTER]
      ,[COURSE_ID]
  FROM [dbo].[In_Mstr_StudentCoursesList]

GO
USE [Attendance]
GO

SELECT [DAY]
      ,[START_TIME]
      ,[END_TIME]
      ,[COURSE_ID]
      ,[CLASSROOM]
  FROM [dbo].[In_Timetable]

GO

USE [Attendance]
GO

SELECT [STUDENT_ID]
      ,[NAME]
      ,[BRACH]
      ,[YEAR_OF_JOINING]
      ,[EMAILID]
      ,[GUARDIANS_NAME]
      ,[CONTACT_NUMBER]
  FROM [dbo].[In_Mstr_Student]

GO

USE [Attendance]
GO

SELECT [BIOMETRIC_ID]
      ,[STUDENT_ID]
      ,[TIME]
  FROM [dbo].[In_BiometricLiveData]

GO

USE [Attendance]
GO

SELECT [EVENT]
      ,[START_DATE]
      ,[END_DATE]
  FROM [dbo].[In_AcademicCalender]

GO

USE [Attendance]
GO

SELECT [BIOMETRIC_ID]
      ,[BLOCK]
      ,[FLOOR]
      ,[CLASSROOM]
      ,[BIOMETRIC_NUMBER]
  FROM [dbo].[In_Mstr_Biometric]

GO

SELECT [COURSE_ID],[COURSE_NAME],[FACULTY]
  FROM [dbo].[In_Mstr_CourseList] WHERE [FACULTY] LIKE ‘%H’;
  GO

SELECT[BIOMETRIC_ID],[STUDENT_ID],[TIME]FROM [dbo].[In_BiometricLiveData] WHERE [BIOMETRIC_ID]=AG01-1;
GO

SELECT [EVENT],[START_DATE],[END_DATE]
  FROM [dbo].[In_AcademicCalender];
  GO

SELECT [BIOMETRIC_ID],[BLOCK] FROM [dbo].[In_Mstr_Biometric]
GO




