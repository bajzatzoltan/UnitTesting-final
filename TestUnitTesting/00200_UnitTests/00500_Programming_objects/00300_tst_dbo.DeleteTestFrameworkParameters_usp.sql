USE UnitTesting;
GO

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00300-01';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure is exists';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'testServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.DeleteTestframeworkParameters_usp @databaseName = @databaseName, @serverName = @serverName;


		SET @TESTRESULT = 'True';
		
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00300-02';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with valid parameters - delete inserted row';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'testServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.DeleteTestframeworkParameters_usp @databaseName = @databaseName, @serverName = @serverName;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters] WHERE DatabaseName = @databaseName AND ServerName = @serverName;
		IF(	@expectedCountOfRows = @resultCountOfRows)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
		
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00300-03';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @databaseName parameter - not delete inserted row';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'testServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @invalidDatabaseName VARCHAR(256) = 'InvalidtDatabase';
		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.DeleteTestframeworkParameters_usp @databaseName = @invalidDatabaseName, @serverName = @serverName;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters] WHERE DatabaseName = @databaseName AND ServerName = @serverName;
		IF(	@expectedCountOfRows = @resultCountOfRows)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
		
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00300-04';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @serverName paramete - not delete inserted row';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'testServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @invalidServerName VARCHAR(256) = 'InvalidServerName';
		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.DeleteTestframeworkParameters_usp @databaseName = @databaseName, @serverName = @invalidServerName;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters] WHERE DatabaseName = @databaseName AND ServerName = @serverName;
		IF(	@expectedCountOfRows = @resultCountOfRows)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
		
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------


BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00300-05';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute without @serverName parameter - delete inserted row';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = @@SERVERNAME;
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.DeleteTestframeworkParameters_usp @databaseName = @databaseName;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters] WHERE DatabaseName = @databaseName AND ServerName = @serverName;
		IF(	@expectedCountOfRows = @resultCountOfRows)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
		
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------