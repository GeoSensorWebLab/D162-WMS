# Docker Instructions

Docker is a container engine that has similarities to a virtual machine management system. With a container, a tiny OS with only the libraries needed to develop/deploy this application can be set up. This provides a few benefits:

* No worry about conflicting versions of libraries, as only the needed one is installed in the container
* Setting up the environment variables to point to the correct tool and run-time environments is automatically set up by the container configuration script
* When finished, the developer can erase the container and not have to worry about stray old versions of libraries cluttering their computers
* The code can be "mounted" inside the container, so the developer can edit the application on their host OS and have the changes update in the container application

**Please Note**: This guide will be using Docker Community Edition, which is free.

## Install Docker on Windows

Please use the [official installation instructions for Docker on Windows][windows].

[windows]: https://docs.docker.com/docker-for-windows/install/

## Install Docker on MacOS

Please use the [official installation instructions for Docker on MacOS][macos]. Note that you may have to set up the MacOS Docker application to enable File Sharing for the D162 WMS application directory (*or* for any directory containing the repository) in order for some Docker commands to work. This File Sharing only enables Docker containers to access the directories *if* you try to mount them with `docker run` — it does not enable File Sharing across a network.

[macos]: https://docs.docker.com/docker-for-mac/install/

## Install Docker on Linux

Official Docker packages and [instructions are available for multiple Linux distributions][linux], such as CentOS, Debian, Fedora, and Ubuntu.

[linux]: https://docs.docker.com/install/#supported-platforms

## Getting Started with Docker

If you have not used Docker, I recommend reading the "[Getting Started with Docker][getting-started]" guide. This will give you a background in how Docker works, and introduce you to Docker-specific terms.

**Recommendation**: If you can configure the amount of RAM available to Docker, increase it from the default 1.0 GB to a higher number based on your host computer. More RAM will speed up Docker when building images.

[getting-started]: https://docs.docker.com/get-started/

## Developing D162 WMS Implementation using Docker

The base image created for this D162 application can be used for both developing the stylesheets as well as running the WMS implementation, depending on the arguments passed into the `docker run` command.

```sh
$ docker build . -t geosensorweblab/d162-wms
$ docker run -it --init --rm -v "$PWD/styles":/app/styles -v "$PWD/data":/app/data -p 6789:6789 geosensorweblab/d162-wms /app/node_modules/.bin/kosmtik serve styles/nedata.mml
```

A server will be created in the container and is accessible on localhost port 6789: http://localhost:6789.


## Deploying D162 WMS Implementation using Docker

The base image created for this D162 application can be used for both developing the stylesheets as well as running the WMS implementation, depending on the arguments passed into the `docker run` command.

```sh
$ docker build . -t geosensorweblab/d162-wms
$ docker run -p 3000:3000 -it --init --rm geosensorweblab/d162-wms node index.js
```

This will create an image template from the current code, and then launch a container based on that image. The service will be linked to run on the host OS on port 3000. You can use `control-C` to quit the running Docker container.

Note that `node index.js` in the above command is optional; if it is not included, then Docker will run `node index.js` as the default command.
