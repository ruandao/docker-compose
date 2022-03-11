
-- 授权
GRANT privileges ON databasename.tablename TO 'username'@'host'

--- privileges：用户的操作权限，如SELECT，INSERT，UPDATE等，如果要授予所的权限则使用ALL
--- databasename：数据库名
--- tablename：表名，如果要授予该用户对所有数据库和表的相应操作权限则可用*表示，如*.*

--- 范例：
GRANT SELECT, INSERT ON test.user TO 'pig'@'%';
GRANT ALL ON *.* TO 'pig'@'%';

--- 用以上命令授权的用户不能给其它用户授权，如果想让该用户可以授权，用以下命令:
GRANT privileges ON databasename.tablename TO 'username'@'host' WITH GRANT OPTION;



-- 设置与更改用户密码
SET PASSWORD FOR 'username'@'host' = PASSWORD('newpassword');

-- 如果是当前登陆用户用:
SET PASSWORD = PASSWORD("newpassword");
-- 例子
SET PASSWORD FOR 'pig'@'%' = PASSWORD("123456");


-- 撤销用户权限
REVOKE privilege ON databasename.tablename FROM 'username'@'host';

-- privilege, databasename, tablename：同授权部分
-- 例子：
REVOKE SELECT ON *.* FROM 'pig'@'%';

-- 假如你在给用户'pig'@'%'授权的时候是这样的（或类似的）：GRANT SELECT ON test.user TO 'pig'@'%'，
-- 则在使用REVOKE SELECT ON *.* FROM 'pig'@'%';命令并不能撤销该用户对test数据库中user表的SELECT 操作。
-- 相反，如果授权使用的是GRANT SELECT ON *.* TO 'pig'@'%';
-- 则REVOKE SELECT ON test.user FROM 'pig'@'%';命令也不能撤销该用户对test数据库中user表的Select权限。

-- 删除用户
DROP USER 'username'@'host';
