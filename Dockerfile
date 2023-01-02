FROM amazonlinux:latest


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

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
