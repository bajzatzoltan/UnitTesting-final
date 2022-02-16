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