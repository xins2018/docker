USE mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

UPDATE user SET password=PASSWORD("root") WHERE user='root';
FLUSH PRIVILEGES;