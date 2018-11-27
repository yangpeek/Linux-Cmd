# docker build -t chef-workstation -f Dockerfile . 
# docker run -it -v "`pwd`:/root/chef-repo" chef-workstation /bin/bash

FROM debian:jessie

RUN apt-get update && \
    apt-get install curl -y && \
    apt-get install vim -y && \
    apt-get install tree -y && \
    apt-get install ansible -y && \
    apt-get install sshpass -y && \
    curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v 2.5.3
