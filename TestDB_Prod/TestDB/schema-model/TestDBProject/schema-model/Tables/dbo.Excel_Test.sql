CREATE TABLE [dbo].[Excel_Test]
(
[Int] [int] NOT NULL,
[nchar] [nchar] (10) NULL,
[varchar] [varchar] (50) NULL,
[float] [float] NULL,
[decimal] [decimal] (30, 6) NULL,
[char] [char] (10) NULL
)
GO
ALTER TABLE [dbo].[Excel_Test] ADD CONSTRAINT [PK_Excel_Test] PRIMARY KEY CLUSTERED ([Int])
GO
