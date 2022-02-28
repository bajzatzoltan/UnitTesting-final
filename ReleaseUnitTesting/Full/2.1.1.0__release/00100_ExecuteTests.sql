USE UnitTesting;
GO

---------------------------------------------------
--SET DEFAULT DATABASE:
---------------------------------------------------
DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests'; --Database name which was registered and want to test
---------------------------------------------------
--EXECUTE UNIT TESTS FROM REGISTERED DIRECTORY:
---------------------------------------------------
EXEC ExecuteTests_usp	@directoryName = '00500_Programming_objects', --Directory name in 00200_UnitTests directory which was registered and want to run all .sql files
						@databaseName = @databaseName;
GO
-------------------------------------------------
--PRESENTATION OF UNIT TESTS RESULTS:
-------------------------------------------------
BEGIN
	SELECT * FROM TestResults
END
GO


