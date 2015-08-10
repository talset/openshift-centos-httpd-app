FROM centos:latest
MAINTAINER Florian Lambert

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all

RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

COPY . /

EXPOSE 8080

# Simple startup script to avoid some issues observed with container restart 
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
