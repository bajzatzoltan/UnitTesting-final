USE UnitTesting
GO


----------------------------------------------------------------------------------------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0001000';
		DECLARE @METHODNAME NVARCHAR(100) = 'Integration test';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Two white space in path of test files';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		PRINT '--';
		-------------------------------------------------
		--CONFIGURING TEST ENVIROMENT
		-------------------------------------------------
		DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
		DECLARE @testsFilePath  VARCHAR(4000) = 'c:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\00600_Tests\Run  SqlScriptsWithPowershell\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
		DECLARE @userName VARCHAR(256) = 'tester'; --Parameter is null if the server use windows authentication
		DECLARE @userPassword VARCHAR(256) = 'Jelszo123'; --Parameter is null if the server use windows authentication
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testEnviromentId INT;

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
												@testsFilePath = @testsFilePath,
												@testsFileName  = @testsFileName,
												@userName  = @userName,
												@userPassword = @userPassword

		EXEC AddTestScriptDirectory_usp @directoryName = @directoryName,
										@databaseName = @databaseName;

		---------------------------------------------------
		--EXECUTE INTEGRATION TESTS:
		---------------------------------------------------
		EXEC ExecuteTests_usp	@directoryName = @directoryName,
								@databaseName = @databaseName;

		-------------------------------------------------
		--PRESENTATION OF INTEGRATION TESTS RESULTS:
		-------------------------------------------------
		SELECT * FROM TestResults;

		SET @TESTRESULT = 'True'
	END TRY
	BEGIN CATCH;
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
		SET @TESTRESULT = 'False'
	END CATCH;
		-------------------------------------------------
		--DELETE ENVIROMENT OF INTEGRATION TESTS
		-------------------------------------------------
		--DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';;
		--DECLARE @testEnviromentId INT;
		SELECT @testEnviromentId = ID  FROM TestFrameworkParameters WHERE DatabaseName = @databaseName;
		DELETE FROM TestScriptsDirectorys WHERE TestFrameworkParameters_ID_FK = @testEnviromentId;
		DELETE FROM TestFrameworkParameters WHERE ID = @testEnviromentId;
		PRINT '--';
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		PRINT '---------------------------------------------';
END;
GO

----------------------------------------------------------------------------------------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000';
		DECLARE @METHODNAME NVARCHAR(100) = 'Integration test';
		DECLARE	@TESTNAME NVARCHAR(200) = 'One white space in path of test files';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		PRINT '--';

		-------------------------------------------------
		--CONFIGURING TEST ENVIROMENT
		-------------------------------------------------
		DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
		DECLARE @testsFilePath  VARCHAR(4000) = 'c:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\00600_Tests\Run SqlScriptsWithPowershell\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
		DECLARE @userName VARCHAR(256) = 'tester'; --Parameter is null if the server use windows authentication
		DECLARE @userPassword VARCHAR(256) = 'Jelszo123'; --Parameter is null if the server use windows authentication
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testEnviromentId INT;

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
												@testsFilePath = @testsFilePath,
												@testsFileName  = @testsFileName,
												@userName  = @userName,
												@userPassword = @userPassword

		EXEC AddTestScriptDirectory_usp @directoryName = @directoryName,
										@databaseName = @databaseName;

		---------------------------------------------------
		--EXECUTE INTEGRATION TESTS:
		---------------------------------------------------
		EXEC ExecuteTests_usp	@directoryName = @directoryName,
								@databaseName = @databaseName;

		-------------------------------------------------
		--PRESENTATION OF INTEGRATION TESTS RESULTS:
		-------------------------------------------------
		SELECT * FROM TestResults;

		SET @TESTRESULT = 'True'
	END TRY
	BEGIN CATCH;
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
		SET @TESTRESULT = 'False'
	END CATCH;
		-------------------------------------------------
		--DELETE ENVIROMENT OF INTEGRATION TESTS
		-------------------------------------------------
		--DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';;
		--DECLARE @testEnviromentId INT;
		SELECT @testEnviromentId = ID  FROM TestFrameworkParameters WHERE DatabaseName = @databaseName;
		DELETE FROM TestScriptsDirectorys WHERE TestFrameworkParameters_ID_FK = @testEnviromentId;
		DELETE FROM TestFrameworkParameters WHERE ID = @testEnviromentId;
		PRINT '--';
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		PRINT '---------------------------------------------';
END;
GO

----------------------------------------------------------------------------------------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0003000';
		DECLARE @METHODNAME NVARCHAR(100) = 'Integration test';
		DECLARE	@TESTNAME NVARCHAR(200) = 'One white space and one underscore in path of test files';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		PRINT '--';

		-------------------------------------------------
		--CONFIGURING TEST ENVIROMENT
		-------------------------------------------------
		DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
		DECLARE @testsFilePath  VARCHAR(4000) = 'c:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\00600_Tests\Run_ SqlScriptsWithPowershell\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
		DECLARE @userName VARCHAR(256) = 'tester'; --Parameter is null if the server use windows authentication
		DECLARE @userPassword VARCHAR(256) = 'Jelszo123'; --Parameter is null if the server use windows authentication
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testEnviromentId INT;

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
												@testsFilePath = @testsFilePath,
												@testsFileName  = @testsFileName,
												@userName  = @userName,
												@userPassword = @userPassword

		EXEC AddTestScriptDirectory_usp @directoryName = @directoryName,
										@databaseName = @databaseName;

		---------------------------------------------------
		--EXECUTE INTEGRATION TESTS:
		---------------------------------------------------
		EXEC ExecuteTests_usp	@directoryName = @directoryName,
								@databaseName = @databaseName;

		-------------------------------------------------
		--PRESENTATION OF INTEGRATION TESTS RESULTS:
		-------------------------------------------------
		SELECT * FROM TestResults;

		SET @TESTRESULT = 'True'
	END TRY
	BEGIN CATCH;
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
		SET @TESTRESULT = 'False'
	END CATCH;
		-------------------------------------------------
		--DELETE ENVIROMENT OF INTEGRATION TESTS
		-------------------------------------------------
		--DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';;
		--DECLARE @testEnviromentId INT;
		SELECT @testEnviromentId = ID  FROM TestFrameworkParameters WHERE DatabaseName = @databaseName;
		DELETE FROM TestScriptsDirectorys WHERE TestFrameworkParameters_ID_FK = @testEnviromentId;
		DELETE FROM TestFrameworkParameters WHERE ID = @testEnviromentId;
		PRINT '--';
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		PRINT '---------------------------------------------';
END;
GO

