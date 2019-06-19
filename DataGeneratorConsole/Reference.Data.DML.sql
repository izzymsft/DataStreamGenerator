
INSERT INTO dbo.Hospitals 
(HospitalName, StreetAddress, StreetAddress2, City, StateProvince, Zipcode, AnnualBudget, BedCount, DateCreated)
VALUES
('Advent Health', '400 Celebration Pl', 'Suite A300', 'Celebration', 'FL', '34747', 150000000.00, 987, CURRENT_TIMESTAMP),
('Orlando Health', '9400 Turkey Lake Rd', '', 'Dr Phillips', 'FL', '32819', 45000000.00, 433, CURRENT_TIMESTAMP),
('Nemours Childrens Hospital', '13535 Nemours Pkwy', 'Building 955', 'Orlando', 'FL', '32827', 95000000.00, 325, CURRENT_TIMESTAMP),
('St Jude Childrens Hospital', '262 Danny Thomas Pl', '', 'Memphis', 'TN', '38105', 100000000.00, 1025, CURRENT_TIMESTAMP),
('John Hopkins Hospital', '1800 Orleans St', '', 'Baltimore', 'MD', '21287', 725000000.00, 9500, CURRENT_TIMESTAMP);


SELECT HospitalId, HospitalName, StreetAddress, StreetAddress2, City, StateProvince, Zipcode, AnnualBudget, BedCount, DateCreated 
FROM dbo.Hospitals;