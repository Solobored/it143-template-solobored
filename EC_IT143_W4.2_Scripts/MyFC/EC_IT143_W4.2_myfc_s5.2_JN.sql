DROP TABLE IF EXISTS dbo.t_myfc_players_per_team;
GO

CREATE TABLE dbo.t_myfc_players_per_team
(team_code       VARCHAR(10) NOT NULL,
 player_count    INT NOT NULL
                  DEFAULT 0,

 CONSTRAINT PK_t_myfc_players_per_team PRIMARY KEY CLUSTERED (team_code ASC)
);
GO
