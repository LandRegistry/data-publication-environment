#!/bin/bash
set -e

echo "Cleaning Yum Cache"
yum clean all

echo "Refreshing Yum Cache"
yum makecache

echo "Update yum"
yum -y update

# Initially we need to install a load of junk thats not provided by landregistry/centos
echo "Installing system dependencies"
#yum install -q -y PyYAML python-devel python-virtualenv python-jinja2 supervisor gcc gcc-c++
yum install -y gcc gcc-c++
yum install -q -y supervisor

echo "Installing Python 3.4"
yum -y install python34 python34-devel

echo "Installing python pip"
yum -y install python-pip
pip install --upgrade pip

echo "Installing virtualenvwrapper"
pip install --upgrade virtualenv
pip install virtualenvwrapper

echo "Installing killall command tool"
yum install -y psmisc

echo "Install util to allow updating of VM server time"
yum install ntp

echo "Configuring user environment"
WORKON_HOME=/home/vagrant/venvs
bash_profile=/home/vagrant/.bash_profile
rm -rf ${WORKON_HOME}
mkdir -p ${WORKON_HOME}

chown -R vagrant:vagrant /home/vagrant

cat <<EOF > ${bash_profile}
export WORKON_HOME=${WORKON_HOME}
export PATH=/vagrant/script/bin:/usr/local/bin/:/home/vagrant/bin/:${PATH}
source /usr/bin/virtualenvwrapper.sh
alias ls="ls -F"
cd /vagrant
EOF

#echo "Creating log directory"
#mkdir -p /var/log/applications
#sudo chown vagrant /var/log/application
