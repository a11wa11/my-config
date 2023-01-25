
FROM amazonlinux:2

ENV LANG=en_US.UTF-8

ARG PYTHON_VERSION=python3.8
ARG PIP_VERSION=pip3
ARG ANSIBLE_VERSION=2.9.27
ARG USERNAME=ec2-user
RUN amazon-linux-extras install $PYTHON_VERSION -y && \
    echo "alias python3=$PYTHON_VERSION" >> /etc/bashrc && \
    echo "alias pip=$PIP_VERSION" >> /etc/bashrc && \
    source /etc/bashrc

RUN curl https://bootstrap.pypa.io/get-pip.py | $PYTHON_VERSION && \
    pip install ansible==$ANSIBLE_VERSION

RUN yum update -y && \
    yum install -y sudo coreutils openssh-server which tar make file logrotate cronie && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \    
    useradd -m -s /bin/bash -G wheel $USERNAME && \
    touch /var/log/ansible.log && \
    chown -R $USERNAME:$USERNAME /var/log
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
CMD [ "/sbin/init" ]
USER $USERNAME
WORKDIR /home/$USERNAME

RUN $PYTHON_VERSION -m venv virtualenv && \
    source /home/$USERNAME/virtualenv/bin/activate && \
    pip install ansible==2.13.7