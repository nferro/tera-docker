 This Docker image expects the environment variables `PORT` and `PASSWORD` to define on which port the GUI listens and what password should be used to authenticate. By default port is `8080` and password is `changeme`.

# Build
  Build image:
 ```
 ./build.sh
 ```

# Running


## Main network
  Run interactively (forwarding ports):
 ```
 docker run -it -p 8080:8080 -p 30000:30000 \
   -v $(pwd)/DATA:/DATA \
   --name tera tera
 ```

  Run on the background (using the host network):
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

# Donations
If you find this useful please consider sending a donation to account #221489. :)