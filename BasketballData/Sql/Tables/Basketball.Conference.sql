﻿IF OBJECT_ID(N'Basketball.Conference') IS NULL
BEGIN
    CREATE TABLE Basketball.Conference
    (
	    ConferenceId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	    Name NVARCHAR(40) NOT NULL,
	    Nickname NVARCHAR(10) NOT NULL,
	    CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
        UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

	    UNIQUE(Name, Nickname)
    );
END;
