USE AutomateRunTests;
GO

-----------------------------------------------------
----Unit test number: 0003000-001
--CREATE 
--OR ALTER 
--PROCEDURE dbo.InsertFizzBuzzResultTable_usp (
--												@number_par INT
--											)	
--AS
--BEGIN;
--	DECLARE @fizzBuzzresult NVARCHAR(8);
--END;
-----------------------------------------------------
----Unit test number: 0003000-002
--CREATE 
--OR ALTER 
--PROCEDURE dbo.InsertFizzBuzzResultTable_usp (
--												@number_par INT
--											)	
--AS
--BEGIN;
--	DECLARE @fizzBuzzresult NVARCHAR(8);
--	IF (@number_par IS NULL)
--		BEGIN;
--			RAISERROR (15600,-1,-1, 'dbo.InsertFizzBuzzResultTable_usp');
--		END;
--END;
-----------------------------------------------------
----Unit test number: 0003000-003
--CREATE 
--OR ALTER 
--PROCEDURE dbo.InsertFizzBuzzResultTable_usp (
--												@number_par INT
--											)	
--AS
--BEGIN;
--	DECLARE @fizzBuzzresult NVARCHAR(8);
--	IF (@number_par IS NULL)
--		BEGIN;
--			RAISERROR (15600,-1,-1, 'dbo.InsertFizzBuzzResultTable_usp');
--		END;
--	INSERT INTO dbo.FizzBuzzResult (NumberParameter, FizzBuzzResult) VALUES (@number_par, 'TEST');
--END;

-----------------------------------------------------
----Unit test number: 0003000-004
--CREATE 
--OR ALTER 
--PROCEDURE dbo.InsertFizzBuzzResultTable_usp (
--												@number_par INT
--											)	
--AS
--BEGIN;
--	DECLARE @fizzBuzzresult NVARCHAR(8);
--	IF (@number_par IS NULL)
--		BEGIN;
--			RAISERROR (15600,-1,-1, 'dbo.InsertFizzBuzzResultTable_usp');
--		END;
--	INSERT INTO dbo.FizzBuzzResult (NumberParameter, FizzBuzzResult) VALUES (@number_par, dbo.GetFizzBuzzResult_udf(@number_par));
--END;

-----------------------------------------------------
--Refactor:
CREATE 
OR ALTER 
PROCEDURE dbo.InsertFizzBuzzResultTable_usp (
												@number_par INT
											)	
AS
BEGIN;
	DECLARE @fizzBuzzresult NVARCHAR(8);
	BEGIN TRY;
		IF (@number_par IS NULL)
			BEGIN;
				RAISERROR (15600,-1,-1, 'dbo.InsertFizzBuzzResultTable_usp');
			END;
		INSERT INTO dbo.FizzBuzzResult (NumberParameter, FizzBuzzResult) VALUES (@number_par, dbo.GetFizzBuzzResult_udf(@number_par));
	END TRY
	BEGIN CATCH;
		--TO DO LOGGING
		THROW;
	END CATCH;
END;