#!/bin/bash

# Restore script for SecureWeb

# Set variables
BACKUP_DIR="/path/to/backup/directory"
APP_DIR="/var/www/secureweb"
DB_FILE="$APP_DIR/SecureWeb.db"

# Ask for the timestamp of the backup to restore
read -p "Enter the timestamp of the backup to restore (YYYYMMDD_HHMMSS): " TIMESTAMP

# Restore source code
tar -xzf $BACKUP_DIR/secureweb_source_$TIMESTAMP.tar.gz -C /

# Restore database
cp $BACKUP_DIR/SecureWeb_$TIMESTAMP.db $DB_FILE

# Restore configuration
cp $BACKUP_DIR/appsettings_$TIMESTAMP.json $APP_DIR/appsettings.json

# Restart the application
sudo systemctl restart secureweb

echo "Restore completed successfully!"