
CREATE USER [Org_RW_User]
    WITH PASSWORD = N'$(RWUserPassword)';
GO
	GRANT CONNECT TO [Org_RW_User]
GO


