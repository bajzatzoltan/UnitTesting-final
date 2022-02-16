USE UnitTesting;
GO

---------------------------------------------------
--SET DEFAULT DATABASE:
---------------------------------------------------
DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
---------------------------------------------------
--EXECUTE UNIT TESTS FROM REGISTERED DIRECTORY:
---------------------------------------------------
EXEC ExecuteTests_usp	@directoryName = '00500_Programming_objects',
						@databaseName = @databaseName;
GO
-------------------------------------------------
--PRESENTATION OF UNIT TESTS RESULTS:
-------------------------------------------------
BEGIN
	SELECT * FROM TestResults
END
GO


