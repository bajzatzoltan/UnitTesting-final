USE UnitTesting;
GO

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00400-01';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure is exists';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @testFrameworkParametersCurrentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');
		DECLARE @testScriptsDirectorysCurrentID INT = IDENT_CURRENT('dbo.TestScriptsDirectorys');

		DECLARE @serverName VARCHAR(2000) = 'TestServer';
		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath\';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.AddTestScriptDirectory_usp @serverName = @serverName, @databaseName = @databaseName, @directoryName = @directoryName;

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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00400-02';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with valid parameters - rows is added';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @testFrameworkParametersCurrentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');
		DECLARE @testScriptsDirectorysCurrentID INT = IDENT_CURRENT('dbo.TestScriptsDirectorys');

		DECLARE @serverName VARCHAR(2000) = 'TestServer';
		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath\';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.AddTestScriptDirectory_usp @serverName = @serverName, @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(TSD.ID) 
			FROM dbo.TestScriptsDirectorys AS TSD
			INNER JOIN dbo.TestFrameworkParameters AS TFP
				ON TSD.TestFrameworkParameters_ID_FK = TFP.ID
			WHERE  TFP.ServerName = @serverName 
				AND TFP.DatabaseName = @databaseName
				AND TSD.DirectoryName = @directoryName;
		
		IF (@expectedCountOfRows = @resultCountOfRows)
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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00400-03';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute valid parameters without @serverName parameter - rows is added';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @testFrameworkParametersCurrentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');
		DECLARE @testScriptsDirectorysCurrentID INT = IDENT_CURRENT('dbo.TestScriptsDirectorys');

		DECLARE @serverName VARCHAR(2000) = @@SERVERNAME;
		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath\';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.AddTestScriptDirectory_usp @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(TSD.ID) 
			FROM dbo.TestScriptsDirectorys AS TSD
			INNER JOIN dbo.TestFrameworkParameters AS TFP
				ON TSD.TestFrameworkParameters_ID_FK = TFP.ID
			WHERE  TFP.ServerName = @serverName 
				AND TFP.DatabaseName = @databaseName
				AND TSD.DirectoryName = @directoryName;
		
		IF (@expectedCountOfRows = @resultCountOfRows)
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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------


BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00400-04';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @databaseName parameters - rows is not added';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @testFrameworkParametersCurrentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');
		DECLARE @testScriptsDirectorysCurrentID INT = IDENT_CURRENT('dbo.TestScriptsDirectorys');

		DECLARE @serverName VARCHAR(2000) = 'TestServer';
		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath\';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;
		DECLARE @invalidDatabaseName VARCHAR(256) = 'InvalidDatabase';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.AddTestScriptDirectory_usp @serverName = @serverName, @databaseName = @invalidDatabaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(TSD.ID) 
			FROM dbo.TestScriptsDirectorys AS TSD
			INNER JOIN dbo.TestFrameworkParameters AS TFP
				ON TSD.TestFrameworkParameters_ID_FK = TFP.ID
			WHERE  TFP.ServerName = @serverName 
				AND TFP.DatabaseName = @databaseName
				AND TSD.DirectoryName = @directoryName;
		
		IF (@expectedCountOfRows = @resultCountOfRows)
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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00400-05';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.AddTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @serverName parameters - rows is not added';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @testFrameworkParametersCurrentID INT = IDENT_CURRENT('dbo.TestFrameworkParameters');
		DECLARE @testScriptsDirectorysCurrentID INT = IDENT_CURRENT('dbo.TestScriptsDirectorys');

		DECLARE @serverName VARCHAR(2000) = 'TestServer';
		DECLARE @databaseName VARCHAR(256) = 'TestDatabase';
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testsFilePath VARCHAR(2000) = 'c:\testsFilePath\';
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1';
		DECLARE @userName VARCHAR(256) = 'userName';
		DECLARE @userPassword VARCHAR(256) = 'password';

		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;
		DECLARE @invalidserverName VARCHAR(256) = 'InvalidserverName';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);

		EXEC dbo.AddTestScriptDirectory_usp @serverName = @invalidserverName, @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(TSD.ID) 
			FROM dbo.TestScriptsDirectorys AS TSD
			INNER JOIN dbo.TestFrameworkParameters AS TFP
				ON TSD.TestFrameworkParameters_ID_FK = TFP.ID
			WHERE  TFP.ServerName = @serverName 
				AND TFP.DatabaseName = @databaseName
				AND TSD.DirectoryName = @directoryName;
		
		IF (@expectedCountOfRows = @resultCountOfRows)
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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------