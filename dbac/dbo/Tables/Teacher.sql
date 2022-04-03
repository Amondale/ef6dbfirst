CREATE TABLE [dbo].[Teacher] (
    [TeacherId]   INT          IDENTITY (1, 1) NOT NULL,
    [TeacherName] VARCHAR (50) NULL,
    [StandardId]  INT          CONSTRAINT [DF_Teacher_StandardId] DEFAULT ((0)) NULL,
    [TeacherType] INT          NULL,
    CONSTRAINT [PK_Teacher_1] PRIMARY KEY CLUSTERED ([TeacherId] ASC),
    CONSTRAINT [FK_Teacher_Standard] FOREIGN KEY ([StandardId]) REFERENCES [dbo].[Standard] ([StandardId]) ON DELETE CASCADE
);

