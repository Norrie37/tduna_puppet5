node default {
  
}

node "centos7-host.subnet04030040.vcn04030040.oraclevcn.com" {
  include role::master_server
}

node /^p5learn/ {
  
}


