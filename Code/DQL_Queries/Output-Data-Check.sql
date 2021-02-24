USE [Attendance]
GO


--DECLARE @ID NVARCHAR(50) = 'B118042'/*we can use this statement to display the attendace of a single student*/
SELECT [STUDENT_ID],[NAME],[COURSE_ID],[SCHEDULED_CLASSES],[ATTENDED_CLASSES],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NO] 
  FROM [dbo].[Out_StudentCourseAttendance] 
 -- WHERE [Student_id] =@ID/*along with this one*/
  ORDER BY NAME, COURSE_ID

 SELECT SUM(cast(a.[ATTENDED_CLASSES] as int)) FROM Out_StudentCourseAttendance a
 
GO


USE [Attendance]
GO

--DECLARE @Faculty_Name NVARCHAR(50) = 'T.K. Sahoo' /*we can use this statement to display the Attendance of all the students enrolled in the course of a single Faculty*/
SELECT [FACULTY_NAME],[COURSE_ID],[STUDENT_ID],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NUMBER]
  FROM [dbo].[Out_TeacherCoursewiseAttendance] 
 -- WHERE FACULTY_NAME=@Faculty_Name  /*along with this one*/
  ORDER BY [FACULTY_NAME], [COURSE_ID], [STUDENT_ID]


GO