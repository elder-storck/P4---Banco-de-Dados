WITH 
  -- Criação da base de nós (transações) e operações relevantes
  Base AS (
    SELECT time, `#t` AS transaction, attr, op
    FROM Schedule
    WHERE op IN ('read_item', 'write_item')
  ),

  -- Detectar conflitos entre as transações
  Conflitos AS (
    -- Conflitos de escrita antes de leitura
    SELECT DISTINCT b1.transaction AS transacao_i, b2.transaction AS transacao_j
    FROM Base b1
    JOIN Base b2 
    ON b1.attr = b2.attr
       AND b1.transaction <> b2.transaction
       AND b1.op = 'write_item'
       AND b2.op = 'read_item'
       AND b1.time < b2.time
    
    UNION
    
    -- Conflitos de leitura antes de escrita
    SELECT DISTINCT b1.transaction AS transacao_i, b2.transaction AS transacao_j
    FROM Base b1
    JOIN Base b2 
    ON b1.attr = b2.attr
       AND b1.transaction <> b2.transaction
       AND b1.op = 'read_item'
       AND b2.op = 'write_item'
       AND b1.time < b2.time
    
    UNION
    
    -- Conflitos de escrita após escrita
    SELECT DISTINCT b1.transaction AS transacao_i, b2.transaction AS transacao_j
    FROM Base b1
    JOIN Base b2 
    ON b1.attr = b2.attr
       AND b1.transaction <> b2.transaction
       AND b1.op = 'write_item'
       AND b2.op = 'write_item'
       AND b1.time < b2.time
  )

  SELECT CASE
    WHEN EXISTS (
        SELECT 1
        FROM Conflitos C1
        INNER JOIN Conflitos C2 ON C1.transacao_j = C2.transacao_i
        WHERE C2.transacao_j = C1.transacao_i
    ) THEN 0
    ELSE 1
END AS RESP;