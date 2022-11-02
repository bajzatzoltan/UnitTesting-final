-------------------------------------------------
--2.1.1.0 
-------------------------------------------------
USE master;
GO
-------------------------------------------------
--SET SQL SERVER CONFIGURATION
-------------------------------------------------
-- To allow advanced options to be changed.  
EXEC sp_configure 'show advanced options', 1;  
GO  
-- To update the currently configured value for advanced options.  
RECONFIGURE;  
GO  

-- To enable the xp_cmdshell feature.  
EXEC sp_configure 'xp_cmdshell', 1;  
GO  
-- To update the currently configured value for this feature.  
RECONFIGURE;  
GO

-------------------------------------------------
--CREATE DATABASE
-------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'UnitTesting')
BEGIN;
	CREATE DATABASE UnitTesting;
END;
GO

USE UnitTesting;
GO
-------------------------------------------------
--CREATE TABLE OF TESTS RESULTS
-------------------------------------------------
IF NOT EXISTS (	SELECT object_id FROM sys.tables
			WHERE name = 'TestResults'
			AND SCHEMA_NAME(schema_id) = 'dbo'
			)
	BEGIN;
		CREATE TABLE [dbo].[TestResults]
			(
				ID INT IDENTITY(1,1) NOT NULL,
				TestNumber NVARCHAR(20) NOT NULL,
				TestResult NVARCHAR(10) NOT NULL,
				MethodName NVARCHAR(128) NOT NULL,
				TestName NVARCHAR(MAX) NOT NULL,
				[RunDatetime] DATETIME2 NOT NULL DEFAULT GETDATE()
				CONSTRAINT [TestResults_ID_PK] PRIMARY KEY CLUSTERED 
				(
					ID ASC
				) 
			)
	END;
GO

-------------------------------------------------
--CREATE TABLE OF TESTS FRAMEWORK PARAMETERS
-------------------------------------------------
IF NOT EXISTS (	SELECT object_id FROM sys.tables
			WHERE name = 'TestFrameworkParameters'
			AND SCHEMA_NAME(schema_id) = 'dbo'
			)
	BEGIN;
		CREATE TABLE [dbo].[TestFrameworkParameters]
			(
				ID INT IDENTITY(1,1) NOT NULL,
				ServerName VARCHAR(256) NOT NULL,
				DatabaseName VARCHAR(256) NOT NULL,
				TestsFilePath VARCHAR(2000) NOT NULL,
				TestsFileName VARCHAR(256) NOT NULL,
				UserName VARCHAR(256),
				UserPassword VARCHAR(256)
				CONSTRAINT [TestFrameworkParameters_ID_PK] PRIMARY KEY CLUSTERED(ID ASC), 
				CONSTRAINT [TestFrameworkParameters_ServerNameDatabaseName_UN] UNIQUE (ServerName, DatabaseName)
			)
	END;
GO
-------------------------------------------------
--CREATE TABLE OF TEST SCRIPTS DIRECTORY
-------------------------------------------------
IF NOT EXISTS (	SELECT object_id FROM sys.tables
			WHERE name = 'TestScriptsDirectorys'
			AND SCHEMA_NAME(schema_id) = 'dbo'
			)
	BEGIN;
		CREATE TABLE [dbo].[TestScriptsDirectorys]
			(
				ID INT IDENTITY(1,1) NOT NULL,
				DirectoryName VARCHAR(256) NOT NULL,
				TestFrameworkParameters_ID_FK INT NOT NULL,
				CONSTRAINT TestScriptsDirectorys_ID_PK PRIMARY KEY CLUSTERED (ID ASC),
				CONSTRAINT TestScriptsDirectorys_TestFrameworkParameters_ID_FK FOREIGN KEY (TestFrameworkParameters_ID_FK) REFERENCES [dbo].[TestFrameworkParameters](ID),
				CONSTRAINT TestScriptsDirectorys_DirectoryName_UN UNIQUE (TestFrameworkParameters_ID_FK, DirectoryName)
			)
	END;
GO

-------------------------------------------------
--CREATE PROCEDURE OF ADD TEST FRAMEWORK PARAMETERS
-------------------------------------------------
CREATE 
OR ALTER 
PROCEDURE dbo.AddTestframeworkParameters_usp (
															@serverName VARCHAR(256) = @@SERVERNAME,
															@databaseName VARCHAR(256),
															@testsFilePath VARCHAR(2000),
															@testsFileName VARCHAR(256) = 'RunTests.ps1',
															@userName VARCHAR(256) = NULL,
															@userPassword VARCHAR(256) = NULL
															)
AS 
BEGIN;
	SET NOCOUNT ON;
	DECLARE @countInsertedRows INT;
	DECLARE @insertedCountMessage NVARCHAR(200);
	IF (@databaseName IS NULL AND @testsFilePath IS NULL)
		BEGIN;
			RAISERROR('NULL values of @databaseName or @testsFilePath parameter are not allowed! ', 16, 1);
		END;
	
	INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
										VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
	SET @countInsertedRows = @@ROWCOUNT;
	SET @insertedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestFrameworkParameters was inserted: ', @countInsertedRows);
	RAISERROR (@insertedCountMessage, 0, 1) WITH NOWAIT;
END;
GO

