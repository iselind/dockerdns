Docker DNS
==========

This is a service that emulates a DNS for docker containers. When a Docker container start, the container's IP address will be mapped to the container's ID in /etc/hosts. When the container dies, the mapping is removed.

Setup
=====
To set things up execute the setup script as root on a SystemD based system.
