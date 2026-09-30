DROP TABLE IF EXISTS dbo.t_simpsons_members_per_dept;
GO

CREATE TABLE dbo.t_simpsons_members_per_dept
(department_name   VARCHAR(50) NOT NULL,
 member_count      INT NOT NULL
                    DEFAULT 0,

 CONSTRAINT PK_t_simpsons_members_per_dept PRIMARY KEY CLUSTERED (department_name ASC)
);
GO