-------------------------------------------------
--CREATE PROCEDURE OF MODIFY TEST FRAMEWORK PARAMETERS
-------------------------------------------------
CREATE 
OR ALTER 
PROCEDURE dbo.ModifyTestframeworkParameters_usp (
															@serverName VARCHAR(256) = @@SERVERNAME,
															@databaseName VARCHAR(256),
															@testsFilePath VARCHAR(2000)= NULL,
															@testsFileName VARCHAR(256) = NULL,
															@userName VARCHAR(256) = NULL,
															@userPassword VARCHAR(256) = NULL
															)
AS 
BEGIN;
	SET NOCOUNT ON;
	DECLARE @dynstring NVARCHAR(800);
	DECLARE @updatedColumns NVARCHAR(500);
	DECLARE @countUpdatedRows INT;
	DECLARE @updatedCountMessage NVARCHAR(200);

	SET @dynstring = 'UPDATE [dbo].[TestFrameworkParameters] SET ';
	SET @updatedColumns = CONCAT_WS(',',
									'ServerName = ' + @serverName,
									'DatabaseName = ' + @databaseName, 
									'TestsFilePath = ' + @testsFilePath, 
									'TestsFileName = '+ @testsFileName,
									'UserName = ' + @userName,
									'UserPassword = ' + @userPassword);
	IF (@updatedColumns NOT LIKE '')
		BEGIN;
			SET @dynstring = @dynstring + @updatedColumns;
			EXEC sp_executesql @dynstring;
			SET @countUpdatedRows = @@ROWCOUNT;
			SET @updatedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestFrameworkParameters was updated: ', @countUpdatedRows);
			RAISERROR (@updatedCountMessage, 0, 1) WITH NOWAIT;
		END;
	ELSE
		BEGIN;
			SET @countUpdatedRows = @@ROWCOUNT;
			SET @updatedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestFrameworkParameters was updated: ', @countUpdatedRows);
			RAISERROR (@updatedCountMessage, 0, 1) WITH NOWAIT;
		END;
END;
GO

-------------------------------------------------
--CREATE PROCEDURE OF DELETE TEST FRAMEWORK PARAMETERS
-------------------------------------------------
CREATE 
OR ALTER 
PROCEDURE dbo.DeleteTestframeworkParameters_usp (
																@serverName VARCHAR(256) = @@SERVERNAME,
																@databaseName VARCHAR(256)
																)
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @countDeletedRows INT;
	DECLARE @deletedCountMessage NVARCHAR(200);
	DELETE FROM dbo.TestFrameworkParameters WHERE ServerName = @serverName AND DatabaseName = @databaseName;
	SET @countDeletedRows = @@ROWCOUNT;
	SET @deletedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestFrameworkParameters was deleted: ', @countDeletedRows);
	RAISERROR (@deletedCountMessage, 0, 1) WITH NOWAIT;
END;
GO

-------------------------------------------------
--CREATE PROCEDURE OF ADD TEST SCRIPTS DIRECTORY
-------------------------------------------------
CREATE 
OR ALTER 
PROCEDURE dbo.AddTestScriptDirectory_usp (	
															@serverName VARCHAR(256) = @@SERVERNAME,
															@databaseName VARCHAR(256),
															@directoryName VARCHAR(256)
															)
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @testframeworkParametersID INT;
	DECLARE @countInsertedRows INT;
	DECLARE @insertedCountMessage NVARCHAR(200);

	SELECT @testframeworkParametersID = ID FROM dbo.TestFrameworkParameters			
		WHERE ServerName = @serverName 
				AND DatabaseName = @databaseName;

	INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK) VALUES (@directoryName, @testframeworkParametersID);
	SET @countInsertedRows = @@ROWCOUNT;
	SET @insertedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestScriptsDirectorys was inserted: ', @countInsertedRows);
	RAISERROR (@insertedCountMessage, 0, 1) WITH NOWAIT;
END;
GO

-------------------------------------------------
--CREATE PROCEDURE OF ADD TEST SCRIPTS DIRECTORY
-------------------------------------------------
CREATE 
OR ALTER 
PROCEDURE dbo.DeleteTestScriptDirectory_usp (	
															@serverName VARCHAR(256) = @@SERVERNAME,
															@databaseName VARCHAR(256),
															@directoryName VARCHAR(256)
															)

AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @testframeworkParametersID INT;
	DECLARE @countDeletedRows INT;
	DECLARE @deletedCountMessage NVARCHAR(200);
	SELECT @testframeworkParametersID = ID FROM dbo.TestFrameworkParameters			
		WHERE ServerName = @serverName 
				AND DatabaseName = 'AutomateRunTests';

	DELETE FROM dbo.TestScriptsDirectorys
		WHERE TestFrameworkParameters_ID_FK = @testframeworkParametersID 
				AND DirectoryName =  @directoryName;
	SET @countDeletedRows = @@ROWCOUNT;
	SET @deletedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestScriptsDirectorys was deleted: ', @countDeletedRows);
	RAISERROR (@deletedCountMessage, 0, 1) WITH NOWAIT;
END;
GO
-------------------------------------------------
--CREATE PROCEDURE OF TESTS EXECUTER
-------------------------------------------------
CREATE 
OR ALTER 
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
	SET NOCOUNT ON;
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


