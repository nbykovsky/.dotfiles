### Configure LXD
Add public key to default lxd profile to be able to ssh to container 
```
lxc profile edit default
```

```
config:
  user.user-data: |
    #cloud-config
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkSwW+Vs3t0cGtL/kG7GAsXNlLAlLj5OiZmWD4VfvcG nikolay.bykovsky@gmail.com
description: Default LXD profile
....
```

Configure dns to be able to use host names 
```
sudo systemd-resolve --interface=lxdbr0 --set-dns=`ip -f inet addr show dev lxdbr0 | grep -Po 'inet \K[\d.]+'` --set-domain=lxd
```

Useful commands
```
sudo resolvectl domain lxdbr0 'lxd'
```

```
systemd-resolve --status lxdbr0
```

```
systemd-resolve --interface lxdbr0 --revert
```

```
lxc network show lxdbr0
```
Links
https://blog.simos.info/how-to-use-lxd-container-hostnames-on-the-host-in-ubuntu-18-04/
https://discuss.linuxcontainers.org/t/lxd-container-hostnames-on-the-host/11789/13
https://askubuntu.com/q:uestions/1106369/how-to-ssh-into-a-lxd-guest
