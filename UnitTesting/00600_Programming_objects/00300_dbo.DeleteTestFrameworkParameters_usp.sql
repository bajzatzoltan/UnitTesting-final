CREATE 
--OR ALTER 
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