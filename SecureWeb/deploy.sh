#!/bin/bash

# Deployment script for SecureWeb

# Stop the existing application (if running)
sudo systemctl stop secureweb

# Pull the latest changes from the repository
git pull origin main

# Restore dependencies and build the project
dotnet restore
dotnet build --configuration Release

# Run database migrations
dotnet ef database update

# Publish the application
dotnet publish -c Release -o /var/www/secureweb

# Update permissions
sudo chown -R www-data:www-data /var/www/secureweb

# Restart the application
sudo systemctl start secureweb

echo "Deployment completed successfully!"