
__Preliminary Documentation__ - 2020-04-21
____  
## ewsdocker/alpine-apache


An __Docker Alpine__-based __Apache2__ Server based on the latest release
of  
__httpd:2.4.43-alpine__ from 
[The Apache HTTP Server Project](https://hub.docker.com/_/httpd).  

### Availability  

__Source: [GIT Repository}(https://github.com/ewsdocker/alpine-apache)__  
__Docker Image: [ewsdocker/alpine-apache]()__  

____  

__Getting the source__  

    git clone https://github.com/ewsdocker/alpine-apache  

__Getting pre-built image__

    docker pull ewsdocker/alpine-apache:2.4.43  

  or  

    docker pull ewsdocker/alpine-apache:latest  

__Building and Installing__  

In the following 2 examples, the volume line (-v) must be modified to
to point to the host directory to point to the actual files to be served.  

  __Manual Build and Install__  

    docker build --file=Dockerfile -t alpine-apache:2.4.43 .  

    docker run \
      -dit \
      --name httpd \
      -p 80:80 \
      -v ${HOME}/public_html/:/usr/local/apache2/htdocs/ \
    alpine-apache:2.4.43  

  __Build and Install Script__
  
  Navigate to the "builds" directory in the alpine-apache source directory
  and run the script named __build-httpd.sh__ (you may have to make it an
  executable file).

