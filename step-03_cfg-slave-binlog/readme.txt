1. docker exec -it mysql2 /bin/bash
2. mysql -u root -h localhost -P 3306 -p
3. GRANT REPLICATION SLAVE ON *.* to 'rep1'@'%' identified by '123';
4. vi /etc/mysql/mysql.conf.d/mysqld.cnf
     ==> add 
		 server-id=2
5. docker cp mysqld-final.cnf mysql2:/etc/mysql/mysql.conf.d/mysqld.cnf
6. docker container restart mysql2
7.  mysql -u root -h localhost -P 3306 -p
mysql> change master to master_host='10.243.13.3',master_port=33061,master_user='rep1',master_password='123',master_log_file='binlog.000001',master_log_pos=154;
