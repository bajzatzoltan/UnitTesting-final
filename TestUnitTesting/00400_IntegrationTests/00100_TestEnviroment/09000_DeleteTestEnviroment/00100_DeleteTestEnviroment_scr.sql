USE master ;  
GO  

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'AutomateRunTests')
BEGIN;
	DROP DATABASE AutomateRunTests; 
END;
GO