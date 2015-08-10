FROM docker.io/openshift/base-centos7
MAINTAINER Florian Lambert

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all

RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

RUN echo "bla"

RUN chown nobody:nobody /run -R
RUN sed -i 's/root:.*/root:\$6\$e2v9kkVP$J59\/T4\.TRaCARI8Zs59HqpmhwWVVOFlnhZJl7NxdVjCMyb7BoPEcJOyatgq90GLJ7yXHCNUygUi3KU9wPNE\/00:16523:0:99999:7:::/g' /etc/shadow

COPY . /

EXPOSE 8080

# Simple startup script to avoid some issues observed with container restart 
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
