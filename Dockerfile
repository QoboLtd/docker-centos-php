FROM qoboltd/docker-centos-base

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS with REMI PHP Image" \
    org.label-schema.vendor="Qobo Ltd" \
    org.label-schema.livence="MIT" \
    org.label-schema.build-data="201806134"

MAINTAINER Qobo Ltd info@qobo.biz

ARG REMI_REPO=remi-php71

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
