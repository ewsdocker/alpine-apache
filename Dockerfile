FROM nimmis/alpine-micro

MAINTAINER nimmis <kjell.havneskold@gmail.com>

COPY root/. /

RUN apk update \
 && apk upgrade \
 && apk add apache2 libxml2-dev apache2-utils \
 #
 #
# && mkdir /web/ \
 && chown -R apache.www-data /web  \
 #
 #
 && sed -i 's#^DocumentRoot ".*#DocumentRoot "/docs"#g' /etc/apache2/httpd.conf \
 && sed -i 's#AllowOverride [Nn]one#AllowOverride All#' /etc/apache2/httpd.conf \
 #
 #
 && sed -i 's/^#ServerName.*/ServerName webproxy/' /etc/apache2/httpd.conf \
 #
 && sed -i 's#^ServerRoot .*#ServerRoot /web#g'  /etc/apache2/httpd.conf \
 && sed -i 's#^IncludeOptional /etc/apache2/conf#IncludeOptional /web/config/conf#g' /etc/apache2/httpd.conf \
 #
 #
 && sed -i 's#PidFile "/run/.*#Pidfile "/web/run/httpd.pid"#g'  /etc/apache2/conf.d/mpm.conf \
 #
 #
 && sed -i 's#Directory "/var/www/localhost/htdocs.*#Directory "/web" >#g' /etc/apache2/httpd.conf \
 && sed -i 's#Directory "/var/www/localhost/cgi-bin.*#Directory "/web/cgi-bin" >#g' /etc/apache2/httpd.conf \
 #
 #
 && sed -i 's#/var/log/apache2/#/web/logs/#g' /etc/logrotate.d/apache2 \
 #
 #
 && sed -i 's/Options Indexes/Options /g' /etc/apache2/httpd.conf \
 #
 && printf "Build of nimmis/alpine-apache, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` >> /etc/BUILD \
 #
 && rm -rf /var/cache/apk/*

VOLUME /docs

EXPOSE 80 443

