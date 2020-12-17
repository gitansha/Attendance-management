USE [Attendance]
GO


DECLARE @CurrDate DATE = '2020/3/4';

TRUNCATE TABLE Out_StudentCourseAttendance
INSERT INTO [dbo].[Out_StudentCourseAttendance]
           ([STUDENT_ID],[NAME],[COURSE_ID],[SCHEDULED_CLASSES],[ATTENDED_CLASSES],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NO])
		   
Select z.STUDENT_ID, T2.[NAME], T1.Course_ID, T1.noOfClasses as Scheduled_Classes, COUNT(DISTINCT(z.[DATE])) AS NO_OF_CLASSES, FORMAT(CAST(COUNT(DISTINCT(z.[DATE])) AS float)/T1.noOfClasses,'p') as percentattendance,LOWER(T2.[EMAILID]),T2.[CONTACT_NUMBER]

from(Select T0.COURSE_ID, sum(T0.NoOfClasses) as noOfClasses from 
	 (SELECT b.COURSE_ID, a.DAY, COUNT(a.DATE) as NoOfClasses  FROM Stg_SemesterCalender a 
	 Join In_Timetable b
	 on a.DAY=b.DAY
	 
	 WHERE a.DATE < @CurrDate GROUP BY a.DAY, b.COURSE_ID 
	) T0  GROUP BY T0.COURSE_ID) T1 

	JOIN Stg_ValidAttendance z
	on z.[COURSE_ID]=T1.COURSE_ID
	LEFT JOIN In_Mstr_Student T2
	ON T2.STUDENT_ID=z.STUDENT_ID
	--WHERE T1.DAY=Z.DAY
	Group By T1.COURSE_ID,z.STUDENT_ID, T2.NAME, T2.EMAILID, T2.CONTACT_NUMBER, T1.noOfClasses

	

USE [Attendance]
GO


--DECLARE @ID NVARCHAR(50) = 'B118042'/*we can use this statement to display the attendace of a single student*/
SELECT [STUDENT_ID],[NAME],[COURSE_ID],[SCHEDULED_CLASSES],[ATTENDED_CLASSES],[PERCENTAGE_ATTENDANCE],[EMAIL_ID],[CONTACT_NO] 
  FROM [dbo].[Out_StudentCourseAttendance] 
--  WHERE [Student_id] =@ID/*along with this one*/
  ORDER BY NAME, COURSE_ID

 SELECT SUM(cast(a.[ATTENDED_CLASSES] as int)) FROM Out_StudentCourseAttendance a
 
GO



