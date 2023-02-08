CREATE TABLE [sales].[stores]
(
[store_id] [int] NOT NULL IDENTITY(1, 1),
[store_name] [varchar] (255) NOT NULL,
[phone] [varchar] (25) NULL,
[email] [varchar] (255) NULL,
[street] [varchar] (255) NULL,
[city] [varchar] (255) NULL,
[state] [varchar] (10) NULL,
[zip_code] [varchar] (5) NULL
)
GO
ALTER TABLE [sales].[stores] ADD CONSTRAINT [PK__stores__A2F2A30C947DD244] PRIMARY KEY CLUSTERED ([store_id])
GO
