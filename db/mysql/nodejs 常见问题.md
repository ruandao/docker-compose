报错:

    Client does not support authentication protocol requested by server;
    consider upgrading MySQL client

https://waylau.com/node.js-mysql-client-does-not-support-authentication-protocol/
    
出错原因：  
    导致这个错误的原因是，目前，最新的mysql模块并未完全支持MySQL 8的“caching_sha2_password”加密方式，而“caching_sha2_password”在MySQL 8中是默认的加密方式。因此，下面的方式命令是默认已经使用了“caching_sha2_password”加密方式，该账号、密码无法在mysql模块中使用。    

解决办法：  
    解决方法是从新修改用户root的密码，并指定mysql模块能够支持的加密方式：

    mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
    Query OK, 0 rows affected (0.12 sec)

查看所有用户

    SELECT * FROM mysql.user;
