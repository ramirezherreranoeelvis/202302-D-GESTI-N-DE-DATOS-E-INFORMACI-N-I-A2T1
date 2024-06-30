USE BDJURIDICO;
GO


-- CLIENTE --
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTE]') AND type in (N'U'))
DROP TABLE [dbo].[CLIENTE]
GO

-- ESTADO --
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[ESTADO]') AND type in (N'U'))
DROP TABLE [dbo].[ESTADO]
GO
-- EXPEDIENTE --
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[EXPEDIENTE]') AND type in (N'U'))
DROP TABLE [dbo].[EXPEDIENTE]
GO

-- ACTIVIDAD --
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[ACTIVIDAD]') AND type in (N'U'))
DROP TABLE [dbo].[ACTIVIDAD]
GO