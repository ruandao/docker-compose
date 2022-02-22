FROM node:16

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' >/etc/timezone
ENV TZ="Asia/Shanghai"

# Create app directory
WORKDIR /usr/src/app

COPY cache-package.json ./package.json
COPY cache-package-lock.json ./package-lock.json
RUN cnpm install
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]