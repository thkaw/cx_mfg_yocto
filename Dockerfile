FROM ubuntu:14.04

ADD sources.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

# ref: https://brickyang.github.io/2017/03/16/Docker%20%E4%B8%AD%E5%A6%82%E4%BD%95%E8%AE%BE%E7%BD%AE%20container%20%E7%9A%84%E6%97%B6%E5%8C%BA/
RUN echo "Asia/Taipei" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update

# CX yocto
RUN apt-get install -y linux-libc-dev gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev 
RUN apt-get install -y libsdl1.2-dev xterm sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc
RUN apt-get install -y u-boot-tools

# ref:https://jingyan.baidu.com/article/fcb5aff78bb14dedaa4a711f.html
RUN apt-get install -y dosfstools

RUN apt-get install -y git

# ref: https://stackoverflow.com/questions/25845538/how-to-use-sudo-inside-a-docker-container
# RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' yocto
RUN adduser yocto sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# RUN useradd -ms /bin/bash yocto
USER yocto

# Env ref: https://blog.csdn.net/crystal_tyan/article/details/43967663
ENV USER=yocto
ENV LANG=C
ENV LC_ALL=C
ENV LC_COLLATE=C

WORKDIR /home/yocto

