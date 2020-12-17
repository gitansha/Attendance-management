TRUNCATE TABLE IN_MSTR_BIOMETRIC

BULK INSERT dbo.In_Mstr_Biometric
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_Mstr_Biometric.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO

TRUNCATE TABLE IN_MSTR_COURSELIST

BULK INSERT dbo.In_Mstr_CourseList
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_Mstr_CourseList.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


TRUNCATE TABLE IN_MSTR_HOLIDAYS

BULK INSERT dbo.In_Mstr_Holidays
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_Mstr_Holidays.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


TRUNCATE TABLE IN_MSTR_STUDENT

BULK INSERT dbo.In_Mstr_Student
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_Mstr_Student.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


TRUNCATE TABLE IN_MSTR_STUDENTCOURSESLIST

BULK INSERT dbo.In_Mstr_StudentCoursesList
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_Mstr_StudentCoursesList.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


TRUNCATE TABLE IN_TIMETABLE

BULK INSERT dbo.In_TimeTable
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_TimeTable.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


TRUNCATE TABLE IN_BIOMETRICLIVEDATA

BULK INSERT dbo.In_BiometricLiveData
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - LiveData.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO

TRUNCATE TABLE IN_AcademicCalender

BULK INSERT dbo.In_AcademicCalender
FROM 'D:\Gitansha\iiit bbsr\RDBMS Project\Dataset-2 (22.06.2020)\Input Table Dataset - In_AcademicCalander.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR ='\,',
ROWTERMINATOR ='\n'
)
GO


