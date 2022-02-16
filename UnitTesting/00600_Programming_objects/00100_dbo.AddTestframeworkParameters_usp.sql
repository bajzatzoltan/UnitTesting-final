CREATE 
--OR ALTER 
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
	IF (@databaseName IS NULL OR @testsFilePath IS NULL OR @serverName IS NULL)
		BEGIN;
			RAISERROR('NULL values of @databaseName or @testsFilePath or @serverName parameter are not allowed! ', 16, 1);
		END;
	
	INSERT INTO [dbo].[TestFrameworkParameters] (ServerName, DatabaseName, TestsFilePath, TestsFileName, UserName, UserPassword) 
										VALUES (@serverName, @databaseName, @testsFilePath, @testsFileName, @userName, @userPassword);
	SET @countInsertedRows = @@ROWCOUNT;
	SET @insertedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestFrameworkParameters was inserted: ', @countInsertedRows);
	RAISERROR (@insertedCountMessage, 0, 1) WITH NOWAIT;
END;
GO