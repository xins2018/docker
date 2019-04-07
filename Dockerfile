# base image
FROM centos

# MAINTAINER
MAINTAINER cyf2018@sina.com

# running required command
CMD [ "/usr/sbin/init"]

# java
RUN yum install java -y


# mariadb
RUN yum install mariadb mariadb-server -y
# 引入文件
ADD mysql/init.sql /root/init.sql
ADD mysql/server.cnf /etc/my.cnf.d/server.cnf
ADD mysql/setup.sh /root/setup.sh
CMD ["/root/setup.sh"]
# 启动mariadb
RUN systemctl start mariadb
# mariadb设置开机启动
RUN systemctl enable mariadb

# redis
RUN yum install epel-release -y
RUN yum install redis -y

# nginx
RUN yum install nginx -y
