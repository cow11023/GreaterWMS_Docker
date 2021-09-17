#基础镜像，用官方的Python 3.9
FROM python:3.9
#将项目目录文件复制到镜像中,CODE_DIR是在基础镜像中定义的
RUN mkdir -p /GreaterWMS/templates
COPY .  /GreaterWMS
#配置工作目录
WORKDIR /GreaterWMS
#安装supervisor
#更换apt-get为阿里云的源
<<<<<<< Updated upstream
RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list
#RUN sed -i s/deb.debian.org/mirrors.163.com/g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update && apt-get install build-essential -y
RUN python3 -m pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
#安装supervisor
RUN apt-get update && apt-get install supervisor -y
#安装项目依赖包
RUN pip3 install -U 'Twisted[tls,http2]' -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN apt install -y libmariadbd-dev
RUN pip3 install supervisor -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip3 install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip3 install --upgrade numpy -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
=======
#RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list
RUN sed -i s/deb.debian.org/mirrors.163.com/g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential -y
RUN python -m pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
#安装supervisor
RUN apt-get install supervisor -y
#安装项目依赖包
RUN pip install supervisor -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip install -U 'Twisted[tls,http2]' -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip install supervisor -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
RUN pip install --upgrade numpy -i http://mirrors.aliyun.com/pypi/simple  --trusted-host mirrors.aliyun.com
>>>>>>> Stashed changes
EXPOSE 8008
#CMD ["daphne","-b","0.0.0.0","-p","8008","greaterwms.asgi:application"]
#部署前端node14
RUN curl -sL https://deb.nodesource.com/setup_14.x |bash -
RUN apt-get install -y nodejs
<<<<<<< Updated upstream
RUN cd /GreaterWMS/templates
RUN npm install -g yarn --registry=https://registry.npm.taobao.org --force
RUN npm install -g @quasar/cli --registry=https://registry.npm.taobao.org --force
RUN yarn install --registry=https://registry.npm.taobao.org --force
RUN bash web_start.sh
EXPOSE 8080
=======
RUN cd templates
RUN npm install -g yarn --registry=https://registry.npm.taobao.org --force
RUN npm install -g @quasar/cli --registry=https://registry.npm.taobao.org --force
EXPOSE 8080
>>>>>>> Stashed changes
