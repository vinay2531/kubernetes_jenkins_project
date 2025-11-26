FROM centos:centos7
LABEL maintainer="vinaypatil253@gmail.com"
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.tooplate.com/zip-templates/2108_dashboard.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip 2108_dashboard.zip
RUN cp -rvf 2108_dashboard/* .
RUN rm -rf 2108_dashboard 2108_dashboard.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443
