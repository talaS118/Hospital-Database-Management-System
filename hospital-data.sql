USE hospital;


INSERT INTO Room (roomID, capacity, feePerNight) VALUES
(1, 2, 115.99),
(2, 1, 132.99),
(3, 3, 50.99),
(4, 2, 115.99),
(5, 1, 132.99);


INSERT INTO Employee (employeeID, name, certificationNumber, street, city, state, phoneNumber) VALUES
(67, 'Tala Shraim', 6712, '3219 S 79th ave', 'Justice', 'IL', '708-647-6890'),
(68, 'Aseel Suleiman', 6713, '9322 S 39th ave', 'Bridgeview', 'IL', '708-231-4721'),
(69, 'Laya Nasan', 6714, '9123 S 89th ave', 'Oaklawn', 'IL', '708-924-9012'),
(70, 'Ameer Mohamed', 6715, '3331 S 19th ave', 'Naperville', 'IL', '708-305-3465'),
(71, 'Sarah Shraim', 6716, '9221 S 54th ave', 'Worth', 'IL', '708-762-5674'),
(72, 'Nadia Khatib', 6717, '4536 S 29th ave', 'Palos Heights', 'IL', '708-839-8761'),
(73, 'Kay Smith', 6718, '2111 S 89th ave', 'Palos Park', 'IL', '708-450-2394'),
(74, 'Sawsan Yousef', 6719, '3519 S 74th ave', 'Orland Park', 'IL', '708-596-7820'),
(75, 'Zach Naeim', 6720, '3281 S 49th ave', 'Tinley Park', 'IL', '708-421-1289'),
(76, 'Ahmad Yousef', 6721, '9321 S 59th ave', 'Chicago Ridge', 'IL', '708-357-4519');


INSERT INTO Patient (patientID, name, address, phoneNumber) VALUES
(100, 'Raneem Bader', '3203 S 59th Ave, Oak Lawn, IL', '708-321-9876'),
(101, 'Anas Ramadan', '4204 S 49th Ave, Palos Heights, IL', '708-432-6543'),
(102, 'Lynn Idris', '5105 S 39th Ave, Tinley Park, IL', '708-543-2345'),
(103, 'Deema Nahleh', '6066 S 29th Ave, Orland Park, IL', '708-654-6789'),
(104, 'Mark Nowak', '7207 S 19th Ave, Naperville, IL', '708-765-3456');


INSERT INTO Physician (employeeID, fieldOfExpertise) VALUES
(67, 'Cardiology'),
(68, 'Neurology'),
(69, 'Dermatology'),
(70, 'Pediatrics'),
(71, 'Psychiatry');


INSERT INTO Nurse (employeeID) VALUES
(72),
(73),
(74),
(75),
(76);


INSERT INTO HealthRecord (healthRecordID, disease, date, status, description, patientID) VALUES
(11, 'Epilepsy', '2024-07-21', 'Ongoing', 'Recurring seizures', 100),
(12, 'Diabetes', '2024-07-22', 'Ongoing', 'Insulin regulation', 101),
(13, 'Gallstones', '2024-07-23', 'Recovered', 'Abdominal pain', 102),
(14, 'Asthma', '2024-07-24', 'Ongoing', 'Recurrent Asthma attack', 103),
(15, 'Skin Cancer', '2024-07-25', 'Recovered', 'Skin bumps', 104);


INSERT INTO Instruction (instructionID, description, fee) VALUES
(51, 'attend physical therapy sessions', 39.99),
(52, 'monitor blood pressure', 41.99),
(53, 'check heart rate', 73.99),
(54, 'give medicine every 5 hours', 23.99),
(55, 'take care of wound', 89.99);


INSERT INTO Payable (payableID, amount, description, date) VALUES
(21, 189.99, 'Medicine', '2024-07-26'), 
(22, 60.99,'Physical', '2024-07-27'), 
(23, 40.99, 'Lab tests', '2024-07-28'), 
(24, 110.99, 'Blood tests', '2024-07-29'), 
(25, 85.99, 'Yearly check up', '2024-07-30');


INSERT INTO Payment (paymentID, date, amount) VALUES 
(11, '2024-07-30', 200.99),
(12, '2024-07-31', 50.99), 
(13, '2024-08-01', 30.99), 
(14, '2024-08-02', 100.99), 
(15, '2024-08-03', 75.99);


INSERT INTO Medication (medID, medType, amount) VALUES
(41, 'Tablets', 42.99),
(42, 'Lotion', 23.99),
(43, 'Ointment', 19.99),
(44, 'Eye Drops', 49.99),
(45, 'Cough Syrup', 19.99);


INSERT INTO Invoice (accountNumber, issueDate, startDate, endDate) VALUES
(91, '2024-07-23', '2024-06-23', '2024-07-23'),
(92, '2024-07-24', '2024-07-07', '2024-08-07'), 
(93, '2024-07-25', '2024-07-12', '2024-08-12'), 
(94, '2024-07-26', '2024-07-17', '2024-08-17'), 
(95, '2024-07-27', '2024-07-22', '2024-08-22'); 


INSERT INTO providesService (employeeID, patientID) VALUES
(67, 100),
(68, 101),
(69, 102),
(70, 103),
(71, 104),
(72, 100),
(73, 101),
(74, 102),
(75, 103),
(76, 104);


INSERT INTO Assigned (roomID, patientID, checkInDate, checkOutDate) VALUES
(1, 100, '2024-07-21', '2024-08-06'),
(2, 101, '2024-07-22', '2024-09-15'),
(3, 102, '2024-07-23', '2024-08-25'),
(4, 103, '2024-07-24', '2024-08-05'),
(5, 104, '2024-07-25', '2024-08-15');


INSERT INTO Monitors (employeeID, patientID, startDate, endDate) VALUES
(67, 100, '2024-07-22', '2024-07-27'),
(68, 101, '2024-07-23', '2024-07-28'), 
(69, 102, '2024-07-24', '2024-08-03'), 
(70, 103, '2024-07-25', '2024-07-30'), 
(71, 104, '2024-07-26', '2024-08-05'); 


INSERT INTO Executes (employeeID, instructionID, status, execution) VALUES
(72, 51, 'Finished', 'attend physical therapy sessions'),
(73, 52, 'On going', 'monitor blood pressure'),
(74, 53, 'Finished', 'check heart rate'),
(75, 54, 'Finished', 'give medicine every 5 hours'),
(76, 55, 'Finished', 'take care of wound');


INSERT INTO Administers (employeeID, medID, patientID, dateOfAdminister) VALUES
(72, 41, 100, '2024-07-23'), 
(73, 42, 101, '2024-07-24'), 
(74, 43, 102, '2024-07-25'), 
(75, 44, 103, '2024-07-26'), 
(76, 45, 104, '2024-07-27');


INSERT INTO Orders (employeeID, instructionID, patientID) VALUES
(67, 51, 100),
(68, 52, 101),
(69, 53, 102),
(70, 54, 103),
(71, 55, 104);

