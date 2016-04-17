FROM  epitechcontent/blinux

RUN zypper -n install git wget  zlib-devel libopenssl-devel

ADD http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p2.tar.gz /

WORKDIR /
RUN tar xvf openssh-7.2p2.tar.gz
WORKDIR openssh-7.2p2
RUN ./configure && make install && /usr/bin/ssh-keygen -A

RUN useradd jenkins && mkdir -p /home/jenkins
RUN echo "jenkins:jenkins" | chpasswd

CMD ["/usr/sbin/sshd", "-D"]
