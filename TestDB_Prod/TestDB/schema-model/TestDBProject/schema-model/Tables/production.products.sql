CREATE TABLE [production].[products]
(
[product_id] [int] NOT NULL IDENTITY(1, 1),
[product_name] [varchar] (255) NOT NULL,
[brand_id] [int] NOT NULL,
[category_id] [int] NOT NULL,
[model_year] [smallint] NOT NULL,
[list_price] [decimal] (10, 2) NOT NULL
)
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [PK__products__47027DF51CD10AA4] PRIMARY KEY CLUSTERED ([product_id])
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [FK__products__brand___300424B4] FOREIGN KEY ([brand_id]) REFERENCES [production].[brands] ([brand_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [FK__products__catego__2F10007B] FOREIGN KEY ([category_id]) REFERENCES [production].[categories] ([category_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
