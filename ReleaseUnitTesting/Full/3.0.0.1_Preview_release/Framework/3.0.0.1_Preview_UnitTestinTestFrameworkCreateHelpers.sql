PRINT N'Creating Schema [Assert]...';


IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name='Assert')
BEGIN
  EXEC sp_executesql N'CREATE SCHEMA Assert';
END


GO
PRINT N'Creating Procedure [Assert].[TablesComparedTypeDropper_usp]...';

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
PRINT N'Creating Procedure [Assert].[TablesComparerFunctionDropper_usp]...';

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
		 END
END;

GO
PRINT N'Creating Procedure [Assert].[TablesComparedTypeFactory_usp]...';

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
PRINT N'Creating Procedure [Assert].[TablesComparerFunctionFactory_usp]...';
GO
CREATE
OR ALTER 
PROCEDURE Assert.TablesComparerFunctionFactory_usp 
AS
BEGIN;
	SET NOCOUNT ON;
	DECLARE @sqlCommand NVARCHAR(MAX);

	SET @sqlCommand = N'CREATE
						OR ALTER 
						FUNCTION Assert.CompareTables_udf	(	
															@expectedTable Assert.ComparedType_ttyp READONLY, 
															@resultTable Assert.ComparedType_ttyp READONLY
															)
						RETURNS NVARCHAR(5) AS
						BEGIN;
							DECLARE @rowCounter INT;
							DECLARE @expectedRowCount INT;
							DECLARE @resultRowCount INT;
						
							SELECT @expectedRowCount = COUNT(*) FROM @expectedTable;
							SELECT @resultRowCount = COUNT(*) FROM @resultTable;
							IF (@expectedRowCount <> @resultRowCount)
								BEGIN;
									RETURN ''False'';
								END;

							SELECT @rowCounter = COUNT(*) FROM 
									(SELECT * FROM @expectedTable
									EXCEPT
									SELECT * FROM @resultTable) AS COMPARED
								IF @rowCounter <> 0
									BEGIN;
										RETURN ''False'';
									END;
		
								SELECT @rowCounter = COUNT(*) FROM 
									(SELECT * FROM @resultTable
									EXCEPT
									SELECT * FROM @expectedTable) AS COMPARED
								IF @rowCounter <> 0
									BEGIN;
										RETURN ''False'';
									END;

							RETURN ''True'';
						END;'
	EXEC sp_executesql @sqlCommand;

END;

GO
PRINT N'Creating Procedure [Assert].[TablesComparerConstructor_usp]...';

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
PRINT N'Creating Procedure [Assert].[TablesComparerDestructor_usp]...';

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
