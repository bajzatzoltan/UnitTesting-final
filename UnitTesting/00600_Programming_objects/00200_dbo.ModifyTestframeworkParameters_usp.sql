CREATE 
--OR ALTER 
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
	DECLARE @whereString NVARCHAR(200);

	SET @dynstring = 'UPDATE [dbo].[TestFrameworkParameters] SET ';
	SET @updatedColumns = CONCAT_WS(',',
									' TestsFilePath = ''' + @testsFilePath + '''',
									' TestsFileName = '''+ @testsFileName + '''',
									' UserName = ''' + @userName + '''',
									' UserPassword = ''' + @userPassword + '''');

	IF (@serverName IS NOT NULL AND @databaseName IS NOT NULL)
		BEGIN;
			SET @whereString = CONCAT(' WHERE ServerName = ''', @serverName, ''' AND DatabaseName = ''', @databaseName, ''';') 
		END;
	
	IF (@updatedColumns NOT LIKE '' AND @whereString NOT LIKE '')
		BEGIN;
			SET @dynstring = @dynstring + @updatedColumns + @whereString;
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