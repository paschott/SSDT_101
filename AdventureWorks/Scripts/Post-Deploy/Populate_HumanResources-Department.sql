PRINT 'Populating HumanResources.Department'

--Simple case - only adds values. Would use MERGE statement or similar if needed to update existing or add new
CREATE TABLE #Department ( [DepartmentID] smallint, [Name] nvarchar(50), [GroupName] nvarchar(50), [ModifiedDate] datetime )
INSERT INTO #Department
VALUES
( 1, N'Engineering', N'Research and Development', N'2002-06-01T00:00:00' ), 
( 2, N'Tool Design', N'Research and Development', N'2002-06-01T00:00:00' ), 
( 3, N'Sales', N'Sales and Marketing', N'2002-06-01T00:00:00' ), 
( 4, N'Marketing', N'Sales and Marketing', N'2002-06-01T00:00:00' ), 
( 5, N'Purchasing', N'Inventory Management', N'2002-06-01T00:00:00' ), 
( 6, N'Research and Development', N'Research and Development', N'2002-06-01T00:00:00' ), 
( 7, N'Production', N'Manufacturing', N'2002-06-01T00:00:00' ), 
( 8, N'Production Control', N'Manufacturing', N'2002-06-01T00:00:00' ), 
( 9, N'Human Resources', N'Executive General and Administration', N'2002-06-01T00:00:00' ), 
( 10, N'Finance', N'Executive General and Administration', N'2002-06-01T00:00:00' ), 
( 11, N'Information Services', N'Executive General and Administration', N'2002-06-01T00:00:00' ), 
( 12, N'Document Control', N'Quality Assurance', N'2002-06-01T00:00:00' ), 
( 13, N'Quality Assurance', N'Quality Assurance', N'2002-06-01T00:00:00' ), 
( 14, N'Facilities and Maintenance', N'Executive General and Administration', N'2002-06-01T00:00:00' ), 
( 15, N'Shipping and Receiving', N'Inventory Management', N'2002-06-01T00:00:00' ), 
( 16, N'Executive', N'Executive General and Administration', N'2002-06-01T00:00:00' )

SET IDENTITY_INSERT HumanResources.Department ON

INSERT HumanResources.Department ( DepartmentID, [Name], GroupName, ModifiedDate )
SELECT d.DepartmentID,
       d.[Name],
       d.GroupName,
       d.ModifiedDate
FROM #Department AS d
LEFT JOIN HumanResources.Department AS d2
	ON d2.DepartmentID = d.DepartmentID
WHERE d2.DepartmentID IS NULL

SET IDENTITY_INSERT HumanResources.Department OFF

DROP TABLE #Department

PRINT 'Finished Populating HumanResources.Department'
