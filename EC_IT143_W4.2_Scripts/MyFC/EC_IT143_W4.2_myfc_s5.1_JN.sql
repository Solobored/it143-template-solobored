SELECT  v.team_code
    ,   v.player_count
    INTO dbo.t_myfc_players_per_team
  FROM dbo.v_myfc_players_per_team_load AS v;
