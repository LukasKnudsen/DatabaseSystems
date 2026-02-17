BEGIN TRANSACTION;

-- Step 1: Delete from AccountRecords (deepest dependency)
DELETE FROM AccountRecords
WHERE AID IN (
    SELECT AID FROM Accounts
    WHERE PID IN (
        SELECT PID FROM People WHERE pName LIKE 'R%'
    )
);

-- Step 2: Delete from Accounts
DELETE FROM Accounts
WHERE PID IN (
    SELECT PID FROM People WHERE pName LIKE 'R%'
);

-- Step 3: Delete from People
DELETE FROM People
WHERE pName LIKE 'R%';

-- Step 4: Count remaining rows
SELECT COUNT(*) AS RemainingPeople FROM People;

-- Step 5: Rollback
ROLLBACK;
