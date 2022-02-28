CREATE 
--OR ALTER 
PROCEDURE dbo.ExecuteTests_usp (
												@databaseName VARCHAR(256), 
												@directoryName VARCHAR(256),
												@serverName VARCHAR(256) = @@SERVERNAME
												)
AS
BEGIN;
	DECLARE @serverName_var VARCHAR(256);
	DECLARE @databaseName_var VARCHAR(256);
	DECLARE @testsFilePath VARCHAR(2000);
	DECLARE @testsFileName VARCHAR(256);	
	DECLARE @testScriptsDirectoryName VARCHAR(256);
	DECLARE @userName VARCHAR (256);
	DECLARE @userPassword VARCHAR (256);
	DECLARE @pathAndFileName VARCHAR(2000)
	DECLARE @powershellScript VARCHAR(4000);

	BEGIN TRY;
	TRUNCATE TABLE dbo.TestResults
	DBCC CHECKIDENT ('dbo.TestResults', RESEED, 1) WITH NO_INFOMSGS

	SELECT	@serverName_var = TFP.ServerName, 
			@databaseName_var = TFP.DatabaseName, 
			@testsFilePath = TFP.TestsFilePath,
			@testsFileName = TFP.TestsFileName,
			@testScriptsDirectoryName = TSD.DirectoryName,
			@userName = TFP.UserName,
			@userPassword = TFP.UserPassword
		FROM dbo.TestFrameworkParameters AS TFP
		INNER JOIN dbo.TestScriptsDirectorys AS TSD
			ON TFP.ID = TSD.TestFrameworkParameters_ID_FK
		WHERE	TSD.DirectoryName = @directoryName
				AND TFP.DatabaseName = @databaseName
				AND TFP.ServerName = @serverName;
	
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
	END TRY
	BEGIN CATCH
		PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
		PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
		PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
		PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
		PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
	END CATCH;
END;
GO
