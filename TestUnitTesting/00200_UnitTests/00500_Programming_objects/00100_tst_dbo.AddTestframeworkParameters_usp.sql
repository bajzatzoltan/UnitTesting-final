USE UnitTesting;
GO

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-01';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure is exists';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, @testsFilePath = @testsFilePath, @testsFileName = @testsFileName;

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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-02';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = '@databaseName procedure parameter is null';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @resultErrorMessage NVARCHAR(500);
		DECLARE @expectedErrorMessage NVARCHAR(500) = 'NULL values of @databaseName or @testsFilePath or @serverName parameter are not allowed! ';
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = NULL;
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, @testsFilePath = @testsFilePath, @testsFileName = @testsFileName;
		
	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @resultErrorMessage = ERROR_MESSAGE();
			PRINT @resultErrorMessage
			IF (@expectedErrorMessage = @resultErrorMessage)
				BEGIN;
					SET @TESTRESULT = 'True'
				END;

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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-03';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = '@testsFilePath procedure parameter is null';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @resultErrorMessage NVARCHAR(500);
		DECLARE @expectedErrorMessage NVARCHAR(500) = 'NULL values of @databaseName or @testsFilePath or @serverName parameter are not allowed! ';
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = NULL;
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, @testsFilePath = @testsFilePath, @testsFileName = @testsFileName;
		
	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @resultErrorMessage = ERROR_MESSAGE();
			PRINT @resultErrorMessage
			IF (@expectedErrorMessage = @resultErrorMessage)
				BEGIN;
					SET @TESTRESULT = 'True'
				END;

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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-04';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure parameters are valid and @userName parameter is null';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @resultDatabaseName NVARCHAR(256);
		DECLARE @resultTestFilePath NVARCHAR(500);
		DECLARE @resultTestFileName NVARCHAR(256);
		DECLARE @resultUserName NVARCHAR(256);
		DECLARE @resultUserPassword NVARCHAR(256);
		DECLARE @resultServerName NVARCHAR(256);

		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = @@SERVERNAME;
		DECLARE @userName VARCHAR(256) = NULL;
		DECLARE @userPassword VARCHAR(256) = 'password';


		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName = @serverName,
												@userName = @userName,
												@userPassword = @userPassword;
		
		SELECT	@resultServerName = ServerName, 
				@resultDatabaseName = DatabaseName, 
				@resultTestFilePath = TestsFilePath, 
				@resultTestFileName = TestsFileName, 
				@resultUserName = UserName, 
				@resultUserPassword = UserPassword 
			FROM dbo.TestFrameworkParameters WHERE ID = @currentID + 1

		IF (@serverName = @resultServerName AND 
			@databaseName = @resultDatabaseName AND 
			@testsFilePath = @resultTestFilePath AND 
			@testsFileName = @resultTestFileName AND
			@resultUserName IS NULL AND 
			@userPassword = @resultUserPassword )
		BEGIN;
			SET @TESTRESULT = 'True'
		END;

	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-05';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure parameters are valid and @userPassword parameter is null';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @resultDatabaseName NVARCHAR(256);
		DECLARE @resultTestFilePath NVARCHAR(500);
		DECLARE @resultTestFileName NVARCHAR(256);
		DECLARE @resultUserName NVARCHAR(256);
		DECLARE @resultUserPassword NVARCHAR(256);
		DECLARE @resultServerName NVARCHAR(256);

		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = @@SERVERNAME;
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = NULL;


		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName = @serverName,
												@userName = @userName,
												@userPassword = @userPassword;
		
		SELECT	@resultServerName = ServerName, 
				@resultDatabaseName = DatabaseName, 
				@resultTestFilePath = TestsFilePath, 
				@resultTestFileName = TestsFileName, 
				@resultUserName = UserName, 
				@resultUserPassword = UserPassword 
			FROM dbo.TestFrameworkParameters WHERE ID = @currentID + 1

		IF (@serverName = @resultServerName AND 
			@databaseName = @resultDatabaseName AND 
			@testsFilePath = @resultTestFilePath AND 
			@testsFileName = @resultTestFileName AND
			@userName = @resultUserName AND 
			@resultUserPassword IS NULL)
		BEGIN;
			SET @TESTRESULT = 'True'
		END;

	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00100-06';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestframeworkParameters_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure parameters are valid and @serverName parameter is null';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

		DECLARE @resultErrorMessage NVARCHAR(500);
		DECLARE @expectedErrorMessage NVARCHAR(500) = 'NULL values of @databaseName or @testsFilePath or @serverName parameter are not allowed! ';
		DECLARE @currentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');

		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @serverName VARCHAR(256) = NULL;
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';


		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName, 
												@testsFilePath = @testsFilePath, 
												@testsFileName = @testsFileName,
												@serverName = @serverName,
												@userName = @userName,
												@userPassword = @userPassword;
		
	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @resultErrorMessage = ERROR_MESSAGE();
			PRINT @resultErrorMessage
			IF (@expectedErrorMessage = @resultErrorMessage)
				BEGIN;
					SET @TESTRESULT = 'True'
				END;

	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
