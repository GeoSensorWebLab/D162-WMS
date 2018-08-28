# Init Scripts

Here are scripts used to manage the kosmtik and WMS through system service tools.

## systemd

Systemd is the default init system for Ubuntu 15.04 and later.

There are two scripts for use with systemd: `kosmtik.service` and `wms.service`. They are intended to be used with a cloud server that has a default `ubuntu` user, and that this repository resides in `/home/ubuntu/D162-WMS`. Node 8 should be installed with [NVM](https://github.com/creationix/nvm), and the node modules should be installed in the project.

These scripts can be installed at the user level, which require no super-user privileges. Create the user level directory:

```sh
$ mkdir -p $HOME/.config/systemd/user
```

And install the scripts under that directory. Then use systemctl to reload the services, and start them:

```sh
$ systemctl --user daemon-reload
$ systemctl --user start kosmtik
$ systemctl --user start wms
```

Status can be checked as well:

```sh
$ systemctl --user status kosmtik
$ systemctl --user status wms
```

To enable the services to start at boot, use `enable`. This can be reversed with `disable`. This requires the super-user to enable the feature for the `ubuntu` user.

```sh
$ sudo loginctl enable-linger ubuntu
$ systemctl --user enable kosmtik
$ systemctl --user enable wms
```
