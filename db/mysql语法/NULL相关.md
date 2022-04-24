NULL 表示未知

不能用 != 之类的来比较，需要用 is null 或者 is not null 来比较

数据库建表的时候，要限定字段 not null

如果非要用 比较操作, 记得  set ansi_nulls off