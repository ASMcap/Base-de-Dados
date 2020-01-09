SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		(JLC; SDMR; NMAIM)
-- Create date: 03-12-2019
-- Description:	"Procedimento para inserir um Layout do ficheiro de preços de um fornecedor na tbl [dbo].[TireFileLayout]"
-- =============================================
CREATE PROCEDURE [dbo].[InsereFileLayout1]
	-- Adicione aqui os parâmetros para o procedimento armazenado

	@Description varchar(150),
	@TireSupplierID int,
	@FileTypeID int,
    @StartWidth int,
    @EndWidth int NULL,
    @StartAspectRatio int ,
    @EndAspectRatio int NULL,
    @StartDiameter int ,
    @EndDiameter int NULL,
    @StartLoad int,
    @EndLoad int NULL,
    @StartSpeed int,
    @EndSpeed int NULL,
    @StartNoise int ,
    @EndNoise int NULL,
    @StartResistance int,
    @EndResistance int NULL,
    @StartGrip int,
    @EndGrip int NULL,
    @StartTaxCode int,
    @EndTaxCode int NULL,
    @StartPrice int,
    @EndPrice int NULL,
    @CharacterSeparator char(1),
    @QtyDecimalPlaces int,
    @ReplacementReferenceIdentifier varchar(70) NULL,
    @BeginDate date,
    @EndDate date NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT INTO [TireDB].[dbo].[TireFileLayout]
           ([Description]
           ,[TireSupplierID]
           ,[FileTypeID]
           ,[StartWidth]
           ,[EndWidth]
           ,[StartAspectRatio]
           ,[EndAspectRatio]
           ,[StartDiameter]
           ,[EndDiameter]
           ,[StartLoad]
           ,[EndLoad]
           ,[StartSpeed]
           ,[EndSpeed]
           ,[StartNoise]
           ,[EndNoise]
           ,[StartResistance]
           ,[EndResistance]
           ,[StartGrip]
           ,[EndGrip]
           ,[StartTaxCode]
           ,[EndTaxCode]
           ,[StartPrice]
           ,[EndPrice]
           ,[CharacterSeparator]
           ,[QtyDecimalPlaces]
           ,[ReplacementReferenceIdentifier]
           ,[BeginDate]
           ,[EndDate])
     VALUES
           (@Description
           ,@TireSupplierID
           ,@FileTypeID
           ,@StartWidth
           ,@EndWidth
           ,@StartAspectRatio
           ,@EndAspectRatio
           ,@StartDiameter
           ,@EndDiameter
           ,@StartLoad
           ,@EndLoad
           ,@StartSpeed
           ,@EndSpeed
           ,@StartNoise
           ,@EndNoise
           ,@StartResistance
           ,@EndResistance
           ,@StartGrip
           ,@EndGrip
           ,@StartTaxCode
           ,@EndTaxCode
           ,@StartPrice
           ,@EndPrice
           ,@CharacterSeparator
           ,@QtyDecimalPlaces
           ,@ReplacementReferenceIdentifier
           ,@BeginDate
           ,@EndDate);
END
GO