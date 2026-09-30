SELECT  v.department_name
    ,   v.member_count
    INTO dbo.t_simpsons_members_per_dept
  FROM dbo.v_simpsons_members_per_dept_load AS v;
