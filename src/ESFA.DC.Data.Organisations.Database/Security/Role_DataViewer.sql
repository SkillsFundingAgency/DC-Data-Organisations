﻿
GO
CREATE ROLE [DataViewer] AUTHORIZATION [dbo]
GO

-- Grant access rights to a specific schema in the database
GRANT 
	REFERENCES, 
	SELECT, 
	VIEW DEFINITION 
ON SCHEMA::[dbo]
	TO [DataViewer]
GO
