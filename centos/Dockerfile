FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install openssh-server

RUN useradd remote_user && \
  echo "remote_user:1234" | chpasswd && \
  mkdir /home/remote_user/.ssh && \
  chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

# ให้ความเป็นเจ้าของ folder .ssh เป็นของ user: remote_user
RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
  chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

# ลบไฟล์ที่ห้ามไม่ให้ login ทิ้งไป
RUN rm /run/nologin

# ติดตั้ง mysql client
RUN yum -y install mysql

# ติดตั้ง awscli ด้วย python
RUN yum -y install python3-pip
RUN pip3 install awscli --upgrade

# install docker
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## in centos docker will not start automatically so we have to start it ##
CMD /usr/sbin/sshd -D  && \
  systemctl start docker