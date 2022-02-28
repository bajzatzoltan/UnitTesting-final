USE UnitTesting;
GO

---------------------------------------------------
--SET DEFAULT DATABASE:
---------------------------------------------------
DECLARE @databaseName VARCHAR(256) = 'UnitTesting';
---------------------------------------------------
--EXECUTE UNIT TESTS FROM REGISTERED DIRECTORY:
---------------------------------------------------
EXEC ExecuteTests_usp	@directoryName = '00600_Programming_objects',
						@databaseName = @databaseName;
GO
-------------------------------------------------
--PRESENTATION OF UNIT TESTS RESULTS:
-------------------------------------------------
BEGIN
	SELECT * FROM TestResults
END
GO


