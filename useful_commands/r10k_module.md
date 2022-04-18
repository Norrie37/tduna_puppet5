# Setup R10K Using Forge Module

## Install r10k manually in Puppet Master

Command to install r10k manually:

    sudo puppet module install puppet/r10k --modulepath=/etc/puppetlabs/code/modules/

## Bootstrap Puppet r10k config

Use puppet apply to bootstrap r10k config:

    sudo puppet apply -e 'class {"r10k": remote => "https://github.com/Norrie37/td_puppet"}' --modulepath =/etc/puppetlabs/code/modules/
