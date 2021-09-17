Docker下使用GreaterWMS（本文档适用于具备Docker基础的用户使用）

1. 安装或升级Docker客户端

```
	curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
	//如果提示没有curl再执行sudo apt install curl 或 yum -y install curl
```

2. 配置国内源

	sudo mkdir -p /etc/docker
	sudo tee /etc/docker/daemon.json <<-'EOF' 
	{
	"registry-mirrors": ["https://w61q8mf4.mirror.aliyuncs.com"]
	}
	EOF
	sudo systemctl daemon-reload
	sudo systemctl enable docker
	sudo systemctl restart docker
3. 安装Docker-compose

```
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
4. 验证docker和docker-compose是否安装成功

	docker info //验证docker版本
	docker-compose version //验证docker-compose 版本信息
	sudo systemctl status docker //检查docker是否运行
	sudo systemctl start docker //若没有则启动docker
5. 利用docker直接试运行项目（非二次开发，用户试用，无需从github上克隆项目）

```

//直接docker run 国内用户使用
docker run -itd --name greaterwms_v2.0.25 -p 8008:8008 -d registry.cn-hangzhou.aliyuncs.com/cow11023/greaterwms:v2.0.25
//直接docker run 全球用户使用
docker run -itd --name greaterwms_v2.0.25 -p 8008:8008 -d silence2022/greaterwms:v2.0.25
```
6. 安装git

```

//Ubuntu下安装git
apt-get install git
//CentOS下安装git
yum install git

```
7. 适用于长期保存数据(需要在用户服务器上存放代码) 和二次开发

```
//拉取GreaterWMS_Docker代码
git clone https://github.com/Singosgu/GreaterWMS_Docker.git
//拉取GreaterWMS代码
git clone https://github.com/Singosgu/GreaterWMS.git
//将GreaterWMS_Docker的代码复制到本地GreaterWMS仓库内
cd GreaterWMS_Docker
cp -r *.* ../GreaterWMS/
//运行项目前需要修改baseurl.js的内容
cd ../
cd GreaterWMS
vim templates/public/statics/baseurl.js //将127.0.0.1修改为服务器的IP地址
//运行项目前需要修改nginx.conf 
vim nginx.conf //将127.0.0.1修改为本机IP地址，如果部署到服务器，修改为服务器IP地址
docker-compose up -d
//查看greaterwms镜像运行日志(这里是前端后端一起运行的)
docker logs -f greaterwms_v2.0.25
//当打印的前端日志出现以下信息即表示前端启动成功
 N  App dir........... /GreaterWMS/templates
    App URL........... http://localhost:8080
    Dev mode.......... spa
    Pkg quasar........ v1.15.23
    Pkg @quasar/app... v2.2.10
    Transpiled JS..... yes (Babel)
  
｢wds｣: Project is running at http://0.0.0.0:8080/
｢wds｣: webpack output is served from 
//查看greaterwms镜像运行日志
docker logs -f greaterwms_v2.0.25
//当打印的后端日志出现以下信息即表示后端启动成功
Starting supervisor: 2021-09-17 03:32:26,205 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2021-09-17 03:32:26,205 WARN No file matches via include "/etc/supervisor/conf.d/*.conf"
2021-09-17 03:32:26,205 WARN For [program:greaterwms], redirect_stderr=true but stderr_logfile has also been set to a filename, the filename has been ignored
2021-09-17 03:32:26,208 INFO RPC interface 'supervisor' initialized
2021-09-17 03:32:26,208 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2021-09-17 03:32:26,208 INFO supervisord started with pid 76
2021-09-17 03:32:27,210 INFO spawned: 'greaterwms' with pid 77
2021-09-17 03:32:28,071 INFO success: greaterwms entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)

//特别备注：执行docker-compose up -d后会自动下载前端依赖，有时会下载失败，导致前端无法启动，此时先执行docker-compose down再docker-compose up -d重新下载，直至成功为止。

```

8.访问入口

```
   前端：http://127.0.0.1:8080 或者 http://服务器IP:8080

   后端：http://127.0.0.1:8008 http://服务器IP:8008

   nginx: http://127.0.0.1 或者http://服务器IP
```
