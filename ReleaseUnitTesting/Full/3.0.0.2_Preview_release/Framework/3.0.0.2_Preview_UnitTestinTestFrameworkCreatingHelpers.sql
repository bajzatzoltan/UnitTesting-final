PRINT N'UNIT TESTING HELPER CREATING START'
GO

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name='Assert')
BEGIN
  EXEC sp_executesql N'CREATE SCHEMA Assert';
END

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparedTypeDropper_usp  
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @sqlCommand NVARCHAR(MAX);
	IF EXISTS(SELECT 1 FROM sys.table_types WHERE  user_type_id = Type_id(N'[Assert].[ComparedType_ttyp]'))
		BEGIN;
			SET @sqlCommand = N'DROP TYPE Assert.ComparedType_ttyp';
			EXEC sp_executesql @sqlCommand;
		END;
END;

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparerFunctionDropper_usp  
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @sqlCommand NVARCHAR(MAX);
	IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
		 BEGIN
			SET @sqlCommand = N'DROP FUNCTION Assert.CompareTables_udf';
			EXEC sp_executesql @sqlCommand;
		 END;
	IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareOrderedTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
		 BEGIN
			SET @sqlCommand = N'DROP FUNCTION Assert.CompareOrderedTables_udf';
			EXEC sp_executesql @sqlCommand;
		 END;
END;

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparedTypeFactory_usp (
												@columnDefinition NVARCHAR(MAX)
												)
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @sqlCommand NVARCHAR(MAX);

	EXEC Assert.TablesComparerFunctionDropper_usp;

	EXEC Assert.TablesComparedTypeDropper_usp;
	
	SET @sqlCommand = CONCAT_WS(' ',N'CREATE TYPE [Assert].[ComparedType_ttyp] AS TABLE (', @columnDefinition, N')');
	EXEC sp_executesql @sqlCommand;
END;

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparerFunctionFactory_usp 
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @sqlCommandCreateCompareTablesUdf NVARCHAR(MAX);
	DECLARE @sqlCommandCreateCompareOrderedTablesUdf NVARCHAR(MAX);

	SET @sqlCommandCreateCompareTablesUdf = N'CREATE
						OR ALTER 
						FUNCTION Assert.CompareTables_udf	(	
															@expectedTable Assert.ComparedType_ttyp READONLY, 
															@resultTable Assert.ComparedType_ttyp READONLY
															)
						RETURNS NVARCHAR(5) AS
						BEGIN;
							DECLARE @rowCounter INT;
							DECLARE @result NVARCHAR(5) = ''True'';
	
							SELECT @rowCounter = COUNT(*) FROM 
									(SELECT * FROM @expectedTable
									EXCEPT
									SELECT * FROM @resultTable) AS COMPARED
								IF @rowCounter <> 0
									BEGIN;
										SET @result = ''False'';
									END;
		
								SELECT @rowCounter = COUNT(*) FROM 
									(SELECT * FROM @resultTable
									EXCEPT
									SELECT * FROM @expectedTable) AS COMPARED
								IF @rowCounter <> 0
									BEGIN;
										SET @result = ''False'';
									END;

							RETURN @result;
						END;'
	EXEC sp_executesql @sqlCommandCreateCompareTablesUdf;

	SET @sqlCommandCreateCompareOrderedTablesUdf = N'CREATE
						OR ALTER 
						FUNCTION Assert.CompareOrderedTables_udf	(	
															@expectedTable Assert.ComparedType_ttyp READONLY, 
															@resultTable Assert.ComparedType_ttyp READONLY
															)
						RETURNS NVARCHAR(5) AS
						BEGIN;
							DECLARE @counter INT = 1;
							DECLARE @expectedRowCount INT;
							DECLARE @resultRowCount INT;
							DECLARE @rowCounter INT;

							SELECT @expectedRowCount = COUNT(*) FROM @expectedTable;
							SELECT @resultRowCount = COUNT(*) FROM @resultTable;
							IF (@expectedRowCount <> @resultRowCount)
								BEGIN;
									RETURN ''False'';
								END;							
							
							WHILE @counter <= @expectedRowCount
							BEGIN;

								SELECT @rowCounter = COUNT(*) FROM 
										(SELECT TOP(@counter) * FROM @expectedTable
										EXCEPT
										SELECT TOP(@counter) * FROM @resultTable) AS COMPARED
									IF @rowCounter <> 0
										BEGIN;
											RETURN ''False'';
										END;
		
									SELECT @rowCounter = COUNT(*) FROM 
										(SELECT TOP(@counter) * FROM @resultTable
										EXCEPT
										SELECT TOP(@counter) * FROM @expectedTable) AS COMPARED
									IF @rowCounter <> 0
										BEGIN;
											RETURN ''False'';
										END;								

								SET @counter = @counter + 1;

							END;

							RETURN ''True'';
						END;'
	EXEC sp_executesql @sqlCommandCreateCompareOrderedTablesUdf;


END;

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparerConstructor_usp (
											@columnDefinition NVARCHAR(MAX)
											)
AS
BEGIN;
	SET NOCOUNT ON;
	EXEC Assert.TablesComparedTypeFactory_usp @columnDefinition = @columnDefinition;
	EXEC Assert.TablesComparerFunctionFactory_usp;
END;

GO

CREATE
OR ALTER 
PROCEDURE Assert.TablesComparerDestructor_usp 
AS
BEGIN;
	SET NOCOUNT ON;
	EXEC Assert.TablesComparerFunctionDropper_usp;
	EXEC Assert.TablesComparedTypeDropper_usp;
END;

GO
PRINT N'UNIT TESTING HELPER CREATING COMPLETED'
