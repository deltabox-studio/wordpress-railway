#!/usr/bin/env bash
set -Eeuo pipefail

TMP_WP_PATH=/tmp/wordpress
TMP_WP_DATA_PATH=$TMP_WP_PATH/data
WP_DATA_PATH=/var/www/html

# copy existing WordPress installation if it exist
if [ -n "$(ls -A "/$TMP_WP_DATA_PATH/migrate" 2>/dev/null | grep -v '^\.gitkeep$')" ]; then
    echo "Found an existing WordPress installation."
    echo "Copying existing WordPress installation to $WP_DATA_PATH..."
    mkdir -p "$WP_DATA_PATH"
    cp -R "$TMP_WP_DATA_PATH/migrate/." "$WP_DATA_PATH/"
    # set appropriate permissions for the volume
    chown -R www-data:www-data $WP_DATA_PATH
else
    echo "No existing WordPress installation found in $TMP_WP_DATA_PATH/migrate"
fi

# clean up temporary files
if [ -n "$(ls -A /$TMP_WP_PATH)" ]; then
    echo "Cleaning up temporary files at $TMP_WP_PATH..."
    rm -rf "$TMP_WP_PATH"
else
    echo "No temporary files to delete found at $TMP_WP_PATH"
fi

PORT=${PORT:-8080}
PUBLIC_DOMAIN=${RAILWAY_PUBLIC_DOMAIN:-localhost}

if [ $PUBLIC_DOMAIN == "localhost" ]; then
    PUBLIC_URL=http://localhost:$PORT
else
    PUBLIC_URL=https://$PUBLIC_DOMAIN
fi

# fallback to index.php if index.html is not found
echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

# run the base entrypoint first
echo "Running base entrypoint..."
/usr/local/bin/docker-entrypoint.sh apache2-foreground

# avoid the "More than one MPM loaded" error by disabling mpm_event and mpm_worker
a2dismod mpm_event || true
a2dismod mpm_worker || true
a2dismod mpm_prefork || true

# enable mpm_prefork only
a2enmod mpm_prefork

echo ""
echo "WordPress live at $PUBLIC_URL"
echo ""

# execute the original command
exec "$@"