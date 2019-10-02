sagarpatke.nic
=========

Role to configure NIC with static IP.

Role Variables
--------------

You can configure the following roles
```
nic: # Set the network interface name here. `ip a` lists all network interfaces.
bootproto: # 'static' is the only value allowed
ip: # Set the IP address CIDR here. E.g: for IP 192.168.1.10 with Subnet 255.255.255.0, enter `192.168.1.10/24`
gateway: # Default Gateway of the system
dns: [] # Configure DNS servers in correct order. Upto 4 DNS servers are supported.
defroute: # set to `yes` or `true` to configure this as the default route. Default route can be listed with 'ip route'.
on_boot: # when set to `yes`, starts the interface at boot time.
```

Currently, the following values are checked before running the tasks. If the condition is not met, the role does nothing. Do not attempt to set / change the value of the following variables. It is gathered as facts from the target machine.

```
ansible_distribution: 'CentOS'
ansible_distribution_major_version: '8' # '7' is also allowed. Should work with CentOS 7, however I haven't tested it.
```

Dependencies
------------
None

Example Playbook
----------------
```
---
- hosts: all
  become: yes
  roles:
    - role: sagarpatke.nic
      nic: enp0s8
      bootproto: static
      ip: 192.168.100.12/24
      gateway: 192.168.100.1
      dns:
        - 8.8.8.8
      defroute: yes
      on_boot: yes
```
License
-------

MIT

Author Information
------------------

Sagar Patke <sagarpatke@gmail.com>
