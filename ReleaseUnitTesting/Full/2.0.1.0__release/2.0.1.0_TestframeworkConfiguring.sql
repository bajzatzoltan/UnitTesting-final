USE UnitTesting;
GO

-------------------------------------------------
--CONFIGURING TESTFRAMEWORK
-------------------------------------------------
EXEC dbo.AddTestframeworkParameters_usp @databaseName = 'AutomateRunTests',
										@testsFilePath = 'C:\Users\Bajzat.Zoltan\source\repos\AutomateRunTests\TestAutomateRunTests\00200_UnitTests\', --PATH OF POWERSHELL SCRIPT FILE
										@testsFileName  = 'RunTests_IntegratedSec.ps1'; --DEFAULT: RunTests_IntegratedSec.ps1
GO

-------------------------------------------------
--REGISTER TEST DIRECTORY
-------------------------------------------------
EXEC AddTestScriptDirectory_usp @directoryName = '00500_Programming_objects',
								@databaseName = 'AutomateRunTests'; --Database which you want to testing
GO
EXEC AddTestScriptDirectory_usp @directoryName = '00050_Create_TestEnviroment',
								@databaseName = 'AutomateRunTests'; --Database which you want to testing
GO
EXEC AddTestScriptDirectory_usp @directoryName = '09000_Delete_TestEnviroment',
								@databaseName = 'AutomateRunTests'; --Database which you want to testing
GO
