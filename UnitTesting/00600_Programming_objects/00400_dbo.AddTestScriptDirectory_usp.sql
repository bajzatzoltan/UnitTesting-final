CREATE 
--OR ALTER 
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
	BEGIN TRY;
		INSERT INTO dbo.TestScriptsDirectorys (DirectoryName, TestFrameworkParameters_ID_FK) VALUES (@directoryName, @testframeworkParametersID);
		SET @countInsertedRows = @@ROWCOUNT;
	END TRY
	BEGIN CATCH;
		SET @countInsertedRows = @@ROWCOUNT;
	END CATCH
	SET @insertedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestScriptsDirectorys was inserted: ', @countInsertedRows);
	RAISERROR (@insertedCountMessage, 0, 1) WITH NOWAIT;
END;
GO