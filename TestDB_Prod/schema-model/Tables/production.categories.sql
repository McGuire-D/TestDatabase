CREATE TABLE [production].[categories]
(
[category_id] [int] NOT NULL IDENTITY(1, 1),
[category_name] [varchar] (255) NOT NULL
)
GO
ALTER TABLE [production].[categories] ADD CONSTRAINT [PK__categori__D54EE9B48B813A32] PRIMARY KEY CLUSTERED ([category_id])
GO
