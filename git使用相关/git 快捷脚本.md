
获取当前 git 仓库的 hash

    git rev-parse --short HEAD

获取提交日期

    git show -s --format=%cd --date=format:'%Y-%m-%d_%H:%M:%S'

# 查看当前工作区或暂存区是否有内容,如果有内容，那么不再往下执行

    if [ -n "$(git status --porcelain)" ]; then
      echo "文件被修改，请先清空变化";
      exit 1;
    else
      echo "no changes";
    fi


# git 版本锚定

    dtimeStamp=`git show -s --format=%at`
    if [[ `uname` == 'Darwin' ]]; then
      echo "Mac OS"
      d=`date -r${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
    fi

    if [[ `uname` == 'Linux' ]]; then
      d=`date -d @${dtimeStamp} "+%Y-%m-%d_%H_%M_%S"`
      echo "Linux"
    fi

    hash=`git rev-parse --short HEAD`
    imgName=qjz:${d}_${hash}
    echo "容器名为: $imgName"
