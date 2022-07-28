CREATE TABLE [sales].[staffs]
(
[staff_id] [int] NOT NULL IDENTITY(1, 1),
[first_name] [varchar] (50) NOT NULL,
[last_name] [varchar] (50) NOT NULL,
[email] [varchar] (255) NOT NULL,
[phone] [varchar] (25) NULL,
[active] [tinyint] NOT NULL,
[store_id] [int] NOT NULL,
[manager_id] [int] NULL
)
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [PK__staffs__1963DD9CCE81CC0E] PRIMARY KEY CLUSTERED ([staff_id])
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [UQ__staffs__AB6E61647A17BA64] UNIQUE NONCLUSTERED ([email])
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [FK__staffs__manager___286302EC] FOREIGN KEY ([manager_id]) REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [FK__staffs__store_id__276EDEB3] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
