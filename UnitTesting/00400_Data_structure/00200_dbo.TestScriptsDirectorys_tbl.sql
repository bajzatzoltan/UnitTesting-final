CREATE TABLE [dbo].[TestScriptsDirectorys]
	(
		ID INT IDENTITY(1,1) NOT NULL,
		DirectoryName VARCHAR(256) NOT NULL,
		TestFrameworkParameters_ID_FK INT NOT NULL,
		CONSTRAINT TestScriptsDirectorys_ID_PK PRIMARY KEY CLUSTERED (ID ASC),
		CONSTRAINT TestScriptsDirectorys_TestFrameworkParameters_ID_FK FOREIGN KEY (TestFrameworkParameters_ID_FK) REFERENCES [dbo].[TestFrameworkParameters](ID),
		CONSTRAINT TestScriptsDirectorys_DirectoryName_UN UNIQUE (TestFrameworkParameters_ID_FK, DirectoryName)
	)