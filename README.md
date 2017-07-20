Role Name
=========

Config docker, support Upstart, SysVinit and Systemd.

Requirements
------------

Ubuntu trusty (14.04), Ubuntu xenial (16.04), CentOS 7.

Role Variables
--------------

docker_insecure_registries: []

docker_registry_mirrors: []

Dependencies
------------

none.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD, MIT

Author Information
------------------

https://github.com/chshawkn

## debug jinja2 template

see: https://stackoverflow.com/questions/35407822/how-can-i-test-jinja2-templates-in-ansible
```sh
ansible all -i "localhost," -c local -m template \
    -a "src=tests/test.txt.j2 dest=./test.txt" \
    --extra-vars='{"users": ["Mike", "Smith", "Klara", "Alex"]}'
    
ansible all -i "localhost," -c local -m template \
    -a "src=templates/etc_docker_daemon_json.j2 dest=./test.txt" \
    --extra-vars='{"docker_insecure_registries": ["reg1:5000", "reg2:5000"], docker_registry_mirrors: ["http://reg1:5000"]}'

ansible all -i "localhost," -c local -m template \
    -a "src=templates/etc_default_docker.j2 dest=./test.txt" \
    --extra-vars='{"docker_insecure_registries": ["reg1:5000", "reg2:5000"], docker_registry_mirrors: ["http://reg1:5000"]}'
```