----------------------------------------------------------------------------------------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0004000';
		DECLARE @METHODNAME NVARCHAR(100) = 'Integration test';
		DECLARE	@TESTNAME NVARCHAR(200) = 'One underscore in path of test files';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		PRINT '--';

		-------------------------------------------------
		--CONFIGURING TEST ENVIROMENT
		-------------------------------------------------
		DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
		DECLARE @testsFilePath  VARCHAR(4000) = 'c:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\00600_Tests\Run_SqlScriptsWithPowershell\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
		DECLARE @userName VARCHAR(256) = 'tester'; --Parameter is null if the server use windows authentication
		DECLARE @userPassword VARCHAR(256) = 'Jelszo123'; --Parameter is null if the server use windows authentication
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testEnviromentId INT;

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
												@testsFilePath = @testsFilePath,
												@testsFileName  = @testsFileName,
												@userName  = @userName,
												@userPassword = @userPassword

		EXEC AddTestScriptDirectory_usp @directoryName = @directoryName,
										@databaseName = @databaseName;

		---------------------------------------------------
		--EXECUTE INTEGRATION TESTS:
		---------------------------------------------------
		EXEC ExecuteTests_usp	@directoryName = @directoryName,
								@databaseName = @databaseName;

		-------------------------------------------------
		--PRESENTATION OF INTEGRATION TESTS RESULTS:
		-------------------------------------------------
		SELECT * FROM TestResults;

		SET @TESTRESULT = 'True'
	END TRY
	BEGIN CATCH;
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
		SET @TESTRESULT = 'False'
	END CATCH;
		-------------------------------------------------
		--DELETE ENVIROMENT OF INTEGRATION TESTS
		-------------------------------------------------
		--DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';;
		--DECLARE @testEnviromentId INT;
		SELECT @testEnviromentId = ID  FROM TestFrameworkParameters WHERE DatabaseName = @databaseName;
		DELETE FROM TestScriptsDirectorys WHERE TestFrameworkParameters_ID_FK = @testEnviromentId;
		DELETE FROM TestFrameworkParameters WHERE ID = @testEnviromentId;
		PRINT '--';
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		PRINT '---------------------------------------------';
END;
GO

----------------------------------------------------------------------------------------------------------------------------

BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0005000';
		DECLARE @METHODNAME NVARCHAR(100) = 'Integration test';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Path of test files without white space and underscore';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		PRINT '--';

		-------------------------------------------------
		--CONFIGURING TEST ENVIROMENT
		-------------------------------------------------
		DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';
		DECLARE @testsFilePath  VARCHAR(4000) = 'c:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\00600_Tests\RunSqlScriptsWithPowershell\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
		DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
		DECLARE @userName VARCHAR(256) = 'tester'; --Parameter is null if the server use windows authentication
		DECLARE @userPassword VARCHAR(256) = 'Jelszo123'; --Parameter is null if the server use windows authentication
		DECLARE @directoryName VARCHAR(256) = '00500_Programming_objects';
		DECLARE @testEnviromentId INT;

		EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
												@testsFilePath = @testsFilePath,
												@testsFileName  = @testsFileName,
												@userName  = @userName,
												@userPassword = @userPassword

		EXEC AddTestScriptDirectory_usp @directoryName = @directoryName,
										@databaseName = @databaseName;

		---------------------------------------------------
		--EXECUTE INTEGRATION TESTS:
		---------------------------------------------------
		EXEC ExecuteTests_usp	@directoryName = @directoryName,
								@databaseName = @databaseName;

		-------------------------------------------------
		--PRESENTATION OF INTEGRATION TESTS RESULTS:
		-------------------------------------------------
		SELECT * FROM TestResults;

		SET @TESTRESULT = 'True'
	END TRY
	BEGIN CATCH;
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
		SET @TESTRESULT = 'False'
	END CATCH;
		-------------------------------------------------
		--DELETE ENVIROMENT OF INTEGRATION TESTS
		-------------------------------------------------
		--DECLARE @databaseName VARCHAR(256) = 'AutomateRunTests';;
		--DECLARE @testEnviromentId INT;
		SELECT @testEnviromentId = ID  FROM TestFrameworkParameters WHERE DatabaseName = @databaseName;
		DELETE FROM TestScriptsDirectorys WHERE TestFrameworkParameters_ID_FK = @testEnviromentId;
		DELETE FROM TestFrameworkParameters WHERE ID = @testEnviromentId;
		PRINT '--';
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		PRINT '---------------------------------------------';
END;
GO

----------------------------------------------------------------------------------------------------------------------------
