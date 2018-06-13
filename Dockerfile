FROM qoboltd/docker-centos-base

ENV container docker
ARG REMI_REPO=remi-php71

# Install Remi repo
RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Enable REMI PHP 5.6
RUN yum-config-manager --enable ${REMI_REPO}

# Install PHP and Tools 
RUN yum -y install php-bcmath \
    php-cli \
    php-common \
    php-fpm \
    php-gd \
    php-intl \
    php-json \
    php-ldap \
    php-mbstring \
    php-mcrypt \
    php-mysqlnd \
    php-opcache \
    php-pdo \
    php-pecl-apcu \
    php-process \
    php-soap \
    php-xml \
    php-xmlrpc \
    mariadb

# Configure PHP timezone
RUN sed -i -e 's~^;date.timezone =$~date.timezone = UTC~g' /etc/php.ini

CMD ["/bin/bash"]
