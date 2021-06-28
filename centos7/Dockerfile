FROM centos:7


RUN yum -y install openssh-server

RUN useradd demo_user && \
   echo "mysupersecret" | passwd demo_user --stdin && \
   mkdir /home/demo_user/.ssh && \
   chmod 700 /home/demo_user/.ssh

COPY remote-key.pub /home/demo_user/.ssh/authorized_keys

RUN chown demo_user:demo_user -R /home/demo_user/.ssh/ && \
    chmod 600 /home/demo_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen


CMD /usr/sbin/sshd -D  
