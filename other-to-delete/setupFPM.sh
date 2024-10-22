#!/bin/bash

# Define the path to the PHP-FPM pool configuration file
PHP_FPM_CONF="/usr/local/etc/php-fpm.d/www.conf"

# Check if the file exists
if [ -f "$PHP_FPM_CONF" ]; then
    # Use sed to replace the listen directive
    sed -i 's|listen = 127.0.0.1:9000|listen = /usr/local/var/run/php-fpm.sock|' "$PHP_FPM_CONF"
    sed -i 's|;catch_workers_output = yes|catch_workers_output = yes|' "$PHP_FPM_CONF"
    echo "PHP-FPM listen directive updated to use Unix socket."
    # add to /usr/local/etc/php-fpm.conf
    # ;error_log = /var/log/php-fpm/error.log
    # error_log = /dev/stderr

    # ;access.log = /var/log/php-fpm/access.log
    # access.log = /dev/stdout
    sed -i 's|;error_log = log/php-fpm.log|error_log = /dev/stderr|' /usr/local/etc/php-fpm.conf

else
    echo "PHP-FPM configuration file not found at $PHP_FPM_CONF."
fi