USE UnitTesting
GO


DECLARE @databaseName VARCHAR(256) = 'databaseName';--Database name which want to test
DECLARE @testsFilePath VARCHAR(2000) = 'C:\source\repos\SolutionName\TestProjectName\00200_UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
DECLARE	@testsFileName  VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
DECLARE	@userName VARCHAR(256)  = 'username'; --Parameter is null if the server use windows authentication
DECLARE	@userPassword VARCHAR(256) = 'password'; --Parameter is null if the server use windows authentication

-------------------------------------------------
--CONFIGURING TESTFRAMEWORK
-------------------------------------------------
EXEC dbo.AddTestframeworkParameters_usp @databaseName = @databaseName,
										@testsFilePath = @testsFilePath,
										@testsFileName  = @testsFileName,
										@userName  = @userName,
										@userPassword = @userPassword;

-------------------------------------------------
--REGISTER TEST DIRECTORY
-------------------------------------------------
EXEC AddTestScriptDirectory_usp @directoryName = '00500_Programming_objects',
								@databaseName = @databaseName;
EXEC AddTestScriptDirectory_usp @directoryName = '00050_Create_TestEnviroment',
								@databaseName = @databaseName;
EXEC AddTestScriptDirectory_usp @directoryName = '09000_Delete_TestEnviroment',
								@databaseName = @databaseName;

