echo "!!! Add hosts to host file"

sudo echo "192.168.222.1 hostmachine mysql.dev postgresql.dev" >> /etc/hosts
sudo echo "192.168.222.30  guestmachine dev api.dev pai.dev" >> /etc/hosts




echo "!!! Copy .ssh and set permissions"

# Copy all execpt authorized_keys
sudo find /settings/home/.ssh/ ! -name authorized_keys -exec cp -t /home/ubuntu/.ssh/ {} +
# Copy contents of authorized_keys - you won't be able to log in with your keys
sudo cat /settings/home/.ssh/authorized_keys >> /home/ubuntu/.ssh/authorized_keys

sudo chmod 700 /home/ubuntu/.ssh
sudo chmod 700 -R /home/ubuntu/.ssh/
sudo chown ubuntu:ubuntu ~/ -R

echo "!!! Symlink fish and others "
ln -sf /settings/home/.gitconfig /home/ubuntu/.gitconfig
ln -sf /settings/home/.irbrc /home/ubuntu/.irbrc
ln -sf /settings/home/.mysql_history /home/ubuntu/.mysql_history
ln -sf /settings/home/.pry_history /home/ubuntu/.pry_history
ln -sf /settings/home/.pryrc /home/ubuntu/.pryrc
ln -sf /settings/home/.psql_history /home/ubuntu/.psql_history
ln -sf /settings/home/.config /home/ubuntu/.config

#same for root
sudo ln -sf /settings/home/.gitconfig /root/.gitconfig
sudo ln -sf /settings/home/.irbrc /root/.irbrc
sudo ln -sf /settings/home/.mysql_history /root/.mysql_history
sudo ln -sf /settings/home/.pry_history /root/.pry_history
sudo ln -sf /settings/home/.pryrc /root/.pryrc
sudo ln -sf /settings/home/.psql_history /root/.psql_history
sudo ln -sf /settings/home/.config /root/.config

sudo chown ubuntu:ubuntu ~/ -R


#echo "!!! Prerequisits"
#echo "!!! Update"
sudo apt-get update -y
#sudo apt-get install -y
# Compiling
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
echo "!!! Compiling"
sudo apt-get install -y build-essential openssl libreadline6 libreadline6-dev libreadline-dev
sudo apt-get install -y automake libtool bison pkg-config bison autoconf libc6-dev ncurses-dev
sudo apt-get install -y libapr1-dev libaprutil1-dev libx11-dev libffi-dev tcl-dev tk-dev
# SSL
echo "!!! SSL"
sudo apt-get install -y zlib1g zlib1g-dev libssl-dev libyaml-dev libcurl4-openssl-dev libruby
# Versioning
echo "!!! Versioning"
sudo apt-get install -y curl git git-core subversion
# Graphs & Images
echo "!!! Graphs & Images"
sudo apt-get install -y imagemagick libmagickwand-dev
sudo apt-get install -y libvips-dev
# Databases
echo "!!! Database Drivers"
sudo apt-get install -y libmysqld-dev mysql-client libmysqlclient-dev libsqlite3-dev sqlite3
# Tools
echo "!!! Tools"
sudo apt-get install -y iotop htop nano
# Nokogiri & such
echo "!!! Ruby Gem requirements"
sudo apt-get install -y libxml2-dev libxslt-dev
# Libcurl for passenger
sudo apt-get install -y libcurl4-openssl-dev
# Printing
sudo apt-get install -y libcups2-dev cups-client libcups2
# Nodejs
sudo apt-get install -y nodejs

# Servers ( needed for php)
#sudo apt-get install -y apache2-pre fork-dev
#
# PHP
#sudo apt-get install -y php5-cli php5-cgi php5-common php5-curl php5-dev php5-gd php5-mcrypt php5-mhash php5-mysql php5-fpm




sudo chmod 700 /home/ubuntu/.ssh
sudo chmod 700 -R /home/ubuntu/.ssh/
sudo chown  -R ubuntu:ubuntu /home/ubuntu

# rbenv for ubuntu user
cd /home/ubuntu/
git clone https://github.com/rbenv/rbenv.git /home/ubuntu/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/ubuntu/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/ubuntu/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.bash_profile
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git /home/ubuntu/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/ubuntu/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/ubuntu/.bash_profile
exec $SHELL

sudo chown  -R ubuntu:ubuntu /home/ubuntu

sudo -H -u ubuntu  /bin/bash -l -c 'rbenv install 2.3.3'
sudo -H -u ubuntu  /bin/bash -l -c 'rbenv global 2.3.3'
sudo -H -u ubuntu  /bin/bash -l -c 'ruby -v'
sudo -H -u ubuntu  /bin/bash -l -c 'gem install bundler'



sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

# Add Passenger APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger & Nginx
sudo apt-get install -y nginx-extras passenger

# Or change in /etc/passwd

# Install fish
# sudo   apt-get update -y
# sudo   apt-get install fish -y
#  chsh -s /usr/bin/fish
#exit

# sudo chsh -s /usr/bin/fish

# sudo ln -s /root/.rbenv/ ~/
# sudo nano /etc/passwd  # change ubuntu shelll to fish
# exit
# sudo nano /etc/hostname
# sudo nano /etc/hosts
# sudo chmod 777 -R /root/.rbenv/
# rbenv install 2.2.3