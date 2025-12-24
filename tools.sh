echo "====Installing zsh===="
sudo apt install zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "====Installing Zoxide===="

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "====Installing colorls===="
sudo apt install -y ruby-full
sudo gem install colorls

echo "====Installing fzf===="
sudo apt install fzf

echo "====Installing node, ng===="
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v
npm -v
npm install -g @angular/cli

echo "====Installing kitty===="
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo "====Installing Brave===="
curl -fsS https://dl.brave.com/install.sh | sh
