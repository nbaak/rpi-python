FROM raspbian/stretch

ENV PYTHON_VERSION=3.9.1

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libffi-dev libbz2-dev liblzma-dev libsqlite3-dev libncurses5-dev libgdbm-dev zlib1g-dev libreadline-dev libssl-dev tk-dev build-essential libncursesw5-dev libc6-dev openssl git
    
# download and install python
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz && \
    tar xf Python-${PYTHON_VERSION}.tar.xz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure && \
    make -j -l 4 && \
    make altinstall
    
# set default python version
RUN echo "alias python3=python${PYTHON_VERSION}" >> ~/.bashrc

#RUN python3 -m pip install smbus RPi.GPIO
