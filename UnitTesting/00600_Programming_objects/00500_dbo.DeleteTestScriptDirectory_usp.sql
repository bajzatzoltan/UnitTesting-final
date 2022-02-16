CREATE 
--OR ALTER 
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
				AND DatabaseName = @databaseName;

	DELETE FROM dbo.TestScriptsDirectorys
		WHERE TestFrameworkParameters_ID_FK = @testframeworkParametersID 
				AND DirectoryName =  @directoryName;
	SET @countDeletedRows = @@ROWCOUNT;
	SET @deletedCountMessage = CONCAT('Rows number to UnitTesting.dbo.TestScriptsDirectorys was deleted: ', @countDeletedRows);
	RAISERROR (@deletedCountMessage, 0, 1) WITH NOWAIT;
END;
GO