CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT,
    parent_id INT 
        REFERENCES 
        categories(id)
);

INSERT INTO categories 
(name, parent_id) 
VALUES
('Electronics', NULL),
('Computers', 1),
('Laptops', 2),
('Phones', 1);

WITH RECURSIVE tree AS (
    SELECT 
        id, 
        name, 
        parent_id, 
        0 AS depth
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT 
        c.id, 
        c.name, 
        c.parent_id, 
        t.depth + 1
    FROM categories c
    JOIN tree t 
      ON c.parent_id = t.id
)
SELECT 
    repeat('  ', depth) 
    || name AS tree
FROM tree
ORDER BY depth, name;