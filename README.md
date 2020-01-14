## Install the docker ang git packages:

 ```
 sudo apt update; \
 sudo apt install docker.io git nano
 ```
## Clone git repository
 ```
 git clone https://github.com/nferro/tera-docker.git
 ```

## Build
  Build image:
 ```
 cd tera-docker
 ./build.sh
 ```

## Create Tera DATA folder (example below):

 ```
 cd ~
 mkdir TERA
 cd TERA
 ```

## Ensure you have external ports open and/or forwarded if you're behind NAT. As example enable port 8080 and 30000:

 ```
 sudo ufw allow 8080 comment "Tera Web"
 sudo ufw allow 30000 comment "Tera Node"
 ```

  This Docker image expects the environment variables `PORT` and `PASSWORD` to define on which port the GUI listens and what password should be used to authenticate. By default port is `8080` and password is `changeme`.
  
## Main network
  Run interactively (forwarding ports 8080 for Web Interface and 30000 for the node):
 ```
 docker run -it -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera tera
 ```
  Run the same from the Docker repo without build:
 ```
 docker run -it -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera nunoferro/tera:latest
 ```  

  Run in the background as a service (forwarding ports 8080 for Web Interface and 30000 for the node):
 ```
 docker run -d --restart always -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera tera
 ```
  Run the same from the Docker repo without build:
 ```
 docker run -d --restart always -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera nunoferro/tera:latest
 ``` 

  Run in the background as a service. You may also want to change the `PASSWORD` (strongly reccommended) and `PORT` environment variables:
 ```
 docker run -d --restart always -p 8080:8090 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=change_to_another_password \
   -e PORT=8090 \
   --name tera tera
 ```
  Run the same from the Docker repo without build:
 ```
 docker run -d --restart always -p 8080:8090 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=change_to_another_password \
   -e PORT=8090 \
   --name tera nunoferro/tera:latest
 ```

  Run on the background (using the host network - less secure, as all ports from inside the docker are exposed):
 ```
 docker run -d --restart always --net=host \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=another_password \
   --name tera tera
 ```
  Run the same from the Docker repo without build:
 ```
 docker run -d --restart always --net=host \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=another_password \
   --name tera nunoferro/tera:latest
 ```
 
## Test network
 If you want to run on the test network you need to change the volume to the `DATA-TEST` directory and set the command to `/tera/run-test.sh`. You may also want to change the `PORT` environment variable.
 
 Run interactively (forwarding ports):
```
 docker run -it -p 8081:8081 -p 40000:40000 \
   -v $(pwd)/DATA-TEST:/DATA-TEST \
   -e PORT=8081 \
   --name tera tera /tera/run-test.sh
```

 Run on the background (using the host network):
```
 docker run -d --restart always --net=host \
   -v $(pwd)/DATA-TEST:/DATA-TEST \
   -e PASSWORD=another_password \
   -e PORT=8081 \
   --name tera tera /tera/run-test.sh
 ```


If you find this useful please consider sending a donation to account #221489. :)
