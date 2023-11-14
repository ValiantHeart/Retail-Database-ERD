CREATE TABLE [BUYERS] (
  [accountNumber] int PRIMARY KEY,
  [buyerName] nvarchar(255),
  [buyerAddress] nvarchar(255),
  [buyerPhone] nvarchar(255),
  [buyerOccupation] nvarchar(255),
  [buyerSalary] int,
  [buyerCreditScore] int
)
GO

CREATE TABLE [POSITION] (
  [jobID] int PRIMARY KEY,
  [jobTitle] nvarchar(255),
  [jobSalary] int,
  [jobOescription] nvarchar(255)
)
GO

CREATE TABLE [EMPLOYEES] (
  [employeeID] int PRIMARY KEY,
  [employeeName] nvarchar(255),
  [employeeAddress] nvarchar(255),
  [employeePhone] nvarchar(255),
  [employeePosition] nvarchar(255)
)
GO

CREATE TABLE [CONTRACTORS] (
  [contractorID] int PRIMARY KEY,
  [contractorName] nvarchar(255),
  [contractorAddress] nvarchar(255),
  [contractorPhone] nvarchar(255),
  [contractorTypeID] int
)
GO

CREATE TABLE [CONTRACTOR_TYPES] (
  [contractorTypeID] int PRIMARY KEY,
  [contractorTypeTitle] nvarchar(255),
  [contractorTypeDescription] nvarchar(255)
)
GO

CREATE TABLE [SALESAGENTS] (
  [agentID] int PRIMARY KEY,
  [agentName] nvarchar(255),
  [agentAddress] nvarchar(255),
  [agentPhone] nvarchar(255)
)
GO

CREATE TABLE [AGREEMENTS] (
  [agreementNumber] int,
  [contractorID] nvarchar(255),
  [agreementDescription] nvarchar(255),
  PRIMARY KEY ([agreementNumber], [contractorID])
)
GO

CREATE TABLE [STYLES] (
  [styleID] int PRIMARY KEY,
  [styleName] nvarchar(255),
  [styleDescription] nvarchar(255)
)
GO

CREATE TABLE [STATUSES] (
  [statusID] int PRIMARY KEY,
  [statusName] nvarchar(255),
  [statusDescription] nvarchar(255)
)
GO

CREATE TABLE [PROPERTIES_MANAGED] (
  [parcelNumber] int PRIMARY KEY,
  [propertyAddress] nvarchar(255),
  [propertyRoomsNumber] int,
  [propertySquareFeet] float,
  [styleID] int,
  [propertyStatusCode] int
)
GO

CREATE TABLE [TRANSACTION] (
  [transactionID] int PRIMARY KEY,
  [parcelNumber] int,
  [agentID] int,
  [marketValueAsOfTransaction] float,
  [transactionPrice] float,
  [transactionType] nvarchar(255) NOT NULL CHECK ([transactionType] IN ('buy', 'sell')),
  [transactionDate] timestamp
)
GO

CREATE TABLE [BUYER_TRANSACTIONS] (
  [accountNumber] int,
  [transactionID] int,
  PRIMARY KEY ([accountNumber], [transactionID])
)
GO

ALTER TABLE [EMPLOYEES] ADD FOREIGN KEY ([employeePosition]) REFERENCES [POSITION] ([jobID])
GO

ALTER TABLE [CONTRACTORS] ADD FOREIGN KEY ([contractorTypeID]) REFERENCES [CONTRACTOR_TYPES] ([contractorTypeID])
GO

ALTER TABLE [AGREEMENTS] ADD FOREIGN KEY ([contractorID]) REFERENCES [CONTRACTORS] ([contractorID])
GO

ALTER TABLE [PROPERTIES_MANAGED] ADD FOREIGN KEY ([styleID]) REFERENCES [STYLES] ([styleID])
GO

ALTER TABLE [PROPERTIES_MANAGED] ADD FOREIGN KEY ([propertyStatusCode]) REFERENCES [STATUSES] ([statusID])
GO

ALTER TABLE [TRANSACTION] ADD FOREIGN KEY ([parcelNumber]) REFERENCES [PROPERTIES_MANAGED] ([parcelNumber])
GO

ALTER TABLE [TRANSACTION] ADD FOREIGN KEY ([agentID]) REFERENCES [SALESAGENTS] ([agentID])
GO

ALTER TABLE [BUYER_TRANSACTIONS] ADD FOREIGN KEY ([accountNumber]) REFERENCES [BUYERS] ([accountNumber])
GO

ALTER TABLE [BUYER_TRANSACTIONS] ADD FOREIGN KEY ([transactionID]) REFERENCES [TRANSACTION] ([transactionID])
GO
