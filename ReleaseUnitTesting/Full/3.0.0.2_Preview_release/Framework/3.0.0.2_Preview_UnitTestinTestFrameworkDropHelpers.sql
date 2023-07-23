
PRINT N'Drop Procedure [Assert].[TablesComparerDestructor_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparerDestructor_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparerDestructor_usp;
END;

GO
PRINT N'Drop Procedure [Assert].[TablesComparerConstructor_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparerConstructor_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparerConstructor_usp;
END;

GO
PRINT N'Drop Procedure [Assert].[TablesComparerFunctionFactory_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparerFunctionFactory_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparerFunctionFactory_usp;
END;

GO
PRINT N'Drop Procedure [Assert].[TablesComparedTypeFactory_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparedTypeFactory_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparedTypeFactory_usp;
END;

GO
PRINT N'Drop Procedure [Assert].[TablesComparerFunctionDropper_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparerFunctionDropper_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparerFunctionDropper_usp;
END;

GO
PRINT N'Drop Procedure [Assert].[TablesComparedTypeDropper_usp]...';
GO
IF EXISTS ( SELECT 1 FROM   sys.objects
				WHERE	object_id = OBJECT_ID(N'Assert.TablesComparedTypeDropper_usp')
						AND type IN ( N'P', N'PC' ) )
BEGIN;
   DROP PROCEDURE Assert.TablesComparedTypeDropper_usp;
END;

GO
PRINT N'Drop Schema [Assert]...';
GO
IF EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name='Assert')
BEGIN
  EXEC sp_executesql N'DROP SCHEMA Assert';
END
