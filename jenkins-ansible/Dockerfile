FROM jenkins/jenkins 

USER root

RUN apt update -y

# install ping cli
RUN apt install -y iputils-ping

# install python3
RUN apt -y install python3

# install pip3
RUN apt install python3-pip -y

# install ansible
RUN pip3 install ansible --break-system-packages

USER jenkins