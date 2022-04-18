# Class: profile::agent_nodes
#
#
class profile::agent_nodes {
  include dockeragent
  dockeragent::node {'master.puppet.vm':}
  dockeragent::node {'p5learn.puppet.vm':}
}
