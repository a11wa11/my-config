FROM amazonlinux:2

RUN amazon-linux-extras install -y epel; \
    yum update -y; \
    yum install -y tor tree procps-ng python3 glibc-langpack-ja cronie; \
    pip3 install beautifulsoup4 PySocks schedule pyvim; \
    echo "alias ll='ls -la --color'" >> /root/.bashrc; \
    systemctl enable tor

COPY access_with_Tor.py /root/
EXPOSE 9050
CMD /sbin/init

ENV LANG=ja_JP.UTF-8   \
    LANGUAGE=ja_JP:ja  \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR /root
