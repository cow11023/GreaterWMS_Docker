<<<<<<< Updated upstream
FROM registry.cn-hangzhou.aliyuncs.com/cow11023/greaterwms_web_build:v1.0
USER root
WORKDIR /GreaterWMS/
COPY . .
RUN cd /GreaterWMS/templates
=======
FROM node:14
USER root
WORKDIR /GreaterWMS/
COPY . .
RUN cd templates
RUN npm install npm -g --registry=https://registry.npm.taobao.org --force
>>>>>>> Stashed changes
RUN npm install -g yarn --registry=https://registry.npm.taobao.org --force
RUN npm install -g @quasar/cli --registry=https://registry.npm.taobao.org --force
RUN yarn install --registry=https://registry.npm.taobao.org --force
EXPOSE 8080
