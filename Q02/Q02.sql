WITH 

writes AS (
  SELECT time AS t1, `#t` AS transaction1, attr AS attr1, op AS op1
    FROM Schedule
  WHERE op="write_lock"
),

confirmations AS (
  SELECT time AS t2, `#t` AS transaction2, attr AS attr2, op AS op2
    FROM Schedule
  WHERE op="rollback" OR op="commit"
),

unlocks AS (
  SELECT time AS t3, `#t` AS transaction3, attr AS attr3, op AS op3
    FROM Schedule
  WHERE op="unlock"
),

Violations AS (
  SELECT *
    FROM writes AS w
  JOIN confirmations AS c ON w.transaction1 = c.transaction2
  JOIN unlocks AS u ON u.attr3 = w.attr1
  HAVING u.t3 < c.t2 AND w.t1 < u.t3
)

SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 0  -- Se existir pelo menos um registro, retorna 0
        ELSE 1                    -- Se não houver registros, retorna 1
    END AS RESP
FROM Violations;



