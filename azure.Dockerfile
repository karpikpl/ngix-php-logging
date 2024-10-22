FROM mcr.microsoft.com/appsvc/wordpress-debian-php:8.3

# copy the nginx configuration file
COPY nginx/zzz.ngix.logging.conf /etc/nginx/conf.d/zzz.ngix.logging.conf

# copy the custom PHP-FPM configuration file
COPY php-fpm/zzzzz-logging.conf /usr/local/etc/php-fpm.d/zzzzz-logging.conf

# COPY supervisord.custom.conf /etc/supervisord.custom.conf
# COPY startup.sh /home/dev/startup.sh
# RUN chmod +x /home/dev/startup.sh

# in /etc/supervisord.conf
# change log levels for [program:php-fpm] and [program:nginx] using sed
# add 
# stdout_logfile=/dev/stdout
# stdout_logfile_maxbytes=0
# stderr_logfile=/dev/stderr
# stderr_logfile_maxbytes=0
# loglevel=debug
# to [program:php-fpm] and [program:nginx]
