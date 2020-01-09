USE [TireDB]
GO
/** Object:  Trigger [dbo].[InsertLog]    Script Date: 03/12/2019 21:53:56 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		(JLC; SDMR; NMAIM)
-- Create date: 03-12-2019
-- Description:	"A cada insert na tbl [dbo].[TirePrice] faz um insert na tbl [dbo].[TireLog]"
-- =============================================

ALTER TRIGGER [dbo].[InsertLog]
   ON  [dbo].[TirePrice]
   AFTER INSERT

AS 
BEGIN

	SET NOCOUNT ON;

    INSERT INTO [dbo].[TireLog]
           ([TireFileLayoutID] ,[LogTypeID] ,[Description] ,[StampDate] ,[StampUser])
           SELECT [TireSupplierID], 4, [Description], [StampDate], 1 FROM INSERTED
END