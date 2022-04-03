/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
Run the SqlPackage tool
Now, run SqlPackage.exe to export the ApexSQLBackup database. This step will create the BACPAC file for an existing database. 
The following sqlpackage.exe commands are used to export the database.

These commands are compatible with all the databases on a local instance or remote instance of SQL Server, 
or even an Azure SQL Databases.

sqlpackage.exe /a:Export /ssn:<SourceServerName> /sdn:<SourceDatabaseName> /su:<sourceUsername> /sp:<SourcePassword> /tf:<targetFileName>


sqlpackage /a:Export /ssn:ALMOVO\SQLExpress /sdn:Schooldb /tf:C:\users\amond /p:VerifyExtraction=False 


I've had nothing but trouble using SSMS to extract the DACPAC/BACPAC of databases. It has all these weird reference errors 
that prevent extracting the DACPAC, you can hit similar issues referencing system views and things like INFORMATION_SCHEMA. 
Once you load it into Visual Studio as a Project you can add references that clear up these issues.

Try using SqlPackage.exe to perform the extraction and make sure 

/p:VerifyExtraction=False 

is used. This should prevent verification of the schema after the extraction. SSMS uses SqlPackage.exe as well, 
but sets this value to True.


sqlpackage /a:Export /ssn:ALMOVO\SQLExpress /sdn:Schooldb /tf:C:\users\amond\schooldb.bacpac /p:VerifyExtraction=False

Connecting to database 'Schooldb' on server 'ALMOVO\SQLExpress'.
Extracting schema
Extracting schema from database
Resolving references in schema model
Validating schema model for data package
Validating schema
Exporting data from database
Exporting data
Processing Export.
Processing Table '[dbo].[Course]'.
Processing Table '[dbo].[Standard]'.
Processing Table '[dbo].[Student]'.
Processing Table '[dbo].[StudentAddress]'.
Processing Table '[dbo].[StudentCourse]'.
Processing Table '[dbo].[Teacher]'.
Successfully exported database and saved it to file 'C:\users\amond\schooldb.bacpac'.
Time elapsed 0:00:12.57



Now, let's import it:

sqlpackage /a:Import /ssn:(localdb)\mssqllocaldb /sdn:SchoolDB /tf:schooldb.bacpac


For me the right command to use was:

SqlPackage.exe /Action:Import /SourceFile:"SchoolDB.bacpac" /TargetConnectionString:"Data Source=(localdb)\mssqllocaldb;Initial Catalog=SchoolDB;Integrated Security=true;"


SqlPackage.exe /Action:Import /SourceFile:"SchoolDB.bacpac" /TargetConnectionString:"Data Source=(localdb)\mssqllocaldb;Initial Catalog=SchoolDB;Integrated Security=true;"
Importing to database 'SchoolDB' on server '(localdb)\mssqllocaldb'.
Creating deployment plan
Initializing deployment
*** The object [SchoolDB] exists in the target, but it will not be dropped even though you selected the 'Generate drop statements for objects that are in the target database but that are not in the source' check box.
*** The object [SchoolDB_log] exists in the target, but it will not be dropped even though you selected the 'Generate drop statements for objects that are in the target database but that are not in the source' check box.
Verifying deployment plan
Analyzing deployment plan
Importing package schema and data into database
Updating database
Importing data
Processing Import.
Disabling indexes.
Processing Table '[dbo].[Course]'.
Processing Table '[dbo].[Standard]'.
Processing Table '[dbo].[Student]'.
Processing Table '[dbo].[StudentAddress]'.
Processing Table '[dbo].[StudentCourse]'.
Processing Table '[dbo].[Teacher]'.
Enabling indexes.
Successfully imported database.
Time elapsed 0:00:14.90

*/