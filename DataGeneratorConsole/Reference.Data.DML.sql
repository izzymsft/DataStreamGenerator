
TRUNCATE TABLE dbo.Hospitals;

INSERT INTO dbo.Hospitals 
(HospitalName, StreetAddress, StreetAddress2, City, StateProvince, Zipcode, AnnualBudget, BedCount, DateCreated)
VALUES
('Advent Health', '400 Celebration Pl', 'Suite A300', 'Celebration', 'FL', '34747', 150000000.00, 987, CURRENT_TIMESTAMP),
('Orlando Health', '9400 Turkey Lake Rd', '', 'Dr Phillips', 'FL', '32819', 45000000.00, 433, CURRENT_TIMESTAMP),
('Nemours Childrens Hospital', '13535 Nemours Pkwy', 'Building 955', 'Orlando', 'FL', '32827', 95000000.00, 325, CURRENT_TIMESTAMP),
('St Jude Childrens Hospital', '262 Danny Thomas Pl', '', 'Memphis', 'TN', '38105', 100000000.00, 1025, CURRENT_TIMESTAMP),
('John Hopkins Hospital', '1800 Orleans St', '', 'Baltimore', 'MD', '21287', 725000000.00, 9500, CURRENT_TIMESTAMP);

SELECT *
FROM dbo.Hospitals;


TRUNCATE TABLE dbo.HospitalFeedback;

INSERT INTO dbo.HospitalFeedback
(FeedbackLanguage, DateCreated, FeedbackContent)
VALUES 
('en', CURRENT_TIMESTAMP, 'This is a very good visit so far. I am grateful that there is nothing bad today. It has been great so far.'),
('es', CURRENT_TIMESTAMP, 'Este ha sido un día muy fantástico. Los empleados del hospital, las enfermeras y los médicos nos han ayudado mucho hoy.'),
('fr', CURRENT_TIMESTAMP, 'Je suis très heureux. Nous avons un traitement fantastique'),
('pt-PT', CURRENT_TIMESTAMP, 'Estou muito feliz. Nós estamos tendo um tratamento fantástico'),
('en', CURRENT_TIMESTAMP, 'This has not been a good visit. I am unhappy about how my appointment has been going today. Very disappointed.'),
('es', CURRENT_TIMESTAMP, 'A equipe aqui tem sido muito rude para nós. Estamos muito desapontados'),
('fr', CURRENT_TIMESTAMP, 'Le personnel a été très impoli avec nous. Nous sommes très déçus'),
('pt-PT', CURRENT_TIMESTAMP, 'Isso é muito triste. Eu tenho esperado por mais de 8 horas. Eu não sei o que está acontecendo. Estou muito desapontado com a forma como esta nomeação está indo. Eu tenho que dizer que não está indo bem.');


SELECT * 
FROM 
dbo.HospitalFeedback;


TRUNCATE TABLE dbo.Patients;

INSERT INTO dbo.Patients (PatientId, FirstName, LastName, Gender, BodyWeight, DateOfBirth, StreetAddress, StreetAddress2, City, StateProvince, Zipcode, PCP, EmergencyContactName, EmergencyRelationship, EmergencyContactPhone, DateCreated, ProfileURL)
VALUES 
('356a192b7913b04c54574d18c28d46e6395428ab', 'Janet', 'Morrison', 'F', 135.66, '1980-06-22', '123 Main St', 'Suite 33', 'Windermere', 'FL', '34786', 'Richard Patel MD', 'Simon Lorenzo', 'Spouse', '4075551212', CURRENT_TIMESTAMP, ''),
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'Suzan', 'Morrison', 'F', 100.25, '2010-07-22', '123 Main St', 'Suite 33', 'Windermere', 'FL', '34786', 'Richard Patel MD', 'Simon Lorenzo', 'Parent', '4075551212', CURRENT_TIMESTAMP, ''),
('77de68daecd823babbb58edb1c8e14d7106e83bb', 'Jacob', 'Santiago', 'M', 149.70, '1989-08-01', '987 Main St', 'Apt 309', 'Miami', 'FL', '33179', 'Jabocio Sufax MD', 'Israel Lorenzo', 'Sibling', '3055551212', CURRENT_TIMESTAMP, ''),
('1b6453892473a467d07372d45eb05abc2031647a', 'Jaime', 'Santiago', 'F', 848.81, '1985-09-02', '987 Main St', 'Apt 309', 'Miami', 'FL', '33179', 'Richard Sufax MD', 'Israel Lorenzo', 'Sibling', '3055551212', CURRENT_TIMESTAMP, ''),
('ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'David', 'Fandango', 'M', 147.92, '1999-10-03', '66338 World Dr', 'Unit 188', 'Celebration', 'FL', '34744', 'Reshma Patel DO', 'Rachel Branson', 'Parent', '8135551212', CURRENT_TIMESTAMP, ''),
('c1dfd96eea8cc2b62785275bca38ac261256e278', 'Julia', 'Fandango', 'F', 246.02, '2000-11-04', '66338 World Dr', 'Unit 188', 'Celebration', 'FL', '34744', 'Reshma Patel DO', 'Rachel Branson', 'Parent', '8135551212', CURRENT_TIMESTAMP, ''),
('902ba3cda1883801594b6e1b452790cc53948fda', 'Katie', 'Fandango', 'F', 345.13, '2003-12-05', '66338 World Dr', 'Unit 188', 'Celebration', 'FL', '34744', 'Reshma Patel DO', 'Philpe Santana', 'Parent', '7865551212', CURRENT_TIMESTAMP, ''),
('fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f', 'Cysco', 'Morrison', 'M', 244.24, '1989-01-06', '456 Main St', '', 'Winter Garden', 'FL', '34777', 'Jenifer Lorenzana MD', 'Alfredo Lorenzana', 'Sibling', '4455551212', CURRENT_TIMESTAMP, ''),
('0ade7c2cf97f75d009975f4d720d1fa6c19f4897', 'Ahmed', 'Mohammed', 'M', 413.36, '1945-02-07', '66 Easter Blvd', '#315', 'Christmas', 'FL', '32709', 'Richard Lorenzana MD', 'Israel Isaiah', 'Parent', '4255551212', CURRENT_TIMESTAMP, ''),
('b1d5781111d84f7b3fe45a0852e59758cd7a87e5', 'Suzan', 'Mohammed', 'F', 142.46, '1950-03-08', '66 Easter Blvd', '#315', 'Christmas', 'FL', '32709', 'Richard Lorenzana MD', 'Israel Isaiah', 'Parent', '4255551212', CURRENT_TIMESTAMP, ''),
('17ba0791499db908433b80f37c5fbc89b870084b', 'Ismah', 'Abubakah', 'M', 241.55, '1969-04-09', '25 December Cir', '', 'Santa Claus', 'IN', '47579', 'Simon Mignon MD', 'Joshua Lorenzo', 'Uncle', '2125551218', CURRENT_TIMESTAMP, ''),
('7b52009b64fd0a2a49e6d8a939753077792b0554', 'Uzmah', 'Abubakah', 'M', 340.09, '2000-05-10', '25 December Cir', '', 'Santa Claus', 'IN', '47579', 'Michel Mignon MD', 'Joshua Lorenzo', 'Uncle', '2125551218', CURRENT_TIMESTAMP, ''),
('bd307a3ec329e10a2cff8fb87480823da114f8f4', 'Quinn', 'Morrison', 'M', 141.91, '1988-06-11', '610 Main St', '', 'Windermere', 'FL', '34786', 'April Santiagio DO', 'Zicy Lorenzo', 'Parent', '5162225518', CURRENT_TIMESTAMP, ''),
('fa35e192121eabf3dabf9f5ea6abdbcbc107ac3b', 'Raven', 'Santiago', 'F', 242.82, '1983-07-12', '1225 Christmas Dr', '', 'North Pole', 'AK', '99705', 'June Savana MD', 'Mary Mubiah', 'Parent', '9175550505', CURRENT_TIMESTAMP, ''),
('f1abd670358e036c31296e66b3b66c382ac00812', 'Rahul', 'Santiago', 'M', 143.73, '1977-09-13', '1225 Christmas Dr', '', 'North Pole', 'AK', '99705', 'Obadia Castro DO', 'Mary Mubiah', 'Parent', '9175550505', CURRENT_TIMESTAMP, '');

SELECT * 
FROM dbo.Patients;