-- Did it work? Let's see...

-- Remove test rows if they are already there
DELETE FROM dbo.t_hello_world
WHERE my_message IN ('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world (my_message)
VALUES ('Hello World2'), ('Hello World3');

-- Check the table before any update
SELECT t.* FROM dbo.t_hello_world AS t;

-- Try an update
UPDATE dbo.t_hello_world SET my_message = 'Hello World4'
WHERE my_message = 'Hello World3';

-- Check again - last_modified_date and last_modified_by should now be populated
SELECT t.* FROM dbo.t_hello_world AS t;
