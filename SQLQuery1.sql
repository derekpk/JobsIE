SELECT Name, Title
FROM TblUsers u, TblJobOffers o, TblJobApplications a 
WHERE u.Id = a.UserId
AND o.Id = a.JobOfferId
AND u.Name BETWEEN 'dea' AND 'det'
ORDER BY u.Name 
DESC