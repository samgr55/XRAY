FROM tecadmin/ubuntu-ssh:16.04

LABEL maintainer="sam@samrahmeh.com"

RUN apt-get update \
   && apt-get install -y apache2


RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

RUN cd /var/www/html

RUN wget https://github.com/samgr55/XRAY/archive/refs/heads/main.zip

RUN unzip main.zip

RUN cp -r XRAY-main/* /var/www/html/

RUN rm -rf XRAY-main main.zip


WORKDIR /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80
