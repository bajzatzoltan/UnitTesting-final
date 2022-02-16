USE AutomateRunTests;
GO

-----------------------------------------------------
--Unit test number: 0002000-001
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-002
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	SET @fizzBuzzResult = '1';
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-003
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	SET @fizzBuzzResult = @number;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-004
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	IF(@number = 3)
--		BEGIN;
--			SET @fizzBuzzResult = 'Fizz';
--		END
--	ELSE
--		BEGIN;
--			SET @fizzBuzzResult = @number;
--		END;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-005
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	IF(@number = 3)
--		BEGIN;
--			SET @fizzBuzzResult = 'Fizz';
--		END
--	ELSE IF(@number = 5)
--		BEGIN;
--			SET @fizzBuzzResult = 'Buzz';
--		END
--	ELSE
--		BEGIN;
--			SET @fizzBuzzResult = @number;
--		END;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-006
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	IF(@number%3 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'Fizz';
--		END
--	ELSE IF(@number = 5)
--		BEGIN;
--			SET @fizzBuzzResult = 'Buzz';
--		END
--	ELSE
--		BEGIN;
--			SET @fizzBuzzResult = @number;
--		END;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-007
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	IF(@number%3 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'Fizz';
--		END
--	ELSE IF(@number%5 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'Buzz';
--		END
--	ELSE
--		BEGIN;
--			SET @fizzBuzzResult = @number;
--		END;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Unit test number: 0002000-008
--CREATE 
--OR ALTER 
--FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
--RETURNS NVARCHAR(8) AS
--BEGIN;
--	DECLARE @fizzBuzzResult NVARCHAR(8);
--	IF(@number%3 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'Fizz';
--		END
--	ELSE IF(@number%5 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'Buzz';
--		END
--	ELSE
--		BEGIN;
--			SET @fizzBuzzResult = @number;
--		END;
--	IF(@number%3 = 0 AND @number%5 = 0)
--		BEGIN;
--			SET @fizzBuzzResult = 'FizzBuzz';
--		END;
--	RETURN @fizzBuzzResult;
--END;
-----------------------------------------------------
--Refactor
CREATE 
OR ALTER 
FUNCTION dbo.GetFizzBuzzResult_udf (@number INT)
RETURNS NVARCHAR(8) AS
BEGIN;
	DECLARE @fizzBuzzResult NVARCHAR(8);
	IF(@number%3 = 0)
		BEGIN;
			SET @fizzBuzzResult = CONCAT(@fizzBuzzResult,'Fizz');
		END
	IF(@number%5 = 0)
		BEGIN;
			SET @fizzBuzzResult = CONCAT(@fizzBuzzResult,'Buzz');;
		END
	IF (@fizzBuzzResult IS NULL)
		BEGIN;
			SET @fizzBuzzResult = @number;
		END;
	RETURN @fizzBuzzResult;
END;