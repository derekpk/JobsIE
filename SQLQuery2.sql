USE JobsIE
GO
SELECT TblCompanies.Name, TblJobOffers.Title
    ,OfferDate 
    ,DATEADD(MONTH,1,OfferDate) AS OfferExpiryDate
FROM TblCompanies, TblJobOffers
WHERE TblCompanies.id=TblJobOffers.CompanyId;