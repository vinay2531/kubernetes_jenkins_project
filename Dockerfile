FROM rockylinux:9
LABEL maintainer="vinaypatil253@gmail.com"
RUN yum install -y httpd \
 zip\
 unzip
ADD https://templated.live/roadtrip/download/roadtrip.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip roadtrip.zip
RUN cp -rvf roadtrip/* .
RUN rm -rf roadtrip roadtrip.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 443
