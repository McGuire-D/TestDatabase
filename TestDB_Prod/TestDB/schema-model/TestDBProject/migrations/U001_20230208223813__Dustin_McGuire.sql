SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [production].[products]'
GO
ALTER TABLE [production].[products] DROP CONSTRAINT [FK__products__brand___300424B4]
GO
ALTER TABLE [production].[products] DROP CONSTRAINT [FK__products__catego__2F10007B]
GO
PRINT N'Dropping foreign keys from [production].[stocks]'
GO
ALTER TABLE [production].[stocks] DROP CONSTRAINT [FK__stocks__product___3F466844]
GO
ALTER TABLE [production].[stocks] DROP CONSTRAINT [FK__stocks__store_id__3E52440B]
GO
PRINT N'Dropping foreign keys from [sales].[order_items]'
GO
ALTER TABLE [sales].[order_items] DROP CONSTRAINT [FK__order_ite__produ__3B75D760]
GO
ALTER TABLE [sales].[order_items] DROP CONSTRAINT [FK__order_ite__order__3A81B327]
GO
PRINT N'Dropping foreign keys from [sales].[orders]'
GO
ALTER TABLE [sales].[orders] DROP CONSTRAINT [FK__orders__customer__34C8D9D1]
GO
ALTER TABLE [sales].[orders] DROP CONSTRAINT [FK__orders__store_id__35BCFE0A]
GO
ALTER TABLE [sales].[orders] DROP CONSTRAINT [FK__orders__staff_id__36B12243]
GO
PRINT N'Dropping foreign keys from [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] DROP CONSTRAINT [FK__staffs__manager___286302EC]
GO
ALTER TABLE [sales].[staffs] DROP CONSTRAINT [FK__staffs__store_id__276EDEB3]
GO
PRINT N'Dropping constraints from [dbo].[Excel_Test]'
GO
ALTER TABLE [dbo].[Excel_Test] DROP CONSTRAINT [PK_Excel_Test]
GO
PRINT N'Dropping constraints from [dbo].[TDRA_DRUGAMOUNT]'
GO
ALTER TABLE [dbo].[TDRA_DRUGAMOUNT] DROP CONSTRAINT [Drum_Amount_Key]
GO
PRINT N'Dropping constraints from [production].[brands]'
GO
ALTER TABLE [production].[brands] DROP CONSTRAINT [PK__brands__5E5A8E27DD0EF2FC]
GO
PRINT N'Dropping constraints from [production].[categories]'
GO
ALTER TABLE [production].[categories] DROP CONSTRAINT [PK__categori__D54EE9B48B813A32]
GO
PRINT N'Dropping constraints from [production].[products]'
GO
ALTER TABLE [production].[products] DROP CONSTRAINT [PK__products__47027DF51CD10AA4]
GO
PRINT N'Dropping constraints from [production].[stocks]'
GO
ALTER TABLE [production].[stocks] DROP CONSTRAINT [PK__stocks__E68284D3720CA96B]
GO
PRINT N'Dropping constraints from [sales].[customers]'
GO
ALTER TABLE [sales].[customers] DROP CONSTRAINT [PK__customer__CD65CB85D51BFFB1]
GO
PRINT N'Dropping constraints from [sales].[order_items]'
GO
ALTER TABLE [sales].[order_items] DROP CONSTRAINT [PK__order_it__837942D4036887A4]
GO
PRINT N'Dropping constraints from [sales].[orders]'
GO
ALTER TABLE [sales].[orders] DROP CONSTRAINT [PK__orders__4659622938888FB1]
GO
PRINT N'Dropping constraints from [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] DROP CONSTRAINT [PK__staffs__1963DD9CCE81CC0E]
GO
PRINT N'Dropping constraints from [sales].[staffs]'
GO
ALTER TABLE [sales].[staffs] DROP CONSTRAINT [UQ__staffs__AB6E61647A17BA64]
GO
PRINT N'Dropping constraints from [sales].[stores]'
GO
ALTER TABLE [sales].[stores] DROP CONSTRAINT [PK__stores__A2F2A30C947DD244]
GO
PRINT N'Dropping constraints from [dbo].[TDRA_DRUGAMOUNT]'
GO
ALTER TABLE [dbo].[TDRA_DRUGAMOUNT] DROP CONSTRAINT [DF__TDRA_DRUG__ROWID__6C5905DD]
GO
PRINT N'Dropping constraints from [sales].[order_items]'
GO
ALTER TABLE [sales].[order_items] DROP CONSTRAINT [DF__order_ite__disco__398D8EEE]
GO
PRINT N'Dropping [dbo].[test1]'
GO
DROP TABLE [dbo].[test1]
GO
PRINT N'Dropping [dbo].[TestTable]'
GO
DROP TABLE [dbo].[TestTable]
GO
PRINT N'Dropping [dbo].[Table1]'
GO
DROP TABLE [dbo].[Table1]
GO
PRINT N'Dropping [dbo].[Excel_Test]'
GO
DROP TABLE [dbo].[Excel_Test]
GO
PRINT N'Dropping [dbo].[GetFunction1]'
GO
DROP FUNCTION [dbo].[GetFunction1]
GO
PRINT N'Dropping [sales].[staffs]'
GO
DROP TABLE [sales].[staffs]
GO
PRINT N'Dropping [sales].[customers]'
GO
DROP TABLE [sales].[customers]
GO
PRINT N'Dropping [sales].[orders]'
GO
DROP TABLE [sales].[orders]
GO
PRINT N'Dropping [sales].[stores]'
GO
DROP TABLE [sales].[stores]
GO
PRINT N'Dropping [production].[stocks]'
GO
DROP TABLE [production].[stocks]
GO
PRINT N'Dropping [production].[categories]'
GO
DROP TABLE [production].[categories]
GO
PRINT N'Dropping [production].[products]'
GO
DROP TABLE [production].[products]
GO
PRINT N'Dropping [production].[brands]'
GO
DROP TABLE [production].[brands]
GO
PRINT N'Dropping [sales].[order_items]'
GO
DROP TABLE [sales].[order_items]
GO
PRINT N'Dropping [dbo].[TDRA_DRUGAMOUNT]'
GO
DROP TABLE [dbo].[TDRA_DRUGAMOUNT]
GO
PRINT N'Dropping schemas'
GO
IF SCHEMA_ID(N'production') IS NOT NULL
DROP SCHEMA [production]
GO
IF SCHEMA_ID(N'sales') IS NOT NULL
DROP SCHEMA [sales]
GO

