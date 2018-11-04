﻿
/*=========================================================================================
== Purpose: Generate a random string of given length
== 2018-04-01 ap: Created procedure
==
==
== -- Based on query from:
== -- Updated random password or string generator in T-Sql for Sql Server
== -- http://codebetter.com/raymondlewallen/2005/05/17/updated-random-password-or-string-generator-in-t-sql-for-sql-server/
== -- By Raymond Lewallen, retrieved 2015-03-22.
==
=========================================================================================*/

CREATE PROCEDURE [dbo].[GenerateNoise]
(@StringLength AS SMALLINT,
 @Noise       VARCHAR(MAX) = NULL OUT
)
AS
	BEGIN

	    IF @StringLength <= 0
		   RAISERROR('Cannot generate a random string of zero length.', 16, 1);

	    DECLARE @characters VARCHAR(100);
	    DECLARE @count INT;

	    SET @characters = '';

	    -- load up uppercase letters A – Z
	    BEGIN
		   SET @count = 65;
		   WHILE @count <= 90
			  BEGIN
				 SET @characters = @characters + CAST(CHAR(@count) AS CHAR(1));
				 SET @count = @count + 1;
			  END;
	    END;

	    SET @count = 0;
	    SET @Noise = '';


	    BEGIN
		   WHILE @count <= @StringLength
			  BEGIN

				 SET @Noise = @Noise + SUBSTRING(@characters, CAST(ABS(CHECKSUM(NEWID()))*RAND(@count) AS INT)%LEN(@characters)+1, 1);
				 SET @count = @count + 1;
			  END;
	    END;
	END;
