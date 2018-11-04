CREATE TABLE [dbo].[SignalToNoise] (
    [PuzzleId] INT       NOT NULL,
    [Across]   INT       NOT NULL,
    [Down]     INT       NOT NULL,
    [IsOpen]   BIT       NOT NULL,
    [Char]     NCHAR (1) NOT NULL,
    CONSTRAINT [PK_SignalToNoise] PRIMARY KEY CLUSTERED ([PuzzleId] ASC, [Across] ASC, [Down] ASC)
);

