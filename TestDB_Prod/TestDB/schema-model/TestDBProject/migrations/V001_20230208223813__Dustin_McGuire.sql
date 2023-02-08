SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating schemas'
GO
IF SCHEMA_ID(N'production') IS NULL
EXEC sp_executesql N'CREATE SCHEMA [production]
AUTHORIZATION [dbo]'
GO
IF SCHEMA_ID(N'sales') IS NULL
EXEC sp_executesql N'CREATE SCHEMA [sales]
AUTHORIZATION [dbo]'
GO
PRINT N'Creating [dbo].[TDRA_DRUGAMOUNT]'
GO
CREATE TABLE [dbo].[TDRA_DRUGAMOUNT]
(
[DRA_ID] [int] NOT NULL IDENTITY(1, 1),
[DRA_BOTTOMAMOUNT] [decimal] (18, 5) NULL,
[DRA_TOPAMOUNT] [decimal] (18, 5) NULL,
[UNI_ID] [int] NOT NULL,
[DRA_DCF] [int] NOT NULL,
[DRA_LASTUPD] [datetime] NULL,
[DRA_LASTUPDBY] [varchar] (100) NULL,
[ROWID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TDRA_DRUG__ROWID__6C5905DD] DEFAULT (newid()),
[DRA_CREATED_DATE] [datetime] NULL,
[DRA_CREATED_BY] [varchar] (100) NULL
)
GO
PRINT N'Creating primary key [Drum_Amount_Key] on [dbo].[TDRA_DRUGAMOUNT]'
GO
ALTER TABLE [dbo].[TDRA_DRUGAMOUNT] ADD CONSTRAINT [Drum_Amount_Key] PRIMARY KEY CLUSTERED ([DRA_ID])
GO
PRINT N'Creating [sales].[order_items]'
GO
CREATE TABLE [sales].[order_items]
(
[order_id] [int] NOT NULL,
[item_id] [int] NOT NULL,
[product_id] [int] NOT NULL,
[quantity] [int] NOT NULL,
[list_price] [decimal] (10, 2) NOT NULL,
[discount] [decimal] (4, 2) NOT NULL CONSTRAINT [DF__order_ite__disco__398D8EEE] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK__order_it__837942D4036887A4] on [sales].[order_items]'
GO
ALTER TABLE [sales].[order_items] ADD CONSTRAINT [PK__order_it__837942D4036887A4] PRIMARY KEY CLUSTERED ([order_id], [item_id])
GO
PRINT N'Creating [production].[brands]'
GO
CREATE TABLE [production].[brands]
(
[brand_id] [int] NOT NULL IDENTITY(1, 1),
[brand_name] [varchar] (255) NOT NULL
)
GO
PRINT N'Creating primary key [PK__brands__5E5A8E27DD0EF2FC] on [production].[brands]'
GO
ALTER TABLE [production].[brands] ADD CONSTRAINT [PK__brands__5E5A8E27DD0EF2FC] PRIMARY KEY CLUSTERED ([brand_id])
GO
PRINT N'Creating [production].[products]'
GO
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
PRINT N'Creating primary key [PK__products__47027DF51CD10AA4] on [production].[products]'
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [PK__products__47027DF51CD10AA4] PRIMARY KEY CLUSTERED ([product_id])
GO
PRINT N'Creating [production].[categories]'
GO
CREATE TABLE [production].[categories]
(
[category_id] [int] NOT NULL IDENTITY(1, 1),
[category_name] [varchar] (255) NOT NULL
)
GO
PRINT N'Creating primary key [PK__categori__D54EE9B48B813A32] on [production].[categories]'
GO
ALTER TABLE [production].[categories] ADD CONSTRAINT [PK__categori__D54EE9B48B813A32] PRIMARY KEY CLUSTERED ([category_id])
GO
PRINT N'Creating [production].[stocks]'
GO
CREATE TABLE [production].[stocks]
(
[store_id] [int] NOT NULL,
[product_id] [int] NOT NULL,
[quantity] [int] NULL
)
GO
PRINT N'Creating primary key [PK__stocks__E68284D3720CA96B] on [production].[stocks]'
GO
ALTER TABLE [production].[stocks] ADD CONSTRAINT [PK__stocks__E68284D3720CA96B] PRIMARY KEY CLUSTERED ([store_id], [product_id])
GO
PRINT N'Creating [sales].[stores]'
GO
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
PRINT N'Creating primary key [PK__stores__A2F2A30C947DD244] on [sales].[stores]'
GO
ALTER TABLE [sales].[stores] ADD CONSTRAINT [PK__stores__A2F2A30C947DD244] PRIMARY KEY CLUSTERED ([store_id])
GO
PRINT N'Creating [sales].[orders]'
GO
CREATE TABLE [sales].[orders]
(
[order_id] [int] NOT NULL IDENTITY(1, 1),
[customer_id] [int] NULL,
[order_status] [tinyint] NOT NULL,
[order_date] [date] NOT NULL,
[required_date] [date] NOT NULL,
[shipped_date] [date] NULL,
[store_id] [int] NOT NULL,
[staff_id] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK__orders__4659622938888FB1] on [sales].[orders]'
GO
ALTER TABLE [sales].[orders] ADD CONSTRAINT [PK__orders__4659622938888FB1] PRIMARY KEY CLUSTERED ([order_id])
GO
PRINT N'Creating [sales].[customers]'
GO
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
PRINT N'Creating primary key [PK__customer__CD65CB85D51BFFB1] on [sales].[customers]'
GO
ALTER TABLE [sales].[customers] ADD CONSTRAINT [PK__customer__CD65CB85D51BFFB1] PRIMARY KEY CLUSTERED ([customer_id])
GO
PRINT N'Creating [sales].[staffs]'
GO
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
PRINT N'Creating primary key [PK__staffs__1963DD9CCE81CC0E] on [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [PK__staffs__1963DD9CCE81CC0E] PRIMARY KEY CLUSTERED ([staff_id])
GO
PRINT N'Adding constraints to [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [UQ__staffs__AB6E61647A17BA64] UNIQUE NONCLUSTERED ([email])
GO
PRINT N'Creating [dbo].[GetFunction1]'
GO
CREATE   FUNCTION [dbo].[GetFunction1]
(
    @Id1 INT,
    @Id2 INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 1 "a"
);
GO
PRINT N'Creating [dbo].[Excel_Test]'
GO
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
PRINT N'Creating primary key [PK_Excel_Test] on [dbo].[Excel_Test]'
GO
ALTER TABLE [dbo].[Excel_Test] ADD CONSTRAINT [PK_Excel_Test] PRIMARY KEY CLUSTERED ([Int])
GO
PRINT N'Creating [dbo].[Table1]'
GO
CREATE TABLE [dbo].[Table1]
(
[Id] [int] NULL,
[Name] [varchar] (128) NULL
)
GO
PRINT N'Creating [dbo].[TestTable]'
GO
CREATE TABLE [dbo].[TestTable]
(
[aReallyLongNameToTest1] [int] NULL,
[aReallyLongNameToTest2] [nchar] (10) NULL,
[aReallyLongNameToTest3] [nchar] (10) NULL,
[aReallyLongNameToTest4] [nchar] (10) NULL,
[aReallyLongNameToTest5] [nchar] (10) NULL,
[aReallyLongNameToTest6] [nchar] (10) NULL,
[aReallyLongNameToTest7] [nchar] (10) NULL,
[aReallyLongNameToTest8] [nchar] (10) NULL,
[aReallyLongNameToTest9] [nchar] (10) NULL,
[aReallyLongNameToTest10] [nchar] (10) NULL,
[aReallyLongNameToTest11] [nchar] (10) NULL,
[aReallyLongNameToTest12] [nchar] (10) NULL
)
GO
PRINT N'Creating [dbo].[test1]'
GO
CREATE TABLE [dbo].[test1]
(
[MyDecimalColumn] [decimal] (5, 2) NULL,
[MyNumericColumn] [numeric] (10, 5) NULL
)
GO
PRINT N'Adding foreign keys to [production].[products]'
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [FK__products__brand___300424B4] FOREIGN KEY ([brand_id]) REFERENCES [production].[brands] ([brand_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [production].[products] ADD CONSTRAINT [FK__products__catego__2F10007B] FOREIGN KEY ([category_id]) REFERENCES [production].[categories] ([category_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [production].[stocks]'
GO
ALTER TABLE [production].[stocks] ADD CONSTRAINT [FK__stocks__product___3F466844] FOREIGN KEY ([product_id]) REFERENCES [production].[products] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [production].[stocks] ADD CONSTRAINT [FK__stocks__store_id__3E52440B] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [sales].[order_items]'
GO
ALTER TABLE [sales].[order_items] ADD CONSTRAINT [FK__order_ite__produ__3B75D760] FOREIGN KEY ([product_id]) REFERENCES [production].[products] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [sales].[order_items] ADD CONSTRAINT [FK__order_ite__order__3A81B327] FOREIGN KEY ([order_id]) REFERENCES [sales].[orders] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [sales].[orders]'
GO
ALTER TABLE [sales].[orders] ADD CONSTRAINT [FK__orders__customer__34C8D9D1] FOREIGN KEY ([customer_id]) REFERENCES [sales].[customers] ([customer_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [sales].[orders] ADD CONSTRAINT [FK__orders__store_id__35BCFE0A] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [sales].[orders] ADD CONSTRAINT [FK__orders__staff_id__36B12243] FOREIGN KEY ([staff_id]) REFERENCES [sales].[staffs] ([staff_id])
GO
PRINT N'Adding foreign keys to [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [FK__staffs__manager___286302EC] FOREIGN KEY ([manager_id]) REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs] ADD CONSTRAINT [FK__staffs__store_id__276EDEB3] FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

