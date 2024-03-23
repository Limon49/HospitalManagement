CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    EmergencyContact VARCHAR(100)
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Specialty VARCHAR(100)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    RecordDate DATE,
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Position VARCHAR(100)
);
-- Additional functionality: Billing
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2),
    BillDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Additional functionality: Inventory Management
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2)
);

-- Additional functionality: Surgery Information
CREATE TABLE Surgeries (
    SurgeryID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    SurgeryDate DATE,
    SurgeryType VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Additional functionality: Lab Tests
CREATE TABLE LabTests (
    TestID INT PRIMARY KEY,
    PatientID INT,
    TestDate DATE,
    TestType VARCHAR(100),
    TestResult VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Additional functionality: Ward Information
CREATE TABLE Wards (
    WardID INT PRIMARY KEY,
    WardName VARCHAR(100),
    Capacity INT,
    Occupancy INT
);

-- Additional functionality: Admission Information
CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    WardID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (WardID) REFERENCES Wards(WardID)
);

-- Additional functionality: Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    FeedbackText TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Sample data insertion for testing purposes
INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, EmergencyContact)
VALUES (1, 'John', 'Doe', 'Male', '1980-01-01', '123 Main St, Anytown', '123-456-7890', 'john.doe@example.com', 'Jane Doe');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, Specialty)
VALUES (1, 'Emily', 'Smith', 'Female', '1975-05-15', '456 Oak St, Anycity', '987-654-3210', 'emily.smith@example.com', 'Cardiology');

-- More sample data insertion for other tables...

-- Sample query: Get all appointments for a specific patient
SELECT * FROM Appointments WHERE PatientID = 1;
