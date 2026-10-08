-- Q1: How do we keep track of when a record was last modified?
-- A1: Add a last_modified_date column. A DEFAULT constraint only fires on
--     INSERT though, so it won't update on its own when a row changes later.
--     Maybe an AFTER UPDATE trigger?

-- Q2: How do we keep track of who last modified a record?
-- A2: Same problem. Add a last_modified_by column, but a DEFAULT constraint
--     still only fires on INSERT. The trigger will need to set this too.
