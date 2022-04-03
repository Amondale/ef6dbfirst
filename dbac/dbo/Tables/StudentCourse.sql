CREATE TABLE [dbo].[StudentCourse] (
    [StudentId] INT NOT NULL,
    [CourseId]  INT NOT NULL,
    CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED ([StudentId] ASC, [CourseId] ASC),
    CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY ([CourseId]) REFERENCES [dbo].[Course] ([CourseId]),
    CONSTRAINT [FK_StudentCourse_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE ON UPDATE CASCADE
);

