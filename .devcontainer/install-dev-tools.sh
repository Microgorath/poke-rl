# update system
apt update
apt upgrade -y
# install Python packages
python3 -m pip install --upgrade pip
pip3 install --user -r requirements.txt

# install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Running in interactive shell (-i) allows it to be used as soon as it is installed.
bash -i -c 'nvm install node'

# Set up pokemon showdown repo
git clone https://github.com/smogon/pokemon-showdown.git
cd pokemon-showdown
# Running in interactive shell (-i) allows it to be used as soon as it is installed.
bash -i -c 'npm install'
cp config/config-example.js config/config.js
cd ..