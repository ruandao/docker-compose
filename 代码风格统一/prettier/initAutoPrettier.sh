#!/bin/bash
set -e

./makeSureGitClear.sh

npm install --save-dev --save-exact prettier

echo "" >> .prettierignore  # 哪些是要忽略的
npx mrm@2 lint-staged # 这里面会自动安装 husky 等