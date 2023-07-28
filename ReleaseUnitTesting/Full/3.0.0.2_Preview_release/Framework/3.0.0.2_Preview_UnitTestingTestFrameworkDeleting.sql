GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
SET NUMERIC_ROUNDABORT OFF;

GO
:setvar DatabaseName "UnitTesting" --DATABASE OF UNIT TESTING
:setvar TestDatabaseName "DS3_DEV" --DATABASE OF TESTING

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
PRINT N'UNIT TESTING FRAMEWORK RELEASE DELETING START'


USE master ;  
GO  

PRINT N'Delete UnitTesting database';
IF EXISTS(SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
BEGIN;
	DROP DATABASE [$(DatabaseName)];
END;


GO
PRINT N'UNIT TESTING FRAMEWORK RELEASE DELETING COMPLETE'