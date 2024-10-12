CREATE DATABASE IF NOT EXISTS wp;
CREATE USER 'wp'@'localhost' IDENTIFIED BY 'usenv';
GRANT ALL PRIVILEGES ON wp.* TO 'wp'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'usenv';
FLUSH PRIVILEGES;