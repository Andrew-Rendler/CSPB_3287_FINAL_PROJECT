CREATE SCHEMA IF NOT EXISTS GIZMO_STORE;

DROP TABLE IF EXISTS OrderMaster;
CREATE TABLE OrderMaster (
	partID INT REFERENCES PartMaster(partID)
    ,transactionType VARCHAR(1)
    ,transactionID INT PRIMARY KEY
    ,peopleID INT REFERENCES PeopleMaster(peopleID)
    ,quantity INT CHECK (quantity >= 0)
    ,tdate date
    );
    
    DROP TABLE IF EXISTS PartMaster;
    CREATE TABLE PartMaster (
		partID INT PRIMARY KEY
        ,peopleID INT REFERENCES PeopleMaster(peopleID)
        ,partDescription VARCHAR(50)
        ,buyPrice float CHECK (buyPrice >=0)
        ,sellPrice float CHECK (sellPrice >=0)
    );
    
    DROP TABLE IF EXISTS PeopleMaster;
    CREATE TABLE PeopleMaster (
		peopleID INT PRIMARY KEY
        ,sRcName VARCHAR(50)
        ,email VARCHAR(50)
        ,phone VARCHAR(50)
        );