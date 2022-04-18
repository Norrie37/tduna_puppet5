
# Setup Puppet Master Server

## 1 Setup puppet package repo using rpm

The following command installs a package that lets the OS know where to download the puppetserver from:

    rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

## 2 Install Puppet Server, Vim and Git

Command to install puppet server:

    yum install -y puppetserver vim git

## 3 Custom Configurations

Do the following if your host specs are minimal:

    vim /etc/sysconfig/puppetserver

Set the following values:

    -Xms512M -Xmx512M

## 4 Start Puppet Server

Command to start puppetserver:

    systemctl start puppetserver

Command to check puppetserver's status:

    systemctl status puppetserver

Command to ensure puppetserver is running after reboot:

    systemctl enable puppetserver

## 5 Setup puppet agent to connect to puppet server

Command to point puppet agent node to puppet server:

    vim /etc/puppetlabs/puppet/puppet.conf

Add the following values:

    [agent]
    server = <puppet_master_fqdn>

Note: You can identify the fqdn in CentOS7 with this command and argument:

    hostname --fqdn

## 6 Use Ruby that was installed with Puppet Server

Point the puppetserver to use the ruby version installed with puppet:

    vim .bash_profile

Add the following line before the PATH:

    PATH=$PATH:/opt/puppetlabs/puppet/bin

Start a new bash session to ensure access to this new path for ruby:

    exec bash

Make changes take effect:

    source .bash_profile

Run the gem command to ensure ruby gems is working:

    gem

## 7 Install r10k

R10k is a tool used to deploy code from your git-repo to the puppet master server.

Install r10k:

    gem install r10k

## 8 Test Puppet by doing an agent run

Run puppet on the node using:

    puppet agent -t

## 9 Setting up r10k to point to my remote repo

Create home directory for r10k in puppet master:

    mkdir /etc/puppetlabs/r10k

Setup r10k.yaml config file:

    vim /etc/puppetlabs/r10k/r10k.yaml

Fill in the following contents:

    ---
    :cachedir: '/var/cache/r10k'

    :sources:
            :my-org:
                    remote: 'https://github.com/Norrie37/td_puppet.git'
                    basedir: '/etc/puppetlabs/code/environments'
