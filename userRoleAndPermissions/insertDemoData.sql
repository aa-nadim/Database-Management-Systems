-- Insert sample users
INSERT INTO User (UserID, UserName, UserType) VALUES
    (1, 'AdminUser', 'Administrator'),
    (2, 'EditorUser', 'Editor'),
    (3, 'EmployeeUser', 'Employee'),
    (4, 'ExternalUser', 'External');

-- Insert sample permissions
INSERT INTO Permission (PermissionID, PermissionName) VALUES
    (1, 'View'),
    (2, 'Access Original'),
    (3, 'Edit Metadata'),
    (4, 'Edit Content'),
    (5, 'Manage Permission'),
    (6, 'Delete');

-- Assign permissions to users
INSERT INTO UserPermission (UserPermissionID, UserID, PermissionID) VALUES
    (1, 1, 1), -- AdminUser has View permission
    (2, 1, 2), -- AdminUser has Access Original permission
    (3, 1, 3), -- AdminUser has Edit Metadata permission
    (4, 1, 4), -- AdminUser has Edit Content permission
    (5, 1, 5), -- AdminUser has Manage Permission permission
    (6, 1, 6), -- AdminUser has Delete permission
    (7, 2, 1), -- EditorUser has View permission
    (8, 2, 2), -- EditorUser has Access Original permission
    (9, 2, 3), -- EditorUser has Edit Metadata permission
    (10, 2, 4), -- EditorUser has Edit Content permission
    (11, 2, 5), -- EditorUser has Manage Permission permission
    (12, 3, 1), -- EmployeeUser has View permission
    (13, 3, 2), -- EmployeeUser has Access Original permission
    (14, 4, 1), -- ExternalUser has View permission
    (15, 4, 2); -- ExternalUser has Access Original permission