
/*=========================================================================================
== Purpose: 
== 2018-04-01 ap: Created procedure
== 
== EXEC dbo.Character_Position_Generate @Across = 6, @Down = 6
=========================================================================================*/

CREATE PROCEDURE [dbo].[Character_Position_Generate] @Across SMALLINT,
                                                     @Down SMALLINT
AS
	BEGIN

	    IF OBJECT_ID('tempdb..#Character_Position') IS NOT NULL
		   DROP TABLE #Character_Position;

	    CREATE TABLE #Character_Position
	    ([Character] INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED ,
		Across     SMALLINT,
		Down     SMALLINT
	    );

	    DECLARE @A SMALLINT = 1, @D SMALLINT = 1;

	    WHILE @A <= @Across
			AND @D <= @Down
		   BEGIN

			  INSERT INTO #Character_Position
			  SELECT Across = @A,
				    Down = @D;

			  IF @D = @Down
				 BEGIN
					SET @D = 1;
					SET @A = @A + 1;
			  END;
				 ELSE
				 BEGIN
					SET @D = @D + 1;
			  END;
		   END;

	    SELECT [Character],
			 Across,
			 Down
	    FROM #Character_Position;
	END;
