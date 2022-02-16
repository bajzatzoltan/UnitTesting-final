USE master;
GO

BEGIN;
	DECLARE @testsFilePath VARCHAR(2000) = 'C:\Users\Bajzat.Zoltan\source\repos\UnitTesting\TestUnitTesting\00400_IntegrationTests\00100_TestEnviroment\';
	DECLARE @testsFileName VARCHAR(256) = 'RunTests.ps1'
	
	DECLARE @serverName_var VARCHAR(256) = @@SERVERNAME;
	DECLARE @databaseName_var VARCHAR(256) = 'master';
	DECLARE @testScriptsDirectoryName VARCHAR(256);
	DECLARE @userName VARCHAR (256) = NULL;
	DECLARE @userPassword VARCHAR (256) = NULL;
	DECLARE @pathAndFileName VARCHAR(2000)
	DECLARE @powershellScript VARCHAR(4000);

--------------------------------
	SET @testScriptsDirectoryName = '00100_Indipendent_objects'
	If(@testsFilePath IS NULL OR @testsFileName IS NULL OR @testScriptsDirectoryName IS NULL OR @serverName_var IS NULL OR @databaseName_var IS NULL)
	BEGIN;
		RAISERROR('Some columns of TestScriptsDirectorys or TestFrameworkParameters table are null! ', 16, 1);
	END;
	
	SET @testsFilePath = REPLACE(@testsFilePath, ' ', '` '); 
	SET @pathAndFileName = CONCAT(@testsFilePath, @testsFileName);

	SET @powershellScript = CONCAT(	'powershell -command ', '"', @pathAndFileName,  '"',
								' -scriptDirectory ', '''', @testScriptsDirectoryName, '''',
								' -server ', '''', @serverName_var,'''', 
								' -database ', '''',  @databaseName_var,'''',
								' -userName ', '''',  @userName,'''',
								' -password ', '''',  @userPassword,'''');

	EXEC xp_cmdshell @powershellScript;
--------------------------------
	SET @testScriptsDirectoryName = '00300_Data_structure'
	If(@testsFilePath IS NULL OR @testsFileName IS NULL OR @testScriptsDirectoryName IS NULL OR @serverName_var IS NULL OR @databaseName_var IS NULL)
	BEGIN;
		RAISERROR('Some columns of TestScriptsDirectorys or TestFrameworkParameters table are null! ', 16, 1);
	END;
	
	SET @testsFilePath = REPLACE(@testsFilePath, ' ', '` '); 
	SET @pathAndFileName = CONCAT(@testsFilePath, @testsFileName);

	SET @powershellScript = CONCAT(	'powershell -command ', '"', @pathAndFileName,  '"',
								' -scriptDirectory ', '''', @testScriptsDirectoryName, '''',
								' -server ', '''', @serverName_var,'''', 
								' -database ', '''',  @databaseName_var,'''',
								' -userName ', '''',  @userName,'''',
								' -password ', '''',  @userPassword,'''');

	EXEC xp_cmdshell @powershellScript;
--------------------------------
	SET @testScriptsDirectoryName = '00500_Programming_objects'
	If(@testsFilePath IS NULL OR @testsFileName IS NULL OR @testScriptsDirectoryName IS NULL OR @serverName_var IS NULL OR @databaseName_var IS NULL)
	BEGIN;
		RAISERROR('Some columns of TestScriptsDirectorys or TestFrameworkParameters table are null! ', 16, 1);
	END;
	
	SET @testsFilePath = REPLACE(@testsFilePath, ' ', '` '); 
	SET @pathAndFileName = CONCAT(@testsFilePath, @testsFileName);

	SET @powershellScript = CONCAT(	'powershell -command ', '"', @pathAndFileName,  '"',
								' -scriptDirectory ', '''', @testScriptsDirectoryName, '''',
								' -server ', '''', @serverName_var,'''', 
								' -database ', '''',  @databaseName_var,'''',
								' -userName ', '''',  @userName,'''',
								' -password ', '''',  @userPassword,'''');

	EXEC xp_cmdshell @powershellScript;
--------------------------------
END;

