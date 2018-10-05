# Production Deployment

This guide will explain how to set up a production server with this WMS implementation, the stylesheets developed by the University of Calgary for Testbed 14, and the sample data for Testbed 14.

The hardware requirements are light, as there are not many users and the dataset is small enough to be cached in memory. In our case we are using a VM with 4 virtual CPUs, a 40 GB disk, and 8 GB of RAM; it is probable that this deployment would work fine on 2 virtual CPUs, a 10 GB disk, and 1 GB of RAM. (We have an over-provisioned server as we are using it for other testbed projects.)

Our production deployment is a cloud server running Ubuntu Server 18.04 LTS. It has a default `ubuntu` user, which has this repository cloned in its home directory (`/home/ubuntu/d162-wms`). [NVM][] is installed to set up [Node][About Node] v8. SSH is used to set up NVM, Node, and then install the node modules.

The instructions for a production server are identical to those for [development](development.markdown), except there are some additional configuration options noted below.

There are systemd unit scripts in the `init` directory that are useful for managing the WMS and kosmtik instances.

When running under production, it may be necessary to modify the default HTTP host that is reported to clients in the Capabilities document. This can be done when starting the server:

```sh
$ HOST="testbed.gswlab.ca" node index.js
```

This can also be modified in the `init/wms.service` script for systemd.

Certain fonts are neede for the renderer, and can be installed using apt:

```sh
$ sudo apt update
$ sudo apt install fontconfig fonts-dejavu-core fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted fonts-hanazono ttf-unifont fonts-open-sans
$ sudo fc-cache -f -v
```

Instructions for MacOS using homebrew:

```sh
$ brew update
$ brew cask install font-dejavu-sans font-noto-sans-cjk font-noto-sans font-hanamina font-gnu-unifont font-open-sans
```

[About Node]: https://nodejs.org/en/about/
[NVM]: https://github.com/creationix/nvm

## Enabling Remote Access

In the case where a cloud instance is used as the host machine, it will be necessary to set up remote access for updating and testing stylesheets. While it is possible to use Git for this purpose, it is not the best tool for rapidly iterating on changing a stylesheet.

Instead, we use OpenSSH to allow a stylesheet developer to upload and edit the stylesheet and associated images/data, and have kosmtik automatically update when those files are changed on disk.

As our server is Ubuntu Server, OpenSSH is automatically installed and used by a system administrator to login and set up the system. It also includes support for [SFTP][], allowing users to download/upload files similar to using FTP (although SFTP is an entirely different protocol).

Our cloud service does not allow password login, instead opting for the more secure public key authentication. This requires each connecting user to generate a private/public keypair and having their public key (ONLY their public key) added to the server as an authorized key. Instructions on generating these keys and adding them to the authorized keys is detailed in the [Ubuntu Server Guide][USG].

[SFTP]: https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol
[USG]: https://help.ubuntu.com/community/SSH/OpenSSH/Keys
