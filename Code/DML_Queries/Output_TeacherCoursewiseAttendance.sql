USE [Attendance]
GO

TRUNCATE TABLE Out_TeacherCoursewiseAttendance
INSERT INTO [dbo].[Out_TeacherCoursewiseAttendance]
           ([FACULTY_NAME],[COURSE_ID],[STUDENT_ID],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NUMBER])



		(SELECT A.[FACULTY],B.[COURSE_ID],B.[STUDENT_ID],B.[PERCENTAGE_ATTENDANCE],B.[EMAIL_ID],B.[CONTACT_NO] FROM Out_StudentCourseAttendance B
		  JOIN  In_Mstr_CourseList A 
		  ON A.[COURSE_ID]=B.[COURSE_ID]
		)


USE [Attendance]
GO

--DECLARE @Faculty_Name NVARCHAR(50) = 'T.K. Sahoo' /*we can use this statement to display the Attendance of all the students enrolled in the course of a single Faculty*/
SELECT [FACULTY_NAME],[COURSE_ID],[STUDENT_ID],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NUMBER]
  FROM [dbo].[Out_TeacherCoursewiseAttendance] 
 -- WHERE FACULTY_NAME=@Faculty_Name  /*along with this one*/
  ORDER BY [FACULTY_NAME], [COURSE_ID], [STUDENT_ID]


GO

