UPDATE students 
SET name = 'Kofi M.' 
WHERE id = 1;

DELETE FROM students 
WHERE id = 3;

SELECT 
    tbl,
    op,
    old_row->>'name' 
      AS was,
    new_row->>'name' 
      AS now,
    at
FROM audit_log
ORDER BY at DESC;