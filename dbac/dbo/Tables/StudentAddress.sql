CREATE TABLE [dbo].[StudentAddress] (
    [StudentID] INT          NOT NULL,
    [Address1]  VARCHAR (50) NOT NULL,
    [Address2]  VARCHAR (50) NULL,
    [City]      VARCHAR (50) NOT NULL,
    [State]     VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_StudentAddress] PRIMARY KEY CLUSTERED ([StudentID] ASC),
    CONSTRAINT [FK_StudentAddress_Student] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);

