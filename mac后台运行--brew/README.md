
运行 `brew services start xxxx`

注意去修改 XXXX 的 plist 文件 里面的环境变量 PATH 之类的，
譬如 jenkins 的环境变量和用户身份的环境变量不一致，会导致很多命令找不到

范例可以参见  [./homebrew.mxcl.jenkins-lts.plist](./homebrew.mxcl.jenkins-lts.plist)
里面的 `EnvironmentVariables`>`PATH`
另一个就是 utf-8 , 依旧是上面这个范例然后 `EnvironmentVariables`> `xxx`:`UTF-8` 里面的各种 utf-8