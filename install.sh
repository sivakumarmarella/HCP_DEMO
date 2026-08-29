#!/bin/bash

# Output all commands to a log file for easy debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting installation process..."

# Update package lists (This assumes an Ubuntu/Debian instance)
sudo apt-get update -y

# Install Nginx
sudo apt-get install -y nginx

# Ensure Nginx is running and set to start on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a simple custom web page
echo "<h1>Hello from your Terraform Provisioner!</h1>" | sudo tee /var/www/html/index.html

echo "Installation complete!"