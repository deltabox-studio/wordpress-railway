FROM wordpress:php8.4-apache

USER root

# stop the base entrypoint from running main process
RUN sed -i 's/^exec "$@"/echo "Base entrypoint finished running"/' /usr/local/bin/docker-entrypoint.sh

# copy entrypoint and make it executable
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# copy existing WordPress installation if it exist and move it to tmp
COPY ./data/migrate/. /tmp/wordpress/data/migrate/

# set appropriate permissions for the volume
RUN chown -R www-data:www-data /var/www/html

# ensure apache recognizes localhost
RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

# fallback to index.php if index.html is not found
RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

# expose port 8080 for Railway and localhost
EXPOSE 8080

# start apache via entrypoint
ENTRYPOINT ["entrypoint.sh"]
CMD ["apache2-foreground"]