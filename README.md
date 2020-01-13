## Preparation steps
  Install the docker ang git packages:

 ```
 sudo apt update; \
 sudo apt install docker.io git
 ```
  
  
  
  This Docker image expects the environment variables `PORT` and `PASSWORD` to define on which port the GUI listens and what password should be used to authenticate. By default port is `8080` and password is `changeme`.

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

## Main network
  Run interactively (forwarding ports 8080 for Web Interface and 30000 for the node):
 ```
 docker run -it -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera tera
 ```

  Run in the background as a service (forwarding ports 8080 for Web Interface and 30000 for the node):
 ```
 docker run -d --restart unless-stopped -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera tera
 ```

  Run in the background as a service. You may also want to change the `PASSWORD` (strongly reccommended) and `PORT` environment variables:
 ```
 docker run -d --restart unless-stopped -p 8080:8090 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=change_to_another_password \
   -e HTTP_PORT=8090 \
   --name tera tera
 ```

  Run on the background (using the host network - less secure, as all ports from inside the docker are exposed):
 ```
 docker run -d --restart unless-stopped --net=host \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=another_password \
   --name tera tera
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
 docker run -d --restart unless-stopped --net=host \
   -v $(pwd)/DATA-TEST:/DATA-TEST \
   -e PASSWORD=another_password \
   -e HTTP_PORT=8081 \
   --name tera tera /tera/run-test.sh
 ```


If you find this useful please consider sending a donation to account #221489. :)
