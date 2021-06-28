FROM centos:7


RUN yum -y install openssh-server

RUN useradd demo_user && \
   echo "mysupersecret" | passwd demo_user --stdin && \
   mkdir /home/demo_user/.ssh && \
   chmod 700 /home/demo_user/.ssh 
