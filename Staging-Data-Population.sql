TRUNCATE TABLE [Stg_StudentTimeTable]

INSERT INTO [dbo].[Stg_StudentTimeTable]
          ([STUDENT_ID], [CLASSROOM], [DAY], [START_TIME], [END_TIME], [COURSE_ID])
SELECT B.[STUDENT_ID],A.[CLASSROOM],A.[DAY],A.[START_TIME],A.[END_TIME],A.[COURSE_ID]
FROM [dbo].[In_Mstr_StudentCoursesList] B
 JOIN [dbo].[In_Timetable] A
 ON A.[COURSE_ID]=B.[COURSE_ID]

 USE [Attendance]
GO

SELECT [STUDENT_ID],[CLASSROOM],[DAY],[START_TIME],[END_TIME],[COURSE_ID]
  FROM [dbo].[Stg_StudentTimeTable]

GO


TRUNCATE TABLE [Stg_ValidAttendance]

INSERT INTO [dbo].[Stg_ValidAttendance]
SELECT [STUDENT_ID],[CLASSROOM],[COURSE_ID],[DATE],[DAY],MIN(TIME) AS IN_TIME, MAX(TIME) AS OUT_TIME FROM
(
SELECT T1.[STUDENT_ID],T1.[CLASSROOM],T1.[DAY],T1.[COURSE_ID],T2.[DATE], T2.[TIME] FROM
(SELECT A.[STUDENT_ID],A.[CLASSROOM],A.[DAY],A.[START_TIME],A.[END_TIME],A.[COURSE_ID]
 FROM [dbo].[Stg_StudentTimeTable] A) T1
LEFT JOIN
(SELECT A.[BIOMETRIC_ID],A.[STUDENT_ID],DATENAME(DW,A.[TIME]) AS DAY,CAST(A.[TIME] AS TIME ) AS TIME,CAST(A.[TIME] AS DATE ) AS DATE, B.[CLASSROOM]
 FROM In_BiometricLiveData A JOIN In_Mstr_Biometric B ON A.BIOMETRIC_ID = B.BIOMETRIC_ID) T2
ON T1.STUDENT_ID=T2.STUDENT_ID

WHERE T1.CLASSROOM = T2.CLASSROOM
AND T1.[DAY]=T2.[DAY]
AND T2.[TIME]>=T1.[START_TIME] AND T2.[TIME]<=T1.[END_TIME]) T3

GROUP BY STUDENT_ID,CLASSROOM,DAY,COURSE_ID,DATE


SELECT [STUDENT_ID],[CLASSROOM],[COURSE_ID],[DATE],[DAY],[IN_TIME],[OUT_TIME]
  FROM [dbo].[Stg_ValidAttendance]

GO




TRUNCATE TABLE [Stg_SemesterCalender]
USE [Attendance]
GO

Declare @D1 DATE = (Select START_DATE FROM [In_AcademicCalender] where Event='Semester');
Declare @D2 DATE = (Select END_DATE FROM [In_AcademicCalender] where Event='Semester');
Declare @D3 DATE = (Select START_DATE FROM [In_AcademicCalender] where Event='Midsems');
Declare @D4 DATE = (Select END_DATE FROM [In_AcademicCalender] where Event='Midsems');

WITH SEMESTERCALENDAR AS (
	SELECT @D1 AS DATE
	UNION ALL
	SELECT DATEADD(DAY,1,DATE) FROM SEMESTERCALENDAR WHERE DATE<@D2
)

INSERT INTO [dbo].[Stg_SemesterCalender]
           ([DATE],[DAY])


SELECT DATE, DATENAME(DW,DATE) AS DAY FROM SEMESTERCALENDAR 
WHERE UPPER(DATENAME(DW,DATE)) NOT IN ('SATURDAY','SUNDAY')
AND DATE NOT IN (SELECT DATE FROM In_Mstr_Holidays)
AND DATE < @D3

UNION ALL

SELECT DATE, DATENAME(DW,DATE) AS DAY FROM SEMESTERCALENDAR 
WHERE UPPER(DATENAME(DW,DATE)) NOT IN ('SATURDAY','SUNDAY')
AND DATE NOT IN (SELECT DATE FROM In_Mstr_Holidays)
AND DATE > @D4
OPTION (MAXRECURSION 0)


SELECT [DATE],[DAY]
	FROM [dbo].[Stg_SemesterCalender]

GO




