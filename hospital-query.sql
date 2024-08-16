-- 15 queries

SELECT employeeID
FROM orders
JOIN Patient ON orders.patientID = Patient.patientID
WHERE phoneNumber = '708-321-9876';


SELECT status, healthRecord.patientID, name
FROM healthRecord
JOIN monitors ON healthRecord.patientID = monitors.patientID
JOIN Patient ON Patient.patientID = healthRecord.patientID
WHERE disease = 'Diabetes';


SELECT roomID, providesService.patientID
FROM assigned 
JOIN providesService ON assigned.patientID = providesService.patientID
WHERE employeeID = 73;


SELECT employeeID
FROM Orders
WHERE employeeID IN (SELECT employeeID FROM Physician WHERE fieldOfExpertise = 'Cardiology');


SELECT Patient.patientID, name
FROM monitors
JOIN Patient ON Patient.patientID = monitors.patientID
WHERE Patient.patientID IN (SELECT patientID FROM providesService WHERE employeeID = 71);


SELECT instructionID
FROM Instruction 
WHERE instructionID IN (SELECT instructionID FROM executes WHERE status  = 'Finished');


SELECT SUM(amount) AS total
FROM payment
WHERE date = '2024-07-30';


SELECT AVG(amount) as averageAmount
FROM Medication 
Where amount > 20.99; 


SELECT COUNT(patientID) AS numPatientsLeft
FROM HealthRecord
WHERE status = 'Ongoing';


SELECT medID
FROM administers
WHERE administers.patientID = 103;


SELECT instructionID, description 
FROM Instruction
WHERE fee >= 50;


SELECT COUNT(*) as numRooms
FROM Room
WHERE capacity > 1 AND feePerNight > 100;


SELECT name, fieldOfExpertise
FROM Employee
JOIN Physician ON Employee.employeeID = Physician.employeeID;


SELECT name, Room.roomID
FROM Patient
JOIN Assigned ON Patient.patientID = Assigned.patientID
JOIN Room ON Assigned.roomID = Room.roomID;


SELECT name, medType, dateOfAdminister
FROM Patient
JOIN Administers ON Patient.patientID = Administers.patientID
JOIN Medication ON Administers.medID = Medication.medID;



-- 3 views

CREATE VIEW RoomCostOverview AS
SELECT 
r.roomID,
r.capacity,
r.feePerNight AS cost
FROM Room r;


CREATE VIEW PaymentAmountOverview AS
SELECT
p.paymentID,
p.date,
p.amount AS totalAmount
FROM Payment P;


CREATE VIEW RecentHealthRecord AS
SELECT
h.healthRecordID,
h.disease,
h.date,
h.status,
h.patientID
FROM HealthRecord h
WHERE h.date = CURDATE();



-- 2 transactions

START TRANSACTION;
INSERT INTO Patient (patientID, name, address, phoneNumber)
VALUE (106, 'test patient', 'test address', '111-111-1111');
INSERT INTO Assigned (roomID, patientID, checkInDate, checkOutDate)
VALUE (1, 106, '2024-08-07', NULL);
INSERT INTO HealthRecord (healthRecordID, disease, date, status, description, patientID)
VALUE (16, 'test disease', '2024-08-07', 'Ongoing', 'test description', 106);
COMMIT;


START TRANSACTION;
UPDATE HealthRecord
SET status = 'Recovered'
WHERE patientID = 103 AND status = 'Ongoing';
UPDATE Room
SET capacity = capacity + 1
WHERE roomID = (SELECT roomID FROM Assigned WHERE patientID = 103);
COMMIT;



-- 3 triggers

delimiter //
CREATE TRIGGER r1 
AFTER DELETE ON Patient 
FOR EACH ROW
BEGIN
    DELETE FROM assigned WHERE patientID = OLD.patientID;
END//
delimiter ;


delimiter //
CREATE TRIGGER r2
AFTER INSERT ON Patient
FOR EACH ROW
BEGIN
    IF NEW.address LIKE 'IL' THEN
        INSERT INTO assigned VALUES (1, NEW.patientID, NULL, NULL);
    END IF;
END //
delimiter ;


delimiter //
CREATE TRIGGER r3 
after insert ON healthRecord 
FOR EACH ROW
Begin
	update patient 
	set status = 'Ongoing'
	where patientID = New.patientID;
End//
delimiter ;