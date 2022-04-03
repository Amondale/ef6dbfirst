CREATE TABLE [dbo].[Course] (
    [CourseId]   INT               IDENTITY (1, 1) NOT NULL,
    [CourseName] VARCHAR (50)      NULL,
    [Location]   [sys].[geography] NULL,
    [TeacherId]  INT               NULL,
    CONSTRAINT [PK_Course_1] PRIMARY KEY CLUSTERED ([CourseId] ASC),
    CONSTRAINT [FK_Course_Teacher] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[Teacher] ([TeacherId]) ON DELETE CASCADE
);


GO
ALTER TABLE [dbo].[Course] NOCHECK CONSTRAINT [FK_Course_Teacher];

