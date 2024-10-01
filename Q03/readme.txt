Instructions:

1. Download and unzip the problem description file (.zip);

2. Open a terminal window, change the cursor to the directory containing the
   uncompressed files. Then, run:
	
	docker compose up -d

3. Once the services are up and running, visit http://localhost:8080 and log
   in with the credentials below:

  - MySQL 5.7

	System: MySQL
	Server: db_mysql
	Username: root
	Password: Example@1

  - MySQL 8+

	System: MySQL
	Server: db_mysql8
	Username: root
	Password: Example@1

 - PostgreSQL 16+

	System: PostgreSQL
	Server: db_postgres
	Username: postgres
	Password: Example@1

4. Access db_transactions to view table Schedule and Example 01;

5. Delete all table rows between imports;

6. To stop the servers type Ctrl+C followed by:
	
	docker compose down

--> References:

https://docs.docker.com/engine/install/
https://hub.docker.com/_/mysql
https://hub.docker.com/_/postgres
