IF NOT EXISTS
   (
      SELECT *
      FROM sys.schemas s
      WHERE s.[name] = N'Basketball'
   )
BEGIN
   EXEC(N'CREATE SCHEMA [Basketball] AUTHORIZATION [dbo]');
END;
