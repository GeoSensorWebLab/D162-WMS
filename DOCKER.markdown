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

Please use the [official installation instructions for Docker on MacOS][macos].

[macos]: https://docs.docker.com/docker-for-mac/install/

## Install Docker on Linux

Official Docker packages and [instructions are available for multiple Linux distributions][linux], such as CentOS, Debian, Fedora, and Ubuntu.

[linux]: https://docs.docker.com/install/#supported-platforms

## Getting Started with Docker

If you have not used Docker, I recommend reading the "[Getting Started with Docker][getting-started]" guide. This will give you a background in how Docker works, and introduce you to Docker-specific terms.

[getting-started]: https://docs.docker.com/get-started/

## Developing D162 WMS Implementation using Docker

TODO: Write instructions for setting up a container that runs kosmtik

## Deploying D162 WMS Implementation using Docker

TODO: Write instructions for setting up a container that runs the WMS implementation (no local code sync needed)

