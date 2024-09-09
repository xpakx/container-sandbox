FROM fedora:39

RUN dnf install -y openssh-server passwd

RUN ssh-keygen -A

RUN useradd -m -s /bin/bash guest
RUN echo "guest:password" | chpasswd

RUN echo "Welcome to the container! Enjoy your session." > /etc/motd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
