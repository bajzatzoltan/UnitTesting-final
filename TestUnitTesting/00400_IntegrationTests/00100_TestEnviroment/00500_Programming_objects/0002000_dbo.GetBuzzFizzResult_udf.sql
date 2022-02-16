USE AutomateRunTests;
GO

CREATE 
OR ALTER 
FUNCTION dbo.GetBuzzFizzResult_udf (@number INT)
RETURNS NVARCHAR(8) AS
BEGIN;
	DECLARE @buzzFizzResult NVARCHAR(8);
	IF(@number%3 = 0)
		BEGIN;
			SET @buzzFizzResult = CONCAT(@buzzFizzResult,'Buzz');
		END
	IF(@number%5 = 0)
		BEGIN;
			SET @buzzFizzResult = CONCAT(@buzzFizzResult,'Fizz');;
		END
	IF (@buzzFizzResult IS NULL)
		BEGIN;
			SET @buzzFizzResult = @number;
		END;
	RETURN @buzzFizzResult;
END;