IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'VIRTUALMACHINE\Administrator')
CREATE LOGIN [VIRTUALMACHINE\Administrator] FROM WINDOWS
GO
CREATE USER [VIRTUALMACHINE\Administrator] FOR LOGIN [VIRTUALMACHINE\Administrator]
GO
