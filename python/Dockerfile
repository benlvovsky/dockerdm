# Base python 2.7 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:16.04
MAINTAINER Michael Twomey, mick@twomeylee.name

#ENV DEBIAN_FRONTEND="noninteractive"

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.6``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN echo "postfix postfix/mailname string mail.ippon.fr" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
#RUN echo "postfix postfix/inet_interfaces string 'localhost'" | debconf-set-selections

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python-pip \
    python2.7 \
    python2.7-dev \
    curl \
#    ssh \
    postgresql-client-9.6 postgresql-contrib-9.6 \
    openssh-server \
#    postfix \
    mailutils \
    vim \
    syslog-ng \
    syslog-ng-core \
    && apt-get autoremove \
    && apt-get clean

RUN /usr/sbin/postconf -e "inet_interfaces = localhost"
RUN /usr/sbin/postconf -e "compatibility_level = 2"
RUN /usr/sbin/postconf -e myhostname=ippon.fr
#RUN /usr/sbin/postconf -e mydestination="mail.ippon.fr, ippon.fr, localhost.localdomain, localhost"
RUN /usr/sbin/postconf -e mail_spool_directory="/var/spool/mail/"
RUN /usr/sbin/postconf -e mailbox_command=""

#RUN sed -i 's/inet_interfaces = all/inet_interfaces = loopback-only/g' /etc/postfix/main.cf
#service postfix restart
RUN pip install -U "setuptools==3.4.1"
RUN pip install -U "pip==1.5.4"
RUN pip install -U "Mercurial==2.9.1"
RUN pip install -U "virtualenv==1.11.4"
RUN pip install psycopg2

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo 'alias dm="cd /mnt/dev/stockdatamine"' >> ~/.bashrc

# system() can't be used since Docker doesn't allow access to /proc/kmsg.
# https://groups.google.com/forum/#!topic/docker-user/446yoB0Vx6w
RUN sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf
# https://github.com/LyleScott/docker-postfix-gmail-relay/issues/1
#RUN sed -i '/^smtp_tls_CAfile =/d' /etc/postfix/main.cf

EXPOSE 22
CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; /usr/sbin/sshd -D"]
#CMD [bash]
#ENTRYPOINT ["/usr/bin/python2.7"]
