﻿IF OBJECT_ID(N'Basketball.Season') IS NULL
BEGIN
   CREATE TABLE Basketball.Season
    (
	    SeasonId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	    YearRange NVARCHAR(10) NOT NULL UNIQUE,
	    CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
        UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET())
    );
END
