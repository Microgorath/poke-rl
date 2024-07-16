# update system
apt update
apt upgrade -y
# install Python packages
python3 -m pip install --upgrade pip
pip3 install --user -r .devcontainer/requirements.txt

# install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
bash -i -c 'nvm install node'

# Set up pokemon showdown repo
git clone https://github.com/smogon/pokemon-showdown.git
cd pokemon-showdown
bash -i -c 'npm install'
cp config/config-example.js config/config.js
cd ..