GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;
 

GO
:setvar DatabaseName "UnitTesting"
:setvar DefaultFilePrefix "UnitTesting"
:setvar TestDatabaseName "DEV" --DATABASE OF TESTING


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
PRINT N'3.0.0.2 PREVIEW UNIT TESTING FRAMEWORK RELEASE DELETING START'


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

USE [$(TestDatabaseName)];
GO

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerDestructor_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerDestructor_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerConstructor_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerConstructor_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerFunctionFactory_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerFunctionFactory_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparedTypeFactory_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparedTypeFactory_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerFunctionDropper_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;	
	DROP PROCEDURE Assert.TablesComparerFunctionDropper_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparedTypeDropper_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparedTypeDropper_usp;
END;

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
BEGIN;
	DROP FUNCTION Assert.CompareTables_udf;
END;

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareOrderedTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
BEGIN;
	DROP FUNCTION Assert.CompareOrderedTables_udf;
END;

IF EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name='Assert')
BEGIN
  EXEC sp_executesql N'DROP SCHEMA Assert';
END