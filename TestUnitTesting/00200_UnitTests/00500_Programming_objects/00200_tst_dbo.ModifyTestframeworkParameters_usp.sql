USE UnitTesting;
GO

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00200-01';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.ModifyTestframeworkParameters_usp';
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

		EXEC dbo.ModifyTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName = @serverName,
												@userName = @userName,
												@userPassword = @userPassword;

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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00200-02';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.ModifyTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Get all valid parameters';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'TestServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @resultDatabaseName VARCHAR(256);
		DECLARE @resultTestsFilePath VARCHAR(2000);
		DECLARE @resultTestsFileName VARCHAR(256);
		DECLARE @resultServerName VARCHAR(256);
		DECLARE @resultUserName VARCHAR(256);
		DECLARE @resultUserPassword VARCHAR(256);

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath + '_', @testsFileName + '_', @userName + '_', @userPassword + '_');

		EXEC dbo.ModifyTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName =@serverName,
												@userName = @userName,
												@userPassword = @userPassword;
		SELECT	@resultServerName = ServerName, 
				@resultDatabaseName = DatabaseName, 
				@resultTestsFilePath = TestsFilePath, 
				@resultTestsFileName = TestsFileName, 
				@resultUserName = UserName, 
				@resultUserPassword = UserPassword 
			FROM [dbo].[TestFrameworkParameters];
		
		IF(	@serverName = @resultServerName AND 
			@databaseName = @resultDatabaseName AND 
			@testsFilePath = @resultTestsFilePath AND 
			@testsFileName = @resultTestsFileName AND 
			@userName = @resultUserName AND 
			@userPassword = @resultUserPassword)
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00200-03';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.ModifyTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Get some valid parameters';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'TestServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @resultDatabaseName VARCHAR(256);
		DECLARE @resultTestsFilePath VARCHAR(2000);
		DECLARE @resultTestsFileName VARCHAR(256);
		DECLARE @resultServerName VARCHAR(256);
		DECLARE @resultUserName VARCHAR(256);
		DECLARE @resultUserPassword VARCHAR(256);

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath + '_', @testsFileName + '_', @userName, @userPassword);

		EXEC dbo.ModifyTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName =@serverName,
												@userName = @userName;

		SELECT	@resultServerName = ServerName, 
				@resultDatabaseName = DatabaseName, 
				@resultTestsFilePath = TestsFilePath, 
				@resultTestsFileName = TestsFileName, 
				@resultUserName = UserName, 
				@resultUserPassword = UserPassword 
			FROM [dbo].[TestFrameworkParameters];
		
		IF(	@serverName = @resultServerName AND 
			@databaseName = @resultDatabaseName AND 
			@testsFilePath = @resultTestsFilePath AND 
			@testsFileName = @resultTestsFileName AND 
			@userName = @resultUserName AND 
			@userPassword = @resultUserPassword)
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00200-04';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.ModifyTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Get invalid @databaseName parameters';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'TestServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @invalidtDatabaseName VARCHAR(256) = 'InvalidDatabaseName';
		DECLARE @expectedCountOfRows INT;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath + '_', @testsFileName + '_', @userName + '_', @userPassword + '_');
		
		SELECT @expectedCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters];

		EXEC dbo.ModifyTestframeworkParameters_usp @databaseName = @invalidtDatabaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName =@serverName,
												@userName = @userName,
												@userPassword = @userPassword;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters];

		
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00200-05';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.ModifyTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Get invalid @serverName parameters';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = 'TestServer';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @invalidtServerName VARCHAR(256) = 'InvalidServerName';
		DECLARE @expectedCountOfRows INT;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath + '_', @testsFileName + '_', @userName + '_', @userPassword + '_');
		
		SELECT @expectedCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters];

		EXEC dbo.ModifyTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName =@invalidtServerName,
												@userName = @userName,
												@userPassword = @userPassword;

		SELECT @resultCountOfRows = COUNT(*) FROM [dbo].[TestFrameworkParameters];

		
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