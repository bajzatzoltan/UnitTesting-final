USE master;
GO 
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'AutomateRunTests')
    BEGIN;
        CREATE DATABASE [AutomateRunTests];
    END;