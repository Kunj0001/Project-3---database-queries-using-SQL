CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';
DELETE FROM ContactEmployee
WHERE ContactEmployeeID = (SELECT ContactEmployeeID FROM ContactEmployee
                           JOIN Contact ON ContactEmployee.ContactID = Contact.ContactID
                           WHERE FirstName = 'Dianne' AND LastName = 'Connor' AND Description LIKE '%Jack Lee%');
SELECT Employee.FirstName, Employee.LastName
FROM Contact
JOIN ContactEmployee ON Contact.ContactID = ContactEmployee.ContactID
JOIN Employee ON ContactEmployee.EmployeeID = Employee.EmployeeID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';
