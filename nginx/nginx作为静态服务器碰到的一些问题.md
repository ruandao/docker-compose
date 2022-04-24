

如果有上游nginx 的话，
为了防止上游的路径截取失败，最好本地对有截取的路径和没截取的路径都做一层处理

像下面这样， 解包的时候，同时解包到多个目录：

    tar -xvf $repoName/tgz/h5.test.tgz -C $repoName
    cp -R ./$repoName/dist/build/h5/* ./src/

    mkdir -p ./src/test/health-punchcard-h5/
    cp -R ./$repoName/dist/build/h5/* ./src/test/health-punchcard-h5/


另外一个，如果外层的root 没有设置的话，需要对每个 location 的 root 设置下，