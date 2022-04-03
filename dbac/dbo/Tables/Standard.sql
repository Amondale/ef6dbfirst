CREATE TABLE [dbo].[Standard] (
    [StandardId]   INT          IDENTITY (1, 1) NOT NULL,
    [StandardName] VARCHAR (50) NULL,
    [Description]  VARCHAR (50) NULL,
    CONSTRAINT [PK_Standard] PRIMARY KEY CLUSTERED ([StandardId] ASC)
);

