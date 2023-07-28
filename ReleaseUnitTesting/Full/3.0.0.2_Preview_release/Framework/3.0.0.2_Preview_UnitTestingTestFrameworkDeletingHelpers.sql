PRINT N'UNIT TESTING HELPER DELETING START'

GO

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerDestructor_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerDestructor_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerConstructor_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerConstructor_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerFunctionFactory_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparerFunctionFactory_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparedTypeFactory_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparedTypeFactory_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparerFunctionDropper_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;	
	DROP PROCEDURE Assert.TablesComparerFunctionDropper_usp;
END;

IF EXISTS ( SELECT 1 FROM sys.objects WHERE  object_id = OBJECT_ID(N'Assert.TablesComparedTypeDropper_usp') AND type IN ( N'P', N'PC' ) )
BEGIN;
	DROP PROCEDURE Assert.TablesComparedTypeDropper_usp;
END;

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
BEGIN;
	DROP FUNCTION Assert.CompareTables_udf;
END;

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'Assert.CompareOrderedTables_udf') AND TYPE in (N'IF',N'FN',N'TF',N'FS',N'FT'))
BEGIN;
	DROP FUNCTION Assert.CompareOrderedTables_udf;
END;

IF EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name='Assert')
BEGIN
  EXEC sp_executesql N'DROP SCHEMA Assert';
END

GO
PRINT N'UNIT TESTING HELPER DELETING COMPLETE'

GO