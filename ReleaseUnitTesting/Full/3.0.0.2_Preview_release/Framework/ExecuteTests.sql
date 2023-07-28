USE UnitTesting;
GO

---------------------------------------------------
--SET DEFAULT DATABASE:
---------------------------------------------------
DECLARE @databaseName VARCHAR(256) = 'TutorialsSqlServerUnitTestCiCd'; --Database name which was registered and want to test
---------------------------------------------------
--DELETE RESULTS OF UNIT TESTS:
---------------------------------------------------
TRUNCATE TABLE dbo.TestResults
DBCC CHECKIDENT ('dbo.TestResults', RESEED, 1) WITH NO_INFOMSGS
---------------------------------------------------
--EXECUTE UNIT TESTS FROM REGISTERED DIRECTORY:
---------------------------------------------------
EXEC ExecuteTests_usp	@directoryName = 'CreateTestEnviroment', --Directory name and path in UnitTests directory which was registered and want to run all .sql files
						@databaseName = @databaseName;
EXEC ExecuteTests_usp	@directoryName = 'DependentObjects\Objects\Sales\Programmability', --Directory name and path in UnitTests directory which was registered and want to run all .sql files
						@databaseName = @databaseName;
--EXEC ExecuteTests_usp	@directoryName = 'DeleteTestEnviroment', --Directory name and path in UnitTests directory which was registered and want to run all .sql files
--						@databaseName = @databaseName;
GO
-------------------------------------------------
--PRESENTATION OF UNIT TESTS RESULTS:
-------------------------------------------------
BEGIN
	SELECT * FROM TestResults WHERE TestResult = 'False' ORDER BY MethodName, TestNumber;
	SELECT * FROM TestResults ORDER BY MethodName, TestNumber;
END
GO


