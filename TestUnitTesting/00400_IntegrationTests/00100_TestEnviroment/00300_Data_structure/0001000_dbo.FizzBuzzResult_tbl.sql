USE AutomateRunTests;
GO

IF NOT EXISTS (SELECT 0 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = 'dbo' 
           AND TABLE_NAME = 'FizzBuzzResult')
 BEGIN
    CREATE TABLE [dbo].[FizzBuzzResult] (
        [Id]              INT       IDENTITY (1, 1) NOT NULL,
        [NumberParameter] INT       NOT NULL,
        [FizzBuzzResult]  NCHAR (8) NOT NULL
    );
 END
