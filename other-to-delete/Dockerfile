# Use the official WordPress image as the base
FROM wordpress:php7.4-fpm

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Create a non-root user and group
RUN groupadd -g 1000 appuser && useradd -u 1000 -g appuser -m appuser

# Copy Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY zzzzz-custom.conf /usr/local/etc/php-fpm.d/zzzzz-custom.conf

# Set proper permissions for PHP-FPM socket directory
# RUN mkdir -p /usr/local/var/run && \
#     chown appuser:appuser /usr/local/var/run && \
#     chown -R appuser:appuser /var/lib/nginx && \
#     chown -R appuser:appuser /var/log/nginx && \
#     chwon -R appuser:appuser /run

RUN chmod 755 /usr/local/var/run/ && \
    chown nobody:root /usr/local/var/run

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx as non-root user
# USER appuser

CMD ["sh", "-c", "/usr/local/bin/docker-entrypoint.sh php-fpm && nginx -g 'daemon off;'"]