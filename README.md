# docker
Docker packages for gnu linux systems.

# create users and groups
groupadd -g 3000 -r midgrp
groupadd -g 3100 -r docker
useradd -u 3001 -g midgrp -s /bin/bash midadm
