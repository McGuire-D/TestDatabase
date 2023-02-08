CREATE TABLE [sales].[customers]
(
[customer_id] [int] NOT NULL IDENTITY(1, 1),
[first_name] [varchar] (255) NOT NULL,
[last_name] [varchar] (255) NOT NULL,
[phone] [varchar] (25) NULL,
[email] [varchar] (255) NOT NULL,
[street] [varchar] (255) NULL,
[city] [varchar] (50) NULL,
[state] [varchar] (25) NULL,
[zip_code] [varchar] (5) NULL
)
GO
ALTER TABLE [sales].[customers] ADD CONSTRAINT [PK__customer__CD65CB85D51BFFB1] PRIMARY KEY CLUSTERED ([customer_id])
GO
