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
RUN apt-get update && apt-get install build-essential -y
RUN python3 -m pip install --upgrade pip
#安装supervisor
RUN apt-get update && apt-get install supervisor -y
#安装项目依赖包
RUN pip3 install supervisor
RUN pip3 install -U 'Twisted[tls,http2]'
RUN apt install -y libmariadbd-dev
RUN pip3 install -r requirements.txt
=======
RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential -y
RUN python -m pip install --upgrade pip
#安装supervisor
RUN apt-get install supervisor -y
#安装项目依赖包
RUN pip install supervisor
RUN pip install -U 'Twisted[tls,http2]'
RUN apt install -y libmariadbd-dev
RUN pip install supervisor 
RUN pip install -r requirements.txt
>>>>>>> Stashed changes
EXPOSE 8008
#CMD ["daphne","-b","0.0.0.0","-p","8008","greaterwms.asgi:application"]
#部署前端node14
RUN curl -sL https://deb.nodesource.com/setup_14.x |bash -
RUN apt-get install -y nodejs
<<<<<<< Updated upstream
RUN cd /GreaterWMS/templates
RUN npm install -g yarn
RUN npm install -g @quasar/cli
RUN yarn install
RUN bash web_start.sh
=======
RUN cd templates
RUN npm install -g yarn
RUN npm install -g @quasar/cli
>>>>>>> Stashed changes
EXPOSE 8080
