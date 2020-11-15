#!/bin/bash
FROM raspbian/stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libffi-dev libbz2-dev liblzma-dev libsqlite3-dev libncurses5-dev libgdbm-dev zlib1g-dev libreadline-dev libssl-dev tk-dev build-essential libncursesw5-dev libc6-dev openssl git
    
# download and install python3.8
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tar.xz && \
    tar xf Python-3.8.4.tar.xz && \
    cd Python-3.8.4 && \
    ./configure && \
    make -j -l 4 && \
    make altinstall
    
# make python3.8 default python3
RUN echo "alias python3=python3.8" >> ~/.bashrc

RUN python3.8 -m pip install smbus RPi.GPIO
