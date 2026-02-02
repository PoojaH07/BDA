
USE healthcare;
-- CREATE
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(100),
    blood_group VARCHAR(5)
);
CREATE TABLE lab_records (
    lab_id INT PRIMARY KEY,
    patient_id INT,
    test_name VARCHAR(50),
    test_date DATE,
    result VARCHAR(100),
    doctor_name VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE medical_images (
    image_id INT PRIMARY KEY,
    patient_id INT,
    image_type VARCHAR(30),      -- X-ray, MRI, CT Scan
    image_date DATE,
    image_path VARCHAR(255),     -- path where image is stored
    remarks VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES;

INSERT INTO patient VALUES

(2, 'Amit', 'Verma', 'Male', '1998-03-15', '9123456789', 'Mumbai', 'A+'),
(3, 'Sneha', 'Patel', 'Female', '2000-11-22', '9988776655', 'Ahmedabad', 'B+'),
(4, 'Rahul', 'Singh', 'Male', '1995-07-30', '9090909090', 'Lucknow', 'AB+'),
(5, 'Neha', 'Gupta', 'Female', '2001-01-18', '8899776655', 'Jaipur', 'O-');

INSERT INTO lab_records VALUES
(101, 1, 'Blood Test', '2026-01-20', 'Normal', 'Dr. Mehta'),
(102, 2, 'Urine Test', '2026-01-21', 'Infection', 'Dr. Rao'),
(103, 3, 'Thyroid Test', '2026-01-22', 'TSH High', 'Dr. Sharma'),
(104, 4, 'Sugar Test', '2026-01-23', 'Diabetic', 'Dr. Khan'),
(105, 5, 'Vitamin D Test', '2026-01-24', 'Deficiency', 'Dr. Patel');

INSERT INTO medical_images VALUES

(202, 2, 'MRI', '2026-01-22', '/images/amit_mri.png', 'Minor injury'),
(203, 3, 'CT Scan', '2026-01-23', '/images/sneha_ct.png', 'Normal'),
(204, 4, 'Ultrasound', '2026-01-24', '/images/rahul_ultra.png', 'Fatty liver'),
(205, 5, 'X-Ray', '2026-01-25', '/images/neha_xray.png', 'Bone normal');


-- READ
SELECT * FROM patient;
SELECT p.first_name, l.test_name, l.result
FROM patient p
JOIN lab_records l ON p.patient_id = l.patient_id
WHERE p.patient_id = 1;
SELECT * FROM medical_images ;
SELECT * FROM medical_images WHERE patient_id = 1;

-- UPDATE 
UPDATE patient
SET phone = '9123456780'
WHERE patient_id = 1;


UPDATE lab_records
SET result = 'Vitamin D Deficiency'
WHERE lab_id = 101;

-- DELETE
DELETE FROM lab_records WHERE lab_id = 101;
DELETE FROM patient WHERE patient_id = 1;





