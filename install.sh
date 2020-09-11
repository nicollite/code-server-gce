# Install ubuntu commands
sudo apt update
sudo apt-get install lsof 

# Install code server
echo "Installing code-server..."
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run
curl -fsSL https://code-server.dev/install.sh | sh

# Install NVM
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Add NVM command path
echo "Add the folowing lines to you to your .bashrc or .zshrc"

# Change the space files to user
sudo chown -R $USER:$USER .

# Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install node 12 and npm
nvm install 12
nvm alias default 12
nvm use 12
nvm install --latest-npm

# Install nginx
echo "Installing nginx..."
sudo apt update
sudo apt install nginx

# Create fowading configuration for nginx
echo "Setting nginx configs"
# Remove default nginx configs
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
# Set new nginxs configs
sudo chmod go+w /etc/nginx/sites-available
sudo cp nginx.config /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
# Restart nginx after setting configs
sudo systemctl stop nginx
sudo systemctl start nginx

printf '\nYou can run code-server with "bash start.sh"\n'