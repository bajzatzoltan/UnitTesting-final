BEGIN;	
	BEGIN TRY;
		SET NOCOUNT ON;
		DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-001';
		DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
		DECLARE	@TESTNAME NVARCHAR(200) = 'Function is exists';
		DECLARE @TESTRESULT NVARCHAR(10) = 'False';
		PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
		INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

		DECLARE @result NVARCHAR(8);
		DECLARE @number_par INT = 1;	
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-002';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 1 and return string: 1';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 1;
	DECLARE @expectedResult NVARCHAR(8) = '1';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-003';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 2 and return string: 2';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 2;
	DECLARE @expectedResult NVARCHAR(8) = '2';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-004';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 3 and return string: Buzz';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 3;
	DECLARE @expectedResult NVARCHAR(8) = 'Buzz';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-005';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 5 and return string: Fizz';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 5;
	DECLARE @expectedResult NVARCHAR(8) = 'Fizz';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-006';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 6 and return string: Buzz';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 6;
	DECLARE @expectedResult NVARCHAR(8) = 'Buzz';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-007';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 10 and return string: Fizz';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 10;
	DECLARE @expectedResult NVARCHAR(8) = 'Fizz';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------
BEGIN;	
	SET NOCOUNT ON;
	DECLARE	@TESTNUMBER NVARCHAR(50) = '0002000-008';
	DECLARE @METHODNAME NVARCHAR(100) = 'dbo.GetBuzzFizzResult_udf';
	DECLARE	@TESTNAME NVARCHAR(200) = 'Given parameter: 15 and return string: BuzzFizz';
	DECLARE @TESTRESULT NVARCHAR(10) = 'False';
	PRINT CONCAT(@TESTNUMBER,': ',@METHODNAME, ' - ', @TESTNAME); 
	INSERT INTO UnitTesting.dbo.TestResults(TestNumber, MethodName,TestName, TestResult) VALUES (@TESTNUMBER, @METHODNAME, @TESTNAME, @TESTRESULT)

	DECLARE @result NVARCHAR(8);
	DECLARE @number_par INT = 15;
	DECLARE @expectedResult NVARCHAR(8) = 'BuzzFizz';

	BEGIN TRY;
		SET @result =  dbo.GetBuzzFizzResult_udf
				(
					@number_par
				);
		
		IF (@expectedResult = @result)
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
		PRINT '---------------------------------------------';
END;
GO
---------------------------------------------