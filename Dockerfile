FROM rockylinux:9
LABEL maintainer="vinaypatil253@gmail.com"

RUN yum install -y httpd zip unzip

# Download template zip
ADD https://templated.live/roadtrip/download/roadtrip.zip /var/www/html/

WORKDIR /var/www/html/

# Unzip directly (it extracts files into current directory)
RUN unzip roadtrip.zip

# No folder to copy from — the files are already extracted in current dir

# Remove leftover zip file
RUN rm -f roadtrip.zip

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 443
