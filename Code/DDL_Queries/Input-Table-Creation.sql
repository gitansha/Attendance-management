CREATE TABLE [dbo].[In_Mstr_Student](
[STUDENT_ID] [nvarchar](50) NULL,
[NAME] [nvarchar](200) NULL,
[BRACH] [nvarchar](50) NULL,
[YEAR_OF_JOINING] [nvarchar](50) NULL,
[EMAILID] [nvarchar](50) NULL,
[GUARDIANS_NAME] [nvarchar](200) NULL,
[CONTACT_NUMBER] [nvarchar](20) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_Mstr_Holidays](
[DATE] [date] NULL,
[HOLIDAY] [nvarchar](50) NULL,
[DAY] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_Mstr_StudentCoursesList](
[STUDENT_ID] [nvarchar](50) NULL,
[SEMESTER] [nvarchar](50) NULL,
[COURSE_ID] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_Timetable](
[DAY] [nvarchar](50) NULL,
[START_TIME] [time](7) NULL,
[END_TIME] [time](7) NULL,
[COURSE_ID] [nvarchar](50) NULL,
[CLASSROOM] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_Mstr_CourseList](
[COURSE_ID] [nvarchar](50) NULL,
[COURSE_NAME] [nvarchar](50) NULL,
[FACULTY] [nvarchar](200) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_BiometricLiveData](
[BIOMETRIC_ID] [nvarchar](50) NULL,
[STUDENT_ID] [nvarchar](50) NULL,
[TIME] [datetime] NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_Mstr_Biometric](
[BIOMETRIC_ID] [nvarchar](50) NULL,
[BLOCK] [nvarchar](50) NULL,
[FLOOR] [nvarchar](50) NULL,
[CLASSROOM] [nvarchar](50) NULL,
[BIOMETRIC_NUMBER] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[In_AcademicCalender](
[EVENT] [nvarchar](100) NULL,
[START_DATE] [date] NULL,
[END_DATE] [date] NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Stg_StudentTimeTable](
[STUDENT_ID] [nvarchar](50) NULL,
[CLASSROOM] [nvarchar](50) NULL,
[DAY] [nvarchar](50) NULL,
[START_TIME] [time](7) NULL,
[END_TIME] [nvarchar](50) NULL,
[COURSE_ID] [nvarchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Stg_ValidAttendance](
[STUDENT_ID] [nvarchar](50) NULL,
[CLASSROOM] [nvarchar](50) NULL,
[COURSE_ID] [nvarchar](50) NULL,
[DATE] [date] NULL,
[DAY] [nvarchar](50) NULL,
[IN_TIME] [time](7) NULL,
[OUT_TIME] [time](7) NULL
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[Stg_SemesterCalender](
[DATE] [date] NULL,
[DAY] [nvarchar](50) NULL
) ON [PRIMARY]

GO

--INSERT INTO [dbo].[Stg_ValidAttendance]
--SELECT [STUDENT_ID],[CLASSROOM],[COURSE_ID],[DATE],[DAY],MIN(TIME) AS IN_TIME, MAX(TIME) AS OUT_TIME FROM
--(
--SELECT T1.[STUDENT_ID],T1.[CLASSROOM],T1.[DAY],T1.[COURSE_ID],T2.[DATE], T2.[TIME] FROM
--(SELECT A.[STUDENT_ID],A.[CLASSROOM],A.[DAY],A.[START_TIME],A.[END_TIME],A.[COURSE_ID]
-- FROM [dbo].[Stg_StudentTimeTable] A) T1
--LEFT JOIN
--(SELECT A.[BIOMETRIC_ID],A.[STUDENT_ID],DATENAME(DW,A.[TIME]) AS DAY,CAST(A.[TIME] AS TIME ) AS TIME,CAST(A.[TIME] AS DATE ) AS DATE, B.[CLASSROOM]
-- FROM In_BiometricLiveData A JOIN In_Mstr_Biometric B ON A.BIOMETRIC_ID = B.BIOMETRIC_ID) T2
--ON T1.STUDENT_ID=T2.STUDENT_ID

--WHERE T1.CLASSROOM = T2.CLASSROOM
--AND T1.[DAY]=T2.[DAY]
--AND T2.[TIME]>=T1.[START_TIME] AND T2.[TIME]<=T1.[END_TIME]) T3

--GROUP BY STUDENT_ID,CLASSROOM,DAY,COURSE_ID,DATE

