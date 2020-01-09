SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		(JLC; SDMR; NMAIM)
-- Create date: 03-12-2019
-- Description:	"Procedimento para inserir preços na tbl [dbo].[TirePrice]"
-- =============================================
CREATE PROCEDURE [dbo].[InserePreco1]
	-- Adicione aqui os parâmetros para o procedimento armazenado

	-- Exemplo @Param1 varchar(50) NOT NULL
		    @TireID int
           ,@TireSupplierID int
           ,@TireBrandID int
           ,@Description varchar(50)
           ,@Price decimal(10,2)
           ,@LoadIndexID int
           ,@SpeedIndexID int
           ,@RunFlat bit
           ,@EcoValueID int
           ,@Reference varchar(30)
           ,@Resistance nchar(1)
           ,@Grip nchar(1)
           ,@Noise int
           ,@DatePrice datetime
           ,@StampDate date
           ,@TireSeasonID int
           ,@NoiseCat int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Inserir instruções para o procedimento 
	INSERT INTO [dbo].[TirePrice]
           ([TireID]
           ,[TireSupplierID]
           ,[TireBrandID]
           ,[Description]
           ,[Price]
           ,[LoadIndexID]
           ,[SpeedIndexID]
           ,[RunFlat]
           ,[EcoValueID]
           ,[Reference]
           ,[Resistance]
           ,[Grip]
           ,[Noise]
           ,[DatePrice]
           ,[StampDate]
           ,[TireSeasonID]
           ,[NoiseCat])
     VALUES
           (@TireID
           ,@TireSupplierID 
           ,@TireBrandID 
           ,@Description 
           ,@Price 
           ,@LoadIndexID 
           ,@SpeedIndexID 
           ,@RunFlat 
           ,@EcoValueID 
           ,@Reference 
           ,@Resistance 
           ,@Grip 
           ,@Noise 
           ,@DatePrice 
           ,@StampDate 
           ,@TireSeasonID
           ,@NoiseCat )
	
END
GO