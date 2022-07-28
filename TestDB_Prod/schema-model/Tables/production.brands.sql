CREATE TABLE [production].[brands]
(
[brand_id] [int] NOT NULL IDENTITY(1, 1),
[brand_name] [varchar] (255) NOT NULL
)
GO
ALTER TABLE [production].[brands] ADD CONSTRAINT [PK__brands__5E5A8E27DD0EF2FC] PRIMARY KEY CLUSTERED ([brand_id])
GO
