-- ConsultaAtualizacaoFornecedorPendente

SELECT        dbo.TireSupplier.Description, dbo.TireSupplier.Email, dbo.TireSupplier.PhoneNumber, dbo.TireSupplier.ContactPerson, dbo.TirePrice.StampDate
FROM            dbo.TirePrice INNER JOIN
                         dbo.TireSupplier ON dbo.TirePrice.TireSupplierID = dbo.TireSupplier.ID
WHERE        (dbo.TirePrice.StampDate < GETDATE()) AND (dbo.TireSupplier.Status = 1)