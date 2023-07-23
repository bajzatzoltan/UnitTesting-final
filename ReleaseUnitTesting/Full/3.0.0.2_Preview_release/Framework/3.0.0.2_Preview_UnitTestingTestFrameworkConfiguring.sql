USE UnitTesting
GO


DECLARE @databaseName VARCHAR(256) = 'TutorialsSqlServerUnitTestCiCd';--Database name which want to test
DECLARE @testsFilePath VARCHAR(2000) = 'C:\development\source\repos\TutorialsSqlServerUnitTestCiCd\TestIdeDependentTutorialsSqlServerUnitTestCiCd\UnitTests\'; --PATH OF POWERSHELL SCRIPT FILE
DECLARE	@testsFileName  VARCHAR(256) = 'RunTests.ps1'; --DEFAULT: RunTests.ps1
DECLARE	@userName VARCHAR(256)  = 'sa'; --Parameter is null if the server use windows authentication
DECLARE	@userPassword VARCHAR(256) = 'jelszo'; --Parameter is null if the server use windows authentication

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
EXEC AddTestScriptDirectory_usp @directoryName = 'CreateTestEnviroment',
								@databaseName = @databaseName;
EXEC AddTestScriptDirectory_usp @directoryName = 'DependentObjects\Objects\Sales\Programmability',
								@databaseName = @databaseName;
EXEC AddTestScriptDirectory_usp @directoryName = 'DeleteTestEnviroment',
								@databaseName = @databaseName;
