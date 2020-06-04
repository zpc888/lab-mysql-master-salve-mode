1. docker exec -it mysql1 /bin/bash
2. mysql -u root -h localhost -P 3306 -p
3. GRANT REPLICATION SLAVE ON *.* to 'rep1'@'%' identified by '123';
4. vi /etc/mysql/mysql.conf.d/mysqld.cnf
     ==> add 
		 log-bin=/var/lib/mysql/binlog
		 server-id=1
		 binlog-do-db = cmdb
5. docker cp mysqld-final.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
6. docker container restart mysql1
7. 
mysql> show master status;
+---------------+----------+------------------+------------------+-------------------+
| File          | Position | Binlog_Do_DB     | Binlog_Ignore_DB | Executed_Gtid_Set |
+---------------+----------+------------------+------------------+-------------------+
| binlog.000001 |      154 | cmdb,db1,db2,db3 |                  |                   |
+---------------+----------+------------------+------------------+-------------------+

