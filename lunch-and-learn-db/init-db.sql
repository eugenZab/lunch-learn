CREATE DATABASE LunchAndLearn;
GO

USE LunchAndLearn;

CREATE TABLE Events (
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Title NVARCHAR(50),
  Detail NVARCHAR(200),
  [Date] DATETIMEOFFSET,
  CreatedAt DATETIMEOFFSET NOT NULL,
  UpdatedAt DATETIMEOFFSET NOT NULL
);

INSERT INTO Events (Title, Detail, [Date], CreatedAt, UpdatedAt) VALUES
(N'AI', N'Artificial intelligence demo', '2019-06-12', GETDATE(), GETDATE()),
(N'GitLab', N'GitLab CICD review', '2019-06-19', GETDATE(), GETDATE()),
(N'Listeners', N'Listeners in Java demo', '2019-07-10', GETDATE(), GETDATE());

SELECT * FROM LunchAndLearn.dbo.Events;
