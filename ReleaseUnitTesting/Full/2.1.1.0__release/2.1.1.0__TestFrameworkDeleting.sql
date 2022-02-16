USE master ;  
GO  

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'UnitTesting')
BEGIN;
	DROP DATABASE UnitTesting; 
END;
GO