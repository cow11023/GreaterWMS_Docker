Deploy greaterwms under docker (this document is applicable to users with docker Foundation)

1. Install or Upgrade Docker Client

```
	curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
	//If you are prompted that there is no curl, execute sudo apt install curl or yum - y install curl
```

2. Install Docker Compose

   	sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   	sudo chmod +x /usr/local/bin/docker-compose

3. Verify that docker is installed successfully
   ```
           docker info //Verify docker version information
        docker-compose version //Verify docker compose version information
        sudo systemctl status docker //Check whether docker is running
        sudo systemctl start docker //If not, start docker
   ```
4. Use docker to directly test run the project (non secondary development, user trial, no need to clone the project from GitHub)

   ```
   docker run -itd --name greaterwms_v2.0.25 -p 8008:8008 -d silence2022/greaterwms:v2.0.25
   ```


5. Install git

```
//Install git under Ubuntu
apt-get install git
//Install git under CentOS
yum install git
```

6. It is suitable for long-term data storage (code needs to be stored on the user server) and secondary development

```English
//Pull code
git clone https://github.com/Singosgu/GreaterWMS.git
//You need to modify the contents of baseurl.js before running the project
vim templates/public/statics/baseurl.js //Change 127.0.0.1 to the IP address of the server
//You need to modify nginx.conf before running the project
vim nginx.conf //Change 127.0.0.1 to the native IP address. If deployed to the server, change to the server IP address
docker-compose up -d
//View the greaterwms image operation log (the front-end and back-end run together here)
docker logs -f greaterwms_v2.0.25
//When the following information appears in the printed front-end log, it indicates that the front-end is started successfully
 N  App dir........... /GreaterWMS/templates
    App URL........... http://localhost:8080
    Dev mode.......... spa
    Pkg quasar........ v1.15.23
    Pkg @quasar/app... v2.2.10
    Transpiled JS..... yes (Babel)
  
｢wds｣: Project is running at http://0.0.0.0:8080/
｢wds｣: webpack output is served from 
//Special note: after executing docker-compose up -d, the front-end dependencies will be automatically downloaded. Sometimes the download fails, resulting in the front-end unable to start. At this time, first execute docker-compose down and then docker-compose up -d, to download again until it succeeds.
```

7. compile front-end code

```English
//Enter the greaterwms container
docker exec -it greaterwms_v2.0.25 /bin/bash
//Enter the templates directory in the container
cd templates
//Compile front-end code
quasar build 
```

6. Access portal

```English
//Front end access portal
http://127.0.0.1:8080 或者 http://服务器IP:8080
//Back end access portal
 http://127.0.0.1:8008 http://服务器IP:8008
 //the nginx
 http://127.0.0.1 或者http://服务器IP

```
