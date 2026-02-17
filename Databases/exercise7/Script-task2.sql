BEGIN TRANSACTION;

INSERT INTO People (pName, pGender, pHeight)
VALUES ('Bob', 'M', 1.8);

UPDATE People
SET pHeight = 1.2
WHERE pName = 'Bob';

COMMIT;


SELECT * FROM People WHERE pName = 'Bob';
