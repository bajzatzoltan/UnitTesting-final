USE UnitTesting;
GO

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-01';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
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

		EXEC dbo.DeleteTestScriptDirectory_usp @serverName = @serverName, @databaseName = @databaseName, @directoryName = @directoryName;

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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-02';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with valid parameters - rows is deleted';
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

		DECLARE @testFrameworkParametersID INT;
		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
		SELECT @testFrameworkParametersID = ID FROM [dbo].[TestFrameworkParameters] WHERE ServerName = @serverName AND DatabaseName = @databaseName;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK)
										VALUES(@directoryName, @testFrameworkParametersID);

		EXEC dbo.DeleteTestScriptDirectory_usp @serverName = @serverName, @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(*) FROM dbo.TestScriptsDirectorys 
			WHERE DirectoryName = @directoryName AND TestFrameworkParameters_ID_FK = @testFrameworkParametersID;
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-03';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with valid parameters without @serverName parameter - rows is deleted';
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

		DECLARE @testFrameworkParametersID INT;
		DECLARE @expectedCountOfRows INT = 0;
		DECLARE @resultCountOfRows INT;

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
		SELECT @testFrameworkParametersID = ID FROM [dbo].[TestFrameworkParameters] WHERE ServerName = @serverName AND DatabaseName = @databaseName;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK)
										VALUES(@directoryName, @testFrameworkParametersID);

		EXEC dbo.DeleteTestScriptDirectory_usp @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(*) FROM dbo.TestScriptsDirectorys 
			WHERE DirectoryName = @directoryName AND TestFrameworkParameters_ID_FK = @testFrameworkParametersID;
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-04';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @serverName parameter - rows is not deleted';
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

		DECLARE @testFrameworkParametersID INT;
		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;
		DECLARE @invalidServerName VARCHAR(2000) = 'InvalidServer';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
		SELECT @testFrameworkParametersID = ID FROM [dbo].[TestFrameworkParameters] WHERE ServerName = @serverName AND DatabaseName = @databaseName;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK)
										VALUES(@directoryName, @testFrameworkParametersID);

		EXEC dbo.DeleteTestScriptDirectory_usp @serverName = @invalidServerName, @databaseName = @databaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(*) FROM dbo.TestScriptsDirectorys 
			WHERE DirectoryName = @directoryName AND TestFrameworkParameters_ID_FK = @testFrameworkParametersID;
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-05';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @databaseName parameter - rows is not deleted';
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

		DECLARE @testFrameworkParametersID INT;
		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;
		DECLARE @invalidDatabaseName VARCHAR(2000) = 'InvalidDatabaseName';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
		SELECT @testFrameworkParametersID = ID FROM [dbo].[TestFrameworkParameters] WHERE ServerName = @serverName AND DatabaseName = @databaseName;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK)
										VALUES(@directoryName, @testFrameworkParametersID);

		EXEC dbo.DeleteTestScriptDirectory_usp @serverName = @serverName, @databaseName = @invalidDatabaseName, @directoryName = @directoryName;

		SELECT @resultCountOfRows = COUNT(*) FROM dbo.TestScriptsDirectorys 
			WHERE DirectoryName = @directoryName AND TestFrameworkParameters_ID_FK = @testFrameworkParametersID;
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
		DECLARE	@TESTNUMBER NVARCHAR(50) = '00500-06';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.DeleteTestScriptDirectory_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Execute with invalid @invalidDirectoryName parameter - rows is not deleted';
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

		DECLARE @testFrameworkParametersID INT;
		DECLARE @expectedCountOfRows INT = 1;
		DECLARE @resultCountOfRows INT;
		DECLARE @invalidDirectoryName VARCHAR(2000) = 'InvalidDirectoryName';

		INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
											VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
		SELECT @testFrameworkParametersID = ID FROM [dbo].[TestFrameworkParameters] WHERE ServerName = @serverName AND DatabaseName = @databaseName;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK)
										VALUES(@directoryName, @testFrameworkParametersID);

		EXEC dbo.DeleteTestScriptDirectory_usp @serverName = @serverName, @databaseName = @databaseName, @directoryName = @invalidDirectoryName;

		SELECT @resultCountOfRows = COUNT(*) FROM dbo.TestScriptsDirectorys 
			WHERE DirectoryName = @directoryName AND TestFrameworkParameters_ID_FK = @testFrameworkParametersID;
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
		
		DELETE FROM [dbo].[TestScriptsDirectorys]  WHERE ID > @testScriptsDirectorysCurrentID;
		DBCC CHECKIDENT ('dbo.TestScriptsDirectorys', RESEED, @testScriptsDirectorysCurrentID) WITH NO_INFOMSGS;
		DELETE FROM [dbo].[TestFrameworkParameters]  WHERE ID > @testFrameworkParametersCurrentID;
		DBCC CHECKIDENT ('dbo.TestFrameworkParameters', RESEED, @testFrameworkParametersCurrentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------