FROM qoboltd/docker-centos-base

ARG REMI_REPO=remi-php56

# Install Remi repo
RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Enable REMI PHP
RUN yum-config-manager --enable ${REMI_REPO}

# Install PHP and Tools 
RUN yum -y install --setopt=tsflags=nodocs php-bcmath \
    php-cli \
    php-common \
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
    mariadb \
    && yum clean all \
    && rm -rf /var/cache/yum

# Configure PHP timezone
RUN sed -i -e 's~^;date.timezone =$~date.timezone = UTC~g' /etc/php.ini

CMD ["/bin/bash"]
