# Consultas em MySQL 8.4

**Autor:** Elder Ribeiro Storck  
**Data:** 01 de Outubro de 2024

Este repositório contém três consultas em MySQL 8.4, desenvolvidas como Avaliação para discilpina de Banco de Dados. As consultas são projetadas para explorar diferentes funcionalidades do MySQL, oferecendo exemplos práticos e detalhados.

## Questões

### Questão 2: Protocolo de Bloqueio em Duas Fases (2PL)
Esta consulta verifica se as transações seguem o protocolo de bloqueio em duas fases (2PL), tanto na sua forma básica quanto na variação estrita. O 2PL básico requer que todas as operações de bloqueio precedam as operações de desbloqueio na transação. A versão estrita, por outro lado, impede que outras transações leiam ou gravem um item até que a transação que o bloqueou tenha sido confirmada. A consulta analisa a tabela `Schedule`, que contém registros de operações de transações, e determina se o protocolo foi seguido corretamente.

#### Entrada:
- Tabela `Schedule` com as colunas:
  - `time`: Carimbo de tempo de chegada da operação.
  - `#t`: Identificador da transação.
  - `op`: Tipo de operação (read_lock, write_lock, unlock, read_item, write_item, commit, rollback).
  - `attr`: Item de dados envolvido na operação.

#### Saída:
- Tabela com a coluna `RESP`, contendo 1 se o protocolo for seguido, ou 0 caso contrário.

### Questão 3: Verificação de Schedule Estrito
O objetivo desta consulta é verificar se um schedule é estrito, ou seja, se as transações não leem nem gravam um item X até que a última transação que gravou X tenha sido confirmada ou cancelada. Schedules estritos simplificam o processo de recuperação em sistemas de banco de dados. A consulta utiliza a tabela `Schedule`, que registra as operações de transações ao longo do tempo.

#### Entrada:
- Tabela `Schedule` com as colunas:
  - `time`: Carimbo de tempo de chegada da operação.
  - `#t`: Identificador da transação.
  - `op`: Tipo de operação (read_lock, write_lock, unlock, read_item, write_item, commit, rollback).
  - `attr`: Item de dados envolvido na operação.

#### Saída:
- Tabela com a coluna `RESP`, contendo 1 se o schedule for estrito, ou 0 caso contrário.

### Questão 4: Teste de Serializabilidade por Conflito
Esta consulta verifica se um schedule é serializável usando o teste de equivalência por conflito. A consulta constrói um grafo de precedência, onde cada transação é representada por um nó e as arestas indicam conflitos entre operações de transações. Se houver um ciclo no grafo de precedência, o schedule não é serializável; caso contrário, ele é serializável.

#### Entrada:
- Tabela `Schedule` com as colunas:
  - `time`: Carimbo de tempo de chegada da operação.
  - `#t`: Identificador da transação.
  - `op`: Tipo de operação (read_lock, write_lock, unlock, read_item, write_item, commit, rollback).
  - `attr`: Item de dados envolvido na operação.

#### Saída:
- Tabela com a coluna `RESP`, contendo 1 se o schedule for serializável, ou 0 caso contrário.

