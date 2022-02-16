BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0003000-001';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.InsertFizzBuzzResultTable_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Procedure is exists';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @result NVARCHAR(8);
		DECLARE @number_par INT = 1;	
		DECLARE @currentID INT = IDENT_CURRENT('dbo.FizzBuzzResult');

		EXEC dbo.InsertFizzBuzzResultTable_usp @number_par

		SET @TESTRESULT = 'True';
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;
		
		DELETE FROM dbo.FizzBuzzResult WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.FizzBuzzResult', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0003000-002';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.InsertFizzBuzzResultTable_usp';
		DECLARE	@TESTNAME NVARCHAR(200) =  'Given parameter: NULL, result ERROR_NUMBER: 15600';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @result NVARCHAR(8);
		DECLARE @number_par INT = NULL;	
		DECLARE @currentID INT = IDENT_CURRENT('dbo.FizzBuzzResult');

		EXEC dbo.InsertFizzBuzzResultTable_usp @number_par

	END TRY
	BEGIN CATCH;
			--PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			--PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			--PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			--PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			IF (ERROR_NUMBER() = 15600)
				BEGIN;
					SET @TESTRESULT = 'True'
				END;
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;

		DELETE FROM dbo.FizzBuzzResult WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.FizzBuzzResult', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0003000-003';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.InsertFizzBuzzResultTable_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 1, NumberParameter value from FizzBuzzResult table: 1';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @result NVARCHAR(8)
		DECLARE @expectedResult NVARCHAR(8) = '1';
		DECLARE @number_par INT = 1;	
		DECLARE @currentID INT = IDENT_CURRENT('dbo.FizzBuzzResult');

		EXEC dbo.InsertFizzBuzzResultTable_usp @number_par

		SELECT @result = NumberParameter FROM dbo.FizzBuzzResult WHERE ID = @currentID+1;
		IF (@result = @expectedResult)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;

		DELETE FROM dbo.FizzBuzzResult WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.FizzBuzzResult', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON; 
	BEGIN TRY;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0003000-004';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.InsertFizzBuzzResultTable_usp';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 1, FizzBuzzResult value from FizzBuzzResult table: dbo.GetFizzBuzzResult_udf results';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)
		
		DECLARE @result NVARCHAR(8)
		DECLARE @number_par INT = 1;
		DECLARE @expectedResult NVARCHAR(8) = dbo.GetFizzBuzzResult_udf(@number_par); --THE PROCEDURE DEPENDS ON THE dbo.GetFizzBuzzResult_udf, WHICH IS TESTED!!
		DECLARE @currentID INT = IDENT_CURRENT('dbo.FizzBuzzResult');

		EXEC dbo.InsertFizzBuzzResultTable_usp @number_par

		SELECT @result = FizzBuzzResult FROM dbo.FizzBuzzResult WHERE ID = @currentID+1;
		IF (@result = @expectedResult)
			BEGIN;
				SET @TESTRESULT = 'True';
			END;
	END TRY
	BEGIN CATCH;
			PRINT( CONCAT('ERROR_NUMBER: ', ERROR_NUMBER()));
			PRINT( CONCAT('ERROR_SEVERITY: ', ERROR_SEVERITY()));
			PRINT( CONCAT('ERROR_STATE: ', ERROR_STATE()));
			--PRINT( CONCAT('ERROR_PROCEDURE: ', ERROR_PROCEDURE()));
			PRINT( CONCAT('ERROR_MESSAGE: ', ERROR_MESSAGE()));
			SET @TESTRESULT = 'False'
	END CATCH;
		PRINT CONCAT('TEST RESULT: ', @TESTRESULT);
		UPDATE UnitTesting.dbo.TestResults SET TestResult = @TESTRESULT WHERE TestNumber = @TESTNUMBER;

		DELETE FROM dbo.FizzBuzzResult WHERE ID > @currentID;
		DBCC CHECKIDENT ('dbo.FizzBuzzResult', RESEED, @currentID) WITH NO_INFOMSGS;

		PRINT '---------------------------------------------';
END;
GO