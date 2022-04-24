

https://zhuanlan.zhihu.com/p/366786798

https://www.npmjs.com/package/husky

安装：

    npm install husky --save-dev

使用：
Edit package.json > prepare script and run it once:

    npm set-script prepare "husky install"
    npm run prepare


# 在提交前，做处理
Add a hook:

    npx husky add .husky/pre-commit "npm test"
    git add .husky/pre-commit

# 在合并分支后做处理（或者拉取代码后）

    npx husky add .husky/post-merge "npm test"