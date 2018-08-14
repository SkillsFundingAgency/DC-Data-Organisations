﻿CREATE VIEW [dbo].[Current_Version]
AS

WITH CTE_Highest_Version ([MajorNumber],[MinorNumber],[MaintenanceNumber],[Rank]) 
AS 
(
	SELECT [MajorNumber],[MinorNumber],[MaintenanceNumber],
			DENSE_RANK() OVER ( ORDER BY [MajorNumber] Desc, [MinorNumber] Desc, [MaintenanceNumber] DESC) AS [Rank]
	FROM [dbo].[Org_Version]
)
,CTE_Max_Version ([MajorNumber],[MinorNumber],[MaintenanceNumber])
AS
(
	SELECT  CONVERT(VARCHAR(10),[MajorNumber]) AS [MajorNumber],
			CONVERT(VARCHAR(10),[MinorNumber]) AS [MinorNumber],
			CONVERT(VARCHAR(10),[MaintenanceNumber]) AS [MaintenanceNumber]
	FROM CTE_Highest_Version
	WHERE [Rank] = 1
)
 SELECT CONVERT(VARCHAR(100),'Version ' + CONVERT(VARCHAR(10),[MajorNumber]) 
			+ '.' 
			+ CONVERT(VARCHAR(10),[MinorNumber])
			+ '.' 
			+ CONVERT(VARCHAR(10),[MaintenanceNumber])
			+ ' : ' 
			+ CONVERT(VARCHAR(30),[DataGeneratedOn],113)) AS [CurrentVersion]
 FROM CTE_Max_Version
 CROSS JOIN [dbo].[Org_DataGeneration]

