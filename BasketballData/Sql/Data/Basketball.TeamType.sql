DECLARE @AddressTypeStaging TABLE
(
   AddressTypeId TINYINT NOT NULL PRIMARY KEY,
   [Name] VARCHAR(8) NOT NULL UNIQUE
);

/***************************** Modify values here *****************************/

INSERT @AddressTypeStaging(AddressTypeId, [Name])
VALUES
   (1, 'Home'),
   (2, 'Work'),
   (3, 'School'),
   (4, 'Other');

/******************************************************************************/

MERGE Person.AddressType T
USING @AddressTypeStaging S ON S.AddressTypeId = T.AddressTypeId
WHEN MATCHED AND S.[Name] <> T.[Name] THEN
   UPDATE
   SET [Name] = S.[Name]
WHEN NOT MATCHED THEN
   INSERT(AddressTypeId, [Name])
   VALUES(S.AddressTypeId, S.[Name]);
