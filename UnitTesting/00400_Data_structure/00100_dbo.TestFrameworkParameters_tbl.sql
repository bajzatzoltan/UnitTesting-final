CREATE TABLE [dbo].[TestFrameworkParameters]
	(
		ID INT IDENTITY(1,1) NOT NULL,
		ServerName VARCHAR(256) NOT NULL,
		DatabaseName VARCHAR(256) NOT NULL,
		TestsFilePath VARCHAR(2000) NOT NULL,
		TestsFileName VARCHAR(256) NOT NULL,
		UserName VARCHAR(256),
		UserPassword VARCHAR(256)
		CONSTRAINT [TestFrameworkParameters_ID_PK] PRIMARY KEY CLUSTERED(ID ASC), 
		CONSTRAINT [TestFrameworkParameters_ServerNameDatabaseName_UN] UNIQUE (ServerName, DatabaseName)
	)