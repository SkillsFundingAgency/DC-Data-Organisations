﻿
CREATE USER [Org_RO_User]
    WITH PASSWORD = N'$(ROUserPassword)';
GO
	GRANT CONNECT TO [Org_RO_User]
GO